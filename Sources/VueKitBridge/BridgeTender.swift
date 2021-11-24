import AppKit
import JavaScriptCore

public class BridgeTender {
  static var current: BridgeTender! // Used in JSOverridableView.drawOverride
  let context: JSContext!

  public init(context: JSContext) {
    NSLog("[bridge] ⟁ VueKit bridge starting...")

    self.context = context
    BridgeTender.current = self

    let registration = Registration(context: context)
    registration.registerClasses()

    context.exceptionHandler = BridgeTender.contextExceptionHandler
    NSSetUncaughtExceptionHandler { e in BridgeTender.uncaughtExceptionHandler(e) }

    let polyfills = PolyFills(context: context)
    polyfills.install()

    Events.startMonitoring()
  }

  public func loadJSBundle() {
    guard let bundleUrl = Bundle.main.url(forResource: "vuekit-bundle.es", withExtension: "js") else {
      NSLog("Could not find bundle js at app bundle root. Please run `npm run build:vue`")
      NSApp.terminate(self)
      return
    }

    do {
      let script = try String(contentsOf: bundleUrl, encoding: .utf8)
      context.evaluateScript(script)
    } catch {
      print(error)
    }
  }

  class func contextExceptionHandler(_: JSContext?, value: JSValue?) {
    guard let exception = value else {
      NSLog("[bridge:error] JS Exception: nil")
      return
    }

    let name = exception.objectForKeyedSubscript("name").toString() ?? " "
    let message = exception.objectForKeyedSubscript("message").toString() ?? " "
    let moreInfo = "\(name): \(message)"

    NSLog("[bridge:error] \(moreInfo)")
  }

  class func uncaughtExceptionHandler(_ exception: NSException) {
    let stack = exception.callStackReturnAddresses
    NSLog("[bridge:error] \(exception): \(stack)")
  }
}
