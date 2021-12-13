import AppKit

class BrowserDelegate: JSDelegate, NSBrowserDelegate {
  override var viewName: String { "browser" }

  func rootItem(for browser: NSBrowser) -> Any? {
    return try? self.handleDelegateInJS("rootItem:for", [browser as Any]) as Any?
  }

  func browser(_ browser: NSBrowser, numberOfChildrenOfItem item: Any?) -> Int {
    return try! self.handleDelegateInJS("numberOfChildrenOfItem:", [item as Any, browser]) as Int
  }

  func browser(_ browser: NSBrowser, child index: Int, ofItem item: Any?) -> Any {
    return try! self.handleDelegateInJS("child:ofItem:", [index, item as Any, browser]) as Any
  }

  func browser(_ browser: NSBrowser, isLeafItem item: Any?) -> Bool {
    return try! self.handleDelegateInJS("isLeafItem:", [item as Any, browser]) as Bool
  }

  func browser(_ browser: NSBrowser, objectValueForItem item: Any?) -> Any? {
    return try? self.handleDelegateInJS("objectValueForItem", [item as Any, browser]) as Any?
  }
}
