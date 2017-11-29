import UIKit

public final class InvalidationContext: UICollectionViewLayoutInvalidationContext {

  // MARK: Internal

  enum State {
    case new
    case configured(index: Int, heightDelta: CGFloat)
  }

  var state: State = .new
}
