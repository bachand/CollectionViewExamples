import UIKit

extension Color {

  // MARK: Public
  
  public var uiColor: UIColor {
    return UIColor(hue: CGFloat(hue), saturation: CGFloat(saturation), brightness: CGFloat(brightness), alpha: CGFloat(alpha))
  }
}
