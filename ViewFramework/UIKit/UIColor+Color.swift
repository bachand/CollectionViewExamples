import UIKit

extension UIColor: Color {

  // MARK: Public

  public var hue: Double {
    var result: CGFloat = 0
    getHue(&result, saturation: nil, brightness: nil, alpha: nil)
    return Double(result)
  }

  public var saturation: Double {
    var result: CGFloat = 0
    getHue(nil, saturation: &result, brightness: nil, alpha: nil)
    return Double(result)
  }

  public var brightness: Double {
    var result: CGFloat = 0
    getHue(nil, saturation: nil, brightness: &result, alpha: nil)
    return Double(result)
  }

  public var alpha: Double {
    var result: CGFloat = 0
    getHue(nil, saturation: nil, brightness: nil, alpha: &result)
    return Double(result)
  }
}
