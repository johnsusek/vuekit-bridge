import AppKit

class OutlineViewDelegate: TableViewDelegate, NSOutlineViewDelegate, NSOutlineViewDataSource {
  override var viewName: String { "outlineView" }

  func outlineViewSelectionDidChange(_ notification: Notification) {
    try? self.handleDelegateInJS("outlineViewSelectionDidChange:", [notification as Any]) as Any?
  }

  func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
    return try! self.handleDelegateInJS("outlineView:numberOfChildrenOfItem:", [item as Any, outlineView]) as Int
  }

  func outlineView(_ outlineView: NSOutlineView, rowViewForItem item: Any) -> NSTableRowView? {
    return try! self.handleDelegateInJS("outlineView:rowViewForItem", [item as Any, item, outlineView]) as NSTableRowView?
  }

  func outlineView(_ outlineView: NSOutlineView, objectValueFor tableColumn: NSTableColumn?, byItem item: Any?) -> Any? {
    return try? self.handleDelegateInJS("outlineView:objectValueForTableColumn:byItem:", [tableColumn as Any, item as Any, outlineView]) as Any?
  }

  func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
    return try! self.handleDelegateInJS("outlineView:viewForTableColumn:item:", [tableColumn as Any, item, outlineView]) as NSView?
  }

  func outlineView(_ outlineView: NSOutlineView, isGroupItem item: Any) -> Bool {
    return try! self.handleDelegateInJS("outlineView:isGroupItem:", [item as Any, outlineView]) as Bool
  }

  func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
    return try! self.handleDelegateInJS("outlineView:child:ofItem:", [index, item as Any, outlineView]) as Any
  }

  func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
    return try! self.handleDelegateInJS("outlineView:isItemExpandable:", [item as Any, outlineView]) as Bool
  }

  func outlineView(_ outlineView: NSOutlineView, setObjectValue object: Any?, for tableColumn: NSTableColumn?, byItem item: Any?) {
    _ = try? self.handleDelegateInJS("outlineView:setObjectValue:for:byItem:", [object as Any, tableColumn as Any, item as Any, outlineView]) as Any?
  }
}
