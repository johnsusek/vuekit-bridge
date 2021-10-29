import AppKit

class TextFieldDelegate: JSDelegate, NSTextFieldDelegate, NSControlTextEditingDelegate {
  override var viewName: String { "textField" }

  //  optional func textField(_ textField: NSTextField, textView: NSTextView, candidatesForSelectedRange selectedRange: NSRange) -> [Any]?
  //  optional func textField(_ textField: NSTextField, textView: NSTextView, candidates: [NSTextCheckingResult], forSelectedRange selectedRange: NSRange) -> [NSTextCheckingResult]
  //  optional func textField(_ textField: NSTextField, textView: NSTextView, shouldSelectCandidateAt index: Int) -> Bool
//  override func responds(to aSelector: Selector) -> Bool {
//    let selector = String(describing: aSelector)
//
//    if (selector == "control:textView:doCommandBySelector:") {
//      return true;
//    }
//
//    let callbackName = selectorToCallbackName(aSelector)
//
//    let selectorParts = selector.split(separator: ":")
//
//    if selectorParts.first != nil, selectorParts.first!.starts(with: "_") {
//      return false
//    }
//
//    let responds = node.props.value.hasProperty(callbackName)
//
//    return responds
//  }

//  func textField(_ textField: NSTextField, textView: NSTextView, shouldSelectCandidateAt index: Int) -> Bool {
//    return try! self.handleDelegateInJS("onShouldSelectCandidateAt", [textField, textView, index])
//  }

  //  optional func controlTextDidBeginEditing(_ obj: Notification)
  //  optional func controlTextDidEndEditing(_ obj: Notification)
  //  optional func controlTextDidChange(_ obj: Notification)
  //  optional func control(_ control: NSControl, textShouldBeginEditing fieldEditor: NSText) -> Bool
  //  optional func control(_ control: NSControl, textShouldEndEditing fieldEditor: NSText) -> Bool

//  func controlTextDidBeginEditing(_ obj: Notification) {
//    _ = try! self.callJSDelegate("onControlTextDidBeginEditing", [])
//  }
//
//  func controlTextDidEndEditing(_ obj: Notification) {
//    _ = try! self.callJSDelegate("onControlTextDidEndEditing", [])
//  }
//
//  func controlTextDidChange(_ obj: Notification) {
//    _ = try! self.callJSDelegate("onControlTextDidChange", [])
//  }
//
//  func control(_ control: NSControl, textShouldEndEditing fieldEditor: NSText) -> Bool {
//    return try! self.handleDelegateInJS("onTextShouldEndEditing", [control, fieldEditor])
//  }
//
//  func control(_ control: NSControl, textShouldBeginEditing fieldEditor: NSText) -> Bool {
//    return try! self.handleDelegateInJS("onTextShouldBeginEditing", [control, fieldEditor])
//  }

  //  optional func control(_ control: NSControl, didFailToFormatString string: String, errorDescription error: String?) -> Bool
  //  optional func control(_ control: NSControl, didFailToValidatePartialString string: String, errorDescription error: String?)
  //  optional func control(_ control: NSControl, isValidObject obj: Any?) -> Bool
  //  optional func control(_ control: NSControl, textView: NSTextView, doCommandBy commandSelector: Selector) -> Bool

//  func control(_ control: NSControl, textView: NSTextView, doCommandBy commandSelector: Selector) -> Bool {
//    let callbackName = selectorToCallbackName(commandSelector)
//    let preventDefault = false
//    let responds = node.props.value.hasProperty(callbackName)
//
//    if (!responds) {
//      return preventDefault
//    }
//
//    guard node.props.value.hasProperty(callbackName), let fn = node.props.value.forProperty(callbackName) else {
//      return preventDefault
//    }
//
//    fn.call(withArguments: [])
//
//    return preventDefault
//  }
}
