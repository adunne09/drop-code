import Foundation

enum DrawerEdge: String, CaseIterable {
    case top
    case left
    case right

    var title: String {
        switch self {
        case .top: "Top"
        case .left: "Left"
        case .right: "Right"
        }
    }

    var isSide: Bool { self != .top }

    func panelFrame(
        in screenFrame: CGRect,
        heightRatio: CGFloat,
        widthRatio: CGFloat
    ) -> CGRect {
        let height = max(1, floor(screenFrame.height * heightRatio))
        let width = max(1, floor(screenFrame.width * widthRatio))
        let x: CGFloat
        switch self {
        case .top: x = screenFrame.midX - width / 2
        case .left: x = screenFrame.minX
        case .right: x = screenFrame.maxX - width
        }
        return CGRect(
            x: x,
            y: isSide ? screenFrame.midY - height / 2 : screenFrame.maxY - height,
            width: width,
            height: height
        )
    }
}
