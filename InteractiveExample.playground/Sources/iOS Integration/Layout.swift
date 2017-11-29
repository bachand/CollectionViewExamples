import UIKit

public final class Layout: UICollectionViewLayout {

  // MARK: Public

  override public func prepare() {
    guard let collectionView = collectionView else { fatalError() }
    super.prepare()
    sizes = Array(repeating: 10, count: collectionView.numberOfItems(inSection: 0))
  }

  override public func shouldInvalidateLayout(
    forPreferredLayoutAttributes preferredAttributes: UICollectionViewLayoutAttributes,
    withOriginalAttributes originalAttributes: UICollectionViewLayoutAttributes) -> Bool
  {
    return true
  }

  override public class var invalidationContextClass: AnyClass {
    return InvalidationContext.self
  }

  override public func invalidationContext(
    forPreferredLayoutAttributes preferredAttributes: UICollectionViewLayoutAttributes,
    withOriginalAttributes originalAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutInvalidationContext
  {
    let invalidationContext = super.invalidationContext(
      forPreferredLayoutAttributes: preferredAttributes,
      withOriginalAttributes: originalAttributes) as! InvalidationContext

    switch invalidationContext.state {
    case .new:
      let heightDelta = preferredAttributes.size.height - originalAttributes.size.height
      invalidationContext.state = .configured(index: preferredAttributes.indexPath.item, heightDelta: heightDelta)
      return invalidationContext
    case .configured:
      preconditionFailure("This violates we expect of iOS")
    }
  }

  override public func invalidateLayout(with context: UICollectionViewLayoutInvalidationContext) {
    super.invalidateLayout(with: context)
    guard let context = context as? InvalidationContext else { return }
    guard case .configured(let index, let heightDelta) = context.state else { return }
    sizes[index] += heightDelta
  }

  override public var collectionViewContentSize: CGSize {
    guard let collectionView = collectionView else { fatalError() }
    let height = sizes.reduce(0, { $0 + $1 })
    return CGSize(width: collectionView.frame.width, height: height)
  }

  override public func layoutAttributesForElements(
    in rect: CGRect) -> [UICollectionViewLayoutAttributes]?
  {
    var sumOfSizes: CGFloat = 0
    var arrayOfLayoutAttributes = [UICollectionViewLayoutAttributes]()

    for (index, size) in sizes.enumerated() {
      if sumOfSizes < rect.maxY {
        if let layoutAttributes = layoutAttributesForItem(at: IndexPath(item: index, section: 0)) {
          arrayOfLayoutAttributes.append(layoutAttributes)
        }
      }
      sumOfSizes += size
    }

    return arrayOfLayoutAttributes
  }

  override public func layoutAttributesForItem(
    at indexPath: IndexPath) -> UICollectionViewLayoutAttributes?
  {
    guard let collectionView = collectionView else { fatalError() }

    let layoutAttributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
    let frame = CGRect(
      x: 0,
      y: sizes[0..<indexPath.item].reduce(0, { $0 + $1 }),
      width: collectionView.frame.width,
      height: sizes[indexPath.item])
    layoutAttributes.frame = frame
    return layoutAttributes
  }

  // MARK: Private

  private var sizes = [CGFloat]()
}
