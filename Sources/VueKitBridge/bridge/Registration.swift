import AppKit
import JavaScriptCore
import FrameworkBridge
import SwiftyJSON

class Registration {
  var context: JSContext!

  init(context: JSContext) {
    self.context = context
  }

  func registerClasses() {
    guard let frameworkFileUrl = Bundle.main.url(forResource: "classesToRegister", withExtension: "json") else {
      NSLog("Could not load classesToRegister.json")
      exit(1)
    }

    guard let frameworkData = try? Data(contentsOf: frameworkFileUrl) else {
      NSLog("Could not load data at \(frameworkFileUrl)")
      exit(1)
    }

    guard let frameworks = try? JSON(data: frameworkData) else {
      NSLog("Could not parse JSON")
      exit(1)
    }

    for (_, classes): (String, JSON) in frameworks {
      for (_, className) in classes {
        _ = context.bridgeClass("\(className)");
      }
    }

    context.setObject(DispatchQueue.self, forKeyedSubscript: "DispatchQueue" as (NSCopying & NSObjectProtocol)?)
    _ = context.bridgeClass("VueKitNode");
  }
}
