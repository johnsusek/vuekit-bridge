import AppKit

class CollectionViewDelegate: JSDelegate, NSCollectionViewDelegate, NSCollectionViewDataSource {
  override var viewName: String { "collectionView" }

  func numberOfSections(in collectionView: NSCollectionView) -> Int {
    return try! self.handleDelegateInJS("numberOfSectionsInCollectionView:", [collectionView]) as Int
  }

  func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
    try? self.handleDelegateInJS("collectionView:didSelectItemsAtIndexPaths:", [Array(indexPaths), collectionView]) as Any?
  }

  func collectionView(_ collectionView: NSCollectionView, didDeselectItemsAt indexPaths: Set<IndexPath>) {
    try? self.handleDelegateInJS("collectionView:didDeselectItemsAtIndexPaths:", [Array(indexPaths), collectionView]) as Any?
  }

  func collectionView(_ collectionView: NSCollectionView, didChangeItemsAt indexPaths: Set<IndexPath>, to highlightState: NSCollectionViewItem.HighlightState) {
    try? self.handleDelegateInJS("collectionView:didChangeItemsAtIndexPaths:", [Array(indexPaths), collectionView]) as Any?
  }

  func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
    return try! self.handleDelegateInJS("collectionView:numberOfItemsInSection:", [section as Any, collectionView]) as Int
  }

  func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
    return try! self.handleDelegateInJS("collectionView:itemForRepresentedObjectAtIndexPath:", [indexPath as Any, collectionView]) as NSCollectionViewItem
  }
}
