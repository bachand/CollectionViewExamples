import UIKit

extension Component {

  // MARK: Internal

  public func configure(_ cell: UICollectionViewCell, for environment: ComponentEnvironment) {
    let backgroundView = cell.backgroundView ?? UIView()
    backgroundView.backgroundColor = backgroundColor.uiColor
    cell.backgroundView = backgroundView

    configureView(cell.contentView, for: environment)
  }
}
