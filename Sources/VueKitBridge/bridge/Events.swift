import AppKit
import JavaScriptCore

class Events {
  static let eventsToMonitor: NSEvent.EventTypeMask = [
    // TODO: allow user to opt into expensive events when they need them
    //      .mouseMoved,
    //      .cursorUpdate,
    .leftMouseDown,
    .leftMouseUp,
    .rightMouseDown,
    .rightMouseUp,
    .leftMouseDragged,
    .rightMouseDragged,
    .mouseEntered,
    .mouseExited,
    .keyDown,
    .keyUp,
    .flagsChanged,
    .appKitDefined,
    .systemDefined,
    .applicationDefined,
    .periodic,
    .scrollWheel,
    .tabletPoint,
    .tabletProximity,
    .otherMouseDown,
    .otherMouseUp,
    .otherMouseDragged,
    .gesture,
    .magnify,
    .swipe,
    .rotate,
    .beginGesture,
    .endGesture,
    .smartMagnify,
    .pressure,
    .directTouch,
    .changeMode
  ]

  func startMonitoring() {
    NSEvent.addLocalMonitorForEvents(matching: Events.eventsToMonitor) {
      event in

      let point = event.locationInWindow
      guard let view = event.window?.contentView?.hitTest(point) else { return event }
      guard let viewNode = VueKitNode.Nodes[view] else { return event }

      // Todo: fill in addl info from NSEvent
      // passing an NSEvent itself causes this error:
      // Invalid message sent to event "NSEvent" ....
      // So fix that, or create a serialized subset of NSEvent for payload purposes
      var payload: [String: Any] = [:]
      payload["type"] = event.type.rawValue
      viewNode.emitEvent.value.call(withArguments: [viewNode, event, "\(event)"])

      return event
    }
  }
}
