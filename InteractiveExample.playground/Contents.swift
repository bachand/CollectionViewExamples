import PlaygroundSupport
import UIKit

let components: [Component] = [
  Component(backgroundColor: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), height: 10),
  Component(backgroundColor: #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1), height: 20),
  Component(backgroundColor: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), height: 30),
  Component(backgroundColor: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), height: 50),
  Component(backgroundColor: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), height: 80),
]

let viewController = PlaygroundViewController(
  components: components,
  layoutType: .selfSizingFlow)

PlaygroundPage.current.liveView = viewController
