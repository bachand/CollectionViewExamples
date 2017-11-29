import UIKit

extension Component {

  // MARK: Internal

  func configureView(_ view: UIView, for environment: ComponentEnvironment) {
    // is there a cleaner way?
    view.subviews.forEach { $0.removeFromSuperview() }

    view.heightAnchor.constraint(equalToConstant: CGFloat(height))
  }
}
