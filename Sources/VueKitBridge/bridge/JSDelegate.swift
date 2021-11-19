import AppKit
import JavaScriptCore

class JSDelegate: NSObject {
  let node: VueKitNode
  var viewName: String { "" }
  let jsFunction = BridgeTender.current.context.evaluateScript("Function")!

  init(node: VueKitNode) {
    self.node = node
  }

  override func responds(to aSelector: Selector) -> Bool {
    let selector = String(describing: aSelector)
    let callbackName = selectorToCallbackName(aSelector)

    let selectorParts = selector.split(separator: ":")

    // Never respond to private selectors (that start with an underscore)
    if selectorParts.first != nil, selectorParts.first!.starts(with: "_") {
      return false
    }

    guard let responds = node.props.value?.hasProperty(callbackName) else {
      print("[bridge:delegate] node.props.value false!")
      return false
    }

    if (!responds) {
      return false
    }

    let callbackValue = node.props.value.forProperty(callbackName)!

    if (!callbackValue.isInstance(of: jsFunction)) {
      print("[bridge:delegate] Error: \(callbackName) is not a function!")
      return false
    }

    print("[bridge:delegate] Found \(callbackName) for (\(selector))")

    return true
  }

  func callJSDelegate(_ propName: String, _ args: [Any]) throws -> JSValue? {
    if (node.props?.value == nil) {
      throw DelegateHandlerError.missingNodeProps
    }

    guard node.props.value.hasProperty(propName), let fn = node.props.value.forProperty(propName) else {
      throw DelegateHandlerError.missingJSHandler
    }

    // Need to reference `self` as an argument, or else
    // callJSDelegate is never called (weak v strong self ref?)
    return fn.call(withArguments: args + [self.node, self] )
  }

  func handleDelegateInJS<T>(_ delegatePropName: String, _ args: [Any]) throws -> T {
    // This is a force-try, ultimately, because it is unknowable what to return
    // from unimplemented-in-js delegates. Working backwards from this fact, we must throw
    // in our VueKitNode delegate extension functions, since we can't know what to return.
    //
    // For example if a delegate fn returns [NSTextCheckingResult], but is unimplemented in js,
    // then we would need to construct a NSTextCheckingResult in that case to return *something*
    // to even make the swift compile. But how do we know how to construct arbitrary objects like this?
    //
    // So, since our delegate extensions all must throw when unimplemented, this function
    // which is called by them must as well. The good news is, "this should never fail",
    // because responds(to:) will check the node props for a js implementation of the delegate fn,
    // before allowing the objc runtime to send us these delegate selectors.

    let res = try! self.callJSDelegate(delegatePropName, args)

    // print("[bridge:delegate] Responded \(delegatePropName):", res!)

    let responseObject = res!.toObject()! as! T
    return responseObject
  }

  func selectorToCallbackName(_ sel: Selector) -> String {
    var selString = String(describing: sel)
    let capitalizedViewName = self.viewName.capitalizingFirstLetter()

    // TODO: refactor to a selString -> callbackName fn

    if (selString.hasSuffix("In" + capitalizedViewName + ":")) {
      selString = selString.replacingOccurrences(of: "In" + capitalizedViewName + ":", with: "")
    }

    if (selString.hasSuffix("For" + capitalizedViewName + ":")) {
      selString = selString.replacingOccurrences(of: "For" + capitalizedViewName + ":", with: "")
    }

    if (selString.hasSuffix(capitalizedViewName + ":")) {
      selString = selString.replacingOccurrences(of: capitalizedViewName + ":", with: "")
    }

    if (selString.hasPrefix(self.viewName + ":")) {
      selString = selString.replacingOccurrences(of: self.viewName + ":", with: "")
    }

    let selector = "on" + selString
      .split(separator: ":")
      .enumerated()
      .filter { i,a in
        return !(a == self.viewName && i == 0)
      }
      .map { String($0.element).capitalizingFirstLetter() }
      .joined()


    return selector
  }
}
