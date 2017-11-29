public struct Component {

  // MARK: Lifecycle

  public init(backgroundColor: Color, height: UInt) {
    self.backgroundColor = backgroundColor
    self.height = height
  }

  // MARK: Public

  public var backgroundColor: Color
  public var height: UInt
}
