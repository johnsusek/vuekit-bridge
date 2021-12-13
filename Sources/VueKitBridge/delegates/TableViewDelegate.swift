import AppKit

class TableViewDelegate: JSDelegate, NSTableViewDelegate, NSTableViewDataSource {
  override var viewName: String { "tableView" }

  func tableViewSelectionDidChange(_ notification: Notification) {
    try? self.handleDelegateInJS("tableViewSelectionDidChange:", [notification as Any]) as Any?
  }

  func numberOfRows(in tableView: NSTableView) -> Int {
    return try! self.handleDelegateInJS("numberOfRowsInTableView:", [tableView]) as Int
  }

  func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
    return try? self.handleDelegateInJS("tableView:objectValueForTableColumn:row:", [tableColumn as Any, row, tableView]) as Any?
  }

  func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
    return try! self.handleDelegateInJS("tableView:viewForTableColumn:row:", [tableColumn as Any, row, tableView]) as NSView?
  }
}
