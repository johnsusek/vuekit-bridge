import AppKit
import JavaScriptCore

enum DelegateHandlerError: Error {
  case missingJSHandler
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

@objc class VueKitNode: NSObject, VueKitNodeJSExport, NSTableViewDelegate, NSTableViewDataSource  {
  var instance: NSObject?
  var props: JSManagedValue!
  var emitEvent: JSManagedValue
  var emitAction: JSManagedValue

  var children: [VueKitNode]

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

    if let control = instance as? NSControl {
      control.target = self
      control.action = #selector(self.action)
    }

    if let textField = instance as? NSTextField {
      let delegate = TextFieldDelegate(node: self)
      textField.delegate = delegate
    }

    if let tableView = instance as? NSTableView {
      let delegate = TableViewDelegate(node: self)
      tableView.delegate = delegate
      tableView.dataSource = delegate
    }
  }

  // MARK: - Instance Methods

  @objc func destroy() {
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
