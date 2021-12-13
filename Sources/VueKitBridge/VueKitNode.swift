import AppKit
import JavaScriptCore

enum DelegateHandlerError: Error {
  case missingJSHandler
  case missingNodeProps
}

@objc protocol VueKitNodeJSExport: JSExport {
  static func create(_ instance: NSObject, _ props: JSValue, _ emitEvent: JSValue?, _ emitAction: JSValue?) -> (VueKitNode)

  var instance: NSObject? { @objc get @objc set }
  var props: JSManagedValue! { @objc get @objc set }
  var emitEvent: JSManagedValue { @objc get @objc set }
  var emitAction: JSManagedValue { @objc get @objc set }

  var children: [VueKitNode] { @objc get @objc set }

  func destroy()
}

@objc(VueKitNode) public class VueKitNode: NSObject, VueKitNodeJSExport, NSTableViewDelegate, NSTableViewDataSource  {
  var instance: NSObject?
  var props: JSManagedValue!
  var emitEvent: JSManagedValue
  var emitAction: JSManagedValue

  var children: [VueKitNode]
  var delegate: JSDelegate?

  // MARK: - Static

  @objc static var Nodes: [NSObject: VueKitNode] = [:]

  @objc class func create(_ instance: NSObject, _ props: JSValue, _ emitEvent: JSValue?, _ emitAction: JSValue?) -> (VueKitNode) {
    return VueKitNode(instance: instance, props: JSManagedValue(value: props), emitEvent: JSManagedValue(value: emitEvent), emitAction: JSManagedValue(value: emitAction))
  }

  // MARK: - Initializers

  init(instance: NSObject, props: JSManagedValue, emitEvent: JSManagedValue, emitAction: JSManagedValue) {
    self.instance = instance
    self.props = props
    self.emitEvent = emitEvent
    self.emitAction = emitAction
    self.children = []

    super.init()

    VueKitNode.Nodes[instance] = self

    // Keep ARC reference to props so that they aren't deallocated
    // In theory if these are available in the JS object graph they shouldn't
    // be deallocated, but they seem to disappear anyways.
    // Should re-visit this and perhaps try adding props directly to globalThis
    // so we don't have to do this in Swift
    BridgeTender.current.context.virtualMachine.addManagedReference(self.props, withOwner: self)

    if let control = instance as? NSControl {
      control.target = self
      control.action = #selector(self.action)
    }

    // TODO: set delegate to a JS object, will fns be called there?
    // (export a JS object that respondsTo everything?)

    if let textField = instance as? NSTextField {
      delegate = TextFieldDelegate(node: self)
      textField.delegate = delegate as? NSTextFieldDelegate
    }
    else if let collectionView = instance as? NSCollectionView {
      delegate = CollectionViewDelegate(node: self)
      collectionView.delegate = delegate as? NSCollectionViewDelegate
      collectionView.dataSource = delegate as? NSCollectionViewDataSource
    }
    else if let outlineView = instance as? NSOutlineView {
      delegate = OutlineViewDelegate(node: self)
      outlineView.delegate = delegate as? NSOutlineViewDelegate
      outlineView.dataSource = delegate as? NSOutlineViewDataSource
    }
    else if let tableView = instance as? NSTableView {
      delegate = TableViewDelegate(node: self)
      tableView.delegate = delegate as? NSTableViewDelegate
      tableView.dataSource = delegate as? NSTableViewDataSource
    }
    else if let browserView = instance as? NSBrowser {
      delegate = BrowserDelegate(node: self)
      browserView.delegate = delegate as? NSBrowserDelegate
    }
  }

  // MARK: - Instance Methods

  @objc func destroy() {
    BridgeTender.current.context.virtualMachine.removeManagedReference(self.props, withOwner: self)

    if (self.instance != nil) {
      VueKitNode.Nodes.removeValue(forKey: self.instance!)
    }
  }

  @objc func action(_ sender: NSControl) {
    guard let event = NSApp.currentEvent else { return }
    guard let emit = emitAction.value else { return }
    emit.call(withArguments: [self, event, "\(event)"])
  }
}
