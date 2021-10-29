import AppKit
import JavaScriptCore
import VueKitBridge

let allClasses = [
  "AVAsset",
  "AVAssetCache",
  "AVAssetImageGenerator",
  "AVAssetReader",
  "AVAssetReaderOutputMetadataAdaptor",
  "AVAssetResourceLoader",
  "AVAssetResourceLoadingRequest",
  "AVAssetResourceLoadingRequestor",
  "AVAssetResourceRenewalRequest",
  "AVAssetTrackGroup",
  "AVAssetTrackSegment",
  "AVAssetWriter",
  "AVAssetWriterInputMetadataAdaptor",
  "AVAssetWriterInputPassDescription",
  "AVAsynchronousCIImageFilteringRequest",
  "AVAudioBuffer",
  "AVAudioChannelLayout",
  "AVAudioCompressedBuffer",
  "AVAudioConnectionPoint",
  "AVAudioConverter",
  "AVAudioEnvironmentDistanceAttenuationParameters",
  "AVAudioEnvironmentReverbParameters",
  "AVAudioFile",
  "AVAudioMix",
  "AVAudioMixingDestination",
  "AVAudioPlayer",
  "AVAudioRecorder",
  "AVAudioSequencer",
  "AVAudioTime",
  "AVAudioUnitComponent",
  "AVAudioUnitComponentManager",
  "AVAudioUnitEQFilterParameters",
  "AVCameraCalibrationData",
  "AVCaptureAudioChannel",
  "AVCaptureAudioDataOutput",
  "AVCaptureAudioPreviewOutput",
  "AVCaptureConnection",
  "AVCaptureDevice",
  "AVCaptureDeviceInput",
  "AVCaptureInput",
  "AVCaptureOutput",
  "AVCaptureScreenInput",
  "AVCaptureSession",
  "AVCaptureView",
  "AVComposition",
  "AVCompositionTrackSegment",
  "AVContentKeyRequest",
  "AVContentKeyResponse",
  "AVContentKeySession",
  "AVDateRangeMetadataGroup",
  "AVFragmentedAssetMinder",
  "AVFragmentedMovieMinder",
  "AVFrameRateRange",
  "AVMediaDataStorage",
  "AVMediaSelection",
  "AVMediaSelectionOption",
  "AVMetadataBodyObject",
  "AVMetadataCatBodyObject",
  "AVMetadataDogBodyObject",
  "AVMetadataFaceObject",
  "AVMetadataGroup",
  "AVMetadataHumanBodyObject",
  "AVMetadataItemFilter",
  "AVMetadataItemValueRequest",
  "AVMetadataObject",
  "AVMetadataSalientObject",
  "AVMIDIPlayer",
  "AVMusicTrack",
  "AVMutableAudioMix",
  "AVMutableComposition",
  "AVMutableDateRangeMetadataGroup",
  "AVMutableMediaSelection",
  "AVMutableVideoComposition",
  "AVMutableVideoCompositionInstruction",
  "AVMutableVideoCompositionLayerInstruction",
  "AVPersistableContentKeyRequest",
  "AVPictureInPictureController",
  "AVPlayer",
  "AVPlayerItemAccessLog",
  "AVPlayerItemErrorLog",
  "AVPlayerItemErrorLogEvent",
  "AVPlayerItemLegibleOutput",
  "AVPlayerItemMediaDataCollector",
  "AVPlayerItemMetadataCollector",
  "AVPlayerItemMetadataOutput",
  "AVPlayerItemOutput",
  "AVPlayerItemTrack",
  "AVPlayerLooper",
  "AVPlayerMediaSelectionCriteria",
  "AVPlayerView",
  "AVRouteDetector",
  "AVSampleBufferAudioRenderer",
  "AVSampleBufferRequest",
  "AVSpeechSynthesisVoice",
  "AVSpeechSynthesizer",
  "AVSpeechUtterance",
  "AVTextStyleRule",
  "AVURLAsset",
  "AVVideoComposition",
  "AVVideoCompositionCoreAnimationTool",
  "AVVideoCompositionInstruction",
  "AVVideoCompositionLayerInstruction",
  "AVVideoCompositionRenderHint",
  // "BlockOperation",
  "CAAnimation",
  "CAAnimationGroup",
  "CABasicAnimation",
  // "CachedURLResponse",
  "CAConstraint",
  "CAConstraintLayoutManager",
  "CAEDRMetadata",
  "CAEmitterCell",
  "CAEmitterLayer",
  "CAGradientLayer",
  "CAKeyframeAnimation",
  "CALayer",
  "CAMetalLayer",
  "CAPropertyAnimation",
  "CARemoteLayerClient",
  "CARemoteLayerServer",
  "CARenderer",
  "CAReplicatorLayer",
  "CAScrollLayer",
  "CAShapeLayer",
  "CASpringAnimation",
  "CATextLayer",
  "CATiledLayer",
  "CATransaction",
  "CATransformLayer",
  "CATransition",
  "CAValueFunction",
  "CIAztecCodeDescriptor",
  "CIBarcodeDescriptor",
  "CIDetector",
  "CIFaceFeature",
  "CIFeature",
  "CIFilterGenerator",
  "CIFilterShape",
  "CIImageAccumulator",
  "CIImageProcessorKernel",
  "CIKernel",
  "CIPDF417CodeDescriptor",
  "CIPlugIn",
  "CIQRCodeFeature",
  "CIRectangleFeature",
  "CIRenderDestination",
  "CIRenderInfo",
  "CIRenderTask",
  "CISampler",
  "CITextFeature",
  "CIWarpKernel",
  // "Dimension",
  // "HTTPURLResponse",
  "IKCameraDeviceView",
  "IKDeviceBrowserView",
  "IKFilterBrowserView",
  "IKFilterUIView",
  "IKImageBrowserCell",
  "IKImageEditPanel",
  "IKPictureTaker",
  "IKSaveOptions",
  "IKScannerDeviceView",
  "IKSlideshow",
  // "JSONSerialization",
  "NSAccessibilityCustomAction",
  "NSAccessibilityCustomRotor",
  "NSActionCell",
  "NSAffineTransform",
  "NSAlert",
  "NSAlignmentFeedbackFilter",
  "NSAnimation",
  "NSAnimationContext",
  "NSAppearance",
  "NSAppleEventManager",
  "NSAppleScript",
  "NSApplication",
  "NSAssertionHandler",
  "NSATSTypesetter",
  "NSAttributedString",
  "NSBackgroundActivityScheduler",
  "NSBezierPath",
  "NSBindingSelectionMarker",
  "NSBox",
  "NSBrowserCell",
  "NSButton",
  "NSButtonCell",
  "NSButtonTouchBarItem",
  "NSCell",
  "NSCharacterSet",
  "NSClassDescription",
  "NSClickGestureRecognizer",
  "NSClipView",
  "NSCloneCommand",
  "NSCloseCommand",
  "NSCollectionLayoutAnchor",
  "NSCollectionLayoutBoundarySupplementaryItem",
  "NSCollectionLayoutDecorationItem",
  "NSCollectionLayoutDimension",
  "NSCollectionLayoutEdgeSpacing",
  "NSCollectionLayoutGroup",
  "NSCollectionLayoutGroupCustomItem",
  "NSCollectionLayoutItem",
  "NSCollectionLayoutSection",
  "NSCollectionLayoutSize",
  "NSCollectionLayoutSpacing",
  "NSCollectionLayoutSupplementaryItem",
  "NSCollectionView",
  "NSCollectionViewCompositionalLayout",
  "NSCollectionViewCompositionalLayoutConfiguration",
  "NSCollectionViewFlowLayout",
  "NSCollectionViewGridLayout",
  "NSCollectionViewItem",
  "NSCollectionViewLayout",
  "NSCollectionViewLayoutAttributes",
  "NSCollectionViewTransitionLayout",
  "NSCollectionViewUpdateItem",
  "NSColorList",
  "NSColorPanel",
  "NSColorPicker",
  "NSColorPickerTouchBarItem",
  "NSColorSampler",
  "NSColorWell",
  "NSComboBox",
  "NSComboBoxCell",
  "NSComparisonPredicate",
  "NSCompoundPredicate",
  "NSCondition",
  "NSConditionLock",
  "NSControl",
  "NSController",
  "NSCountCommand",
  "NSCreateCommand",
  "NSCursor",
  "NSCustomTouchBarItem",
  "NSData",
  "NSDataAsset",
  "NSDataDetector",
  "NSDate",
  "NSDateComponents",
  "NSDatePicker",
  "NSDatePickerCell",
  "NSDecimalNumberHandler",
  "NSDeleteCommand",
  "NSDictionaryControllerKeyValuePair",
  "NSDistributedLock",
  "NSDockTile",
  "NSDraggingImageComponent",
  "NSDraggingItem",
  "NSDraggingSession",
  "NSError",
  "NSEvent",
  "NSException",
  "NSExistsCommand",
  "NSExtensionContext",
  "NSExtensionItem",
  "NSFileAccessIntent",
  "NSFileCoordinator",
  "NSFilePromiseProvider",
  "NSFilePromiseReceiver",
  "NSFileProviderService",
  "NSFileSecurity",
  "NSFileVersion",
  "NSFontAssetRequest",
  "NSFontCollection",
  "NSFontDescriptor",
  "NSFontManager",
  "NSFontPanel",
  "NSFormCell",
  "NSGestureRecognizer",
  "NSGetCommand",
  "NSGlyphGenerator",
  "NSGlyphInfo",
  "NSGridCell",
  "NSGridColumn",
  "NSGridRow",
  "NSGridView",
  "NSGroupTouchBarItem",
  "NSHapticFeedbackManager",
  "NSHelpManager",
  "NSImage",
  "NSImageCell",
  "NSImageView",
  "NSIndexPath",
  "NSIndexSet",
  "NSIndexSpecifier",
  "NSItemProvider",
  "NSLayoutAnchor",
  "NSLayoutConstraint",
  "NSLayoutDimension",
  "NSLayoutGuide",
  "NSLayoutManager",
  "NSLayoutXAxisAnchor",
  "NSLayoutYAxisAnchor",
  "NSLevelIndicator",
  "NSLevelIndicatorCell",
  "NSLinguisticTagger",
  "NSLocale",
  "NSLock",
  "NSLogicalTest",
  "NSMagnificationGestureRecognizer",
  "NSMediaLibraryBrowserController",
  "NSMenu",
  "NSMenuItem",
  "NSMenuItemCell",
  "NSMenuToolbarItem",
  "NSMetadataItem",
  "NSMetadataQuery",
  "NSMetadataQueryAttributeValueTuple",
  "NSMetadataQueryResultGroup",
  "NSMiddleSpecifier",
  "NSMoveCommand",
  "NSMutableAttributedString",
  "NSMutableCharacterSet",
  "NSMutableData",
  "NSMutableFontCollection",
  "NSMutableIndexSet",
  "NSMutableParagraphStyle",
  "NSMutableURLRequest",
  "NSNameSpecifier",
  "NSNib",
  "NSNotification",
  "NSNull",
  "NSOpenGLView",
  "NSOpenPanel",
  "NSOrderedCollectionDifference",
  "NSOrthography",
  "NSOutlineView",
  "NSPageController",
  "NSPageLayout",
  "NSPanel",
  "NSPanGestureRecognizer",
  "NSParagraphStyle",
  "NSPasteboard",
  "NSPasteboardItem",
  "NSPathCell",
  "NSPathComponentCell",
  "NSPathControl",
  "NSPathControlItem",
  "NSPDFPanel",
  "NSPersonNameComponents",
  "NSPickerTouchBarItem",
  "NSPointerArray",
  "NSPointerFunctions",
  "NSPopover",
  "NSPopoverTouchBarItem",
  "NSPopUpButtonCell",
  "NSPositionalSpecifier",
  "NSPredicate",
  "NSPredicateEditor",
  "NSPredicateEditorRowTemplate",
  "NSPressGestureRecognizer",
  "NSPressureConfiguration",
  "NSPrinter",
  "NSPrintOperation",
  "NSPrintPanel",
  "NSProgressIndicator",
  "NSPropertySpecifier",
  "NSProxy",
  "NSPurgeableData",
  "NSQuitCommand",
  "NSRandomSpecifier",
  "NSRangeSpecifier",
  "NSRecursiveLock",
  "NSRegularExpression",
  "NSRelativeSpecifier",
  "NSResponder",
  "NSRotationGestureRecognizer",
  "NSRuleEditor",
  "NSRulerMarker",
  "NSRulerView",
  "NSRunningApplication",
  "NSSavePanel",
  "NSScreen",
  "NSScriptClassDescription",
  "NSScriptCoercionHandler",
  "NSScriptCommand",
  "NSScriptCommandDescription",
  "NSScriptExecutionContext",
  "NSScriptObjectSpecifier",
  "NSScriptSuiteRegistry",
  "NSScriptWhoseTest",
  "NSScroller",
  "NSScrollView",
  "NSScrubber",
  "NSScrubberArrangedView",
  "NSScrubberFlowLayout",
  "NSScrubberImageItemView",
  "NSScrubberItemView",
  "NSScrubberLayout",
  "NSScrubberLayoutAttributes",
  "NSScrubberProportionalLayout",
  "NSScrubberSelectionStyle",
  "NSScrubberSelectionView",
  "NSScrubberTextItemView",
  "NSSearchField",
  "NSSearchFieldCell",
  "NSSecureTextField",
  "NSSecureTextFieldCell",
  "NSSecureUnarchiveFromDataTransformer",
  "NSSegmentedCell",
  "NSSegmentedControl",
  "NSSetCommand",
  "NSShadow",
  "NSSharingService",
  "NSSharingServicePicker",
  "NSSharingServicePickerToolbarItem",
  "NSSharingServicePickerTouchBarItem",
  "NSSlider",
  "NSSliderAccessory",
  "NSSliderAccessoryBehavior",
  "NSSliderCell",
  "NSSliderTouchBarItem",
  "NSSortDescriptor",
  "NSSound",
  "NSSpecifierTest",
  "NSSpeechRecognizer",
  "NSSpeechSynthesizer",
  "NSSpellChecker",
  "NSSpellServer",
  "NSSplitView",
  "NSSplitViewController",
  "NSSplitViewItem",
  "NSStackView",
  "NSStatusBar",
  "NSStatusBarButton",
  "NSStatusItem",
  "NSStepper",
  "NSStepperCell",
  "NSStepperTouchBarItem",
  "NSStoryboard",
  "NSStoryboardSegue",
  "NSStringDrawingContext",
  "NSSwitch",
  "NSTableCellView",
  "NSTableColumn",
  "NSTableHeaderCell",
  "NSTableHeaderView",
  "NSTableRowView",
  "NSTableView",
  "NSTableViewRowAction",
  "NSTabView",
  "NSTabViewController",
  "NSTabViewItem",
  "NSText",
  "NSTextAlternatives",
  "NSTextAttachment",
  "NSTextAttachmentCell",
  "NSTextBlock",
  "NSTextCheckingController",
  "NSTextCheckingResult",
  "NSTextField",
  "NSTextFieldCell",
  "NSTextFinder",
  "NSTextInputContext",
  "NSTextList",
  "NSTextTab",
  "NSTextTable",
  "NSTextTableBlock",
  "NSTextView",
  "NSTitlebarAccessoryViewController",
  "NSTokenField",
  "NSTokenFieldCell",
  "NSToolbar",
  "NSToolbarItem",
  "NSToolbarItemGroup",
  "NSTouch",
  "NSTouchBar",
  "NSTouchBarItem",
  "NSTrackingArea",
  "NSTypesetter",
  "NSUniqueIDSpecifier",
  "NSURL",
  "NSURLComponents",
  "NSURLConnection",
  "NSURLDownload",
  "NSURLHandle",
  "NSURLQueryItem",
  "NSURLRequest",
  "NSUserActivity",
  "NSUserAppleScriptTask",
  "NSUserAutomatorTask",
  "NSUserDefaultsController",
  "NSUserInterfaceCompressionOptions",
  "NSUserNotification",
  "NSUserNotificationAction",
  "NSUserNotificationCenter",
  "NSUserScriptTask",
  "NSUserUnixTask",
  "NSUUID",
  "NSValue",
  "NSView",
  "NSViewAnimation",
  "NSViewController",
  "NSVisualEffectView",
  "NSWhoseSpecifier",
  "NSWindow",
  "NSWindowController",
  "NSWindowTab",
  "NSWindowTabGroup",
  "NSWorkspace",
  "NSXPCConnection",
  "NSXPCListener",
  "NSXPCListenerEndpoint",
  // "Operation",
  // "Pipe",
  // "Process",
  "QCComposition",
  "QCCompositionRepository",
  "QCPlugIn",
  "QLPreviewPanel",
  "QLPreviewView",
  "QuartzFilter",
  "QuartzFilterManager",
  "QuartzFilterView",
  // "Unit",
  // "UnitAcceleration",
  // "UnitAngle",
  // "UnitArea",
  // "UnitDispersion",
  // "UnitDuration",
  // "UnitElectricCharge",
  // "UnitElectricCurrent",
  // "UnitElectricPotentialDifference",
  // "UnitElectricResistance",
  // "UnitEnergy",
  // "UnitFrequency",
  // "UnitFuelEfficiency",
  // "UnitIlluminance",
  // "UnitLength",
  // "UnitPower",
  // "UnitPressure",
  // "UnitSpeed",
  // "UnitTemperature",
  // "UnitVolume",
  // "URLAuthenticationChallenge",
  // "URLProtocol",
  // "URLResponse",
  // "URLSession",
  // "URLSessionConfiguration",
  // "URLSessionDataTask",
  // "URLSessionDownloadTask",
  // "URLSessionStreamTask",
  // "URLSessionTask",
  // "URLSessionTaskMetrics",
  // "URLSessionTaskTransactionMetrics",
  // "URLSessionUploadTask",
  // "URLSessionWebSocketTask",
  // "ValueTransformer",
  // "XMLParser"
  "Alamofire"
]

class Registration {
  func registerClasses() {
    let context = JSContext.current()!

    for className in allClasses {
      context.bridgeClass(className);
    }

    context.bridgeClass("VueKitNode");
  }
}
