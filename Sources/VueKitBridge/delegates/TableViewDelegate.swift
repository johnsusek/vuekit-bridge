import AppKit

class TableViewDelegate: JSDelegate, NSTableViewDelegate, NSTableViewDataSource {
  override var viewName: String { "tableView" }

  func numberOfRows(in tableView: NSTableView) -> Int {
    let sel = selectorToCallbackName(Selector("numberOfRowsInTableView:"))
    return try! self.handleDelegateInJS(sel, [tableView]) as Int
  }

  func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
    let sel = selectorToCallbackName(Selector("tableView:objectValueForTableColumn:row:"))
    return try? self.handleDelegateInJS(sel, [tableView, tableColumn as Any, row]) as Any?
  }

  func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
    let sel = selectorToCallbackName(Selector("tableView:viewForTableColumn:row:"))
    return try! self.handleDelegateInJS(sel, [tableView, tableColumn as Any, row]) as NSView?
  }
}
