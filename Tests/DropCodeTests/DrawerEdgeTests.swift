import XCTest
@testable import DropCode

final class DrawerEdgeTests: XCTestCase {
    func testTopDrawerKeepsExistingCenteredLayout() {
        XCTAssertEqual(
            DrawerEdge.top.panelFrame(
                in: CGRect(x: 0, y: 0, width: 1440, height: 900),
                heightRatio: 0.4,
                widthRatio: 0.8
            ),
            CGRect(x: 144, y: 540, width: 1152, height: 360)
        )
    }

    func testSideDrawersAnchorToEdgesOfAnOffsetDisplay() {
        let screen = CGRect(x: -1920, y: -180, width: 1920, height: 1080)
        XCTAssertEqual(
            DrawerEdge.left.panelFrame(in: screen, heightRatio: 1, widthRatio: 0.4),
            CGRect(x: -1920, y: -180, width: 768, height: 1080)
        )
        XCTAssertEqual(
            DrawerEdge.right.panelFrame(in: screen, heightRatio: 1, widthRatio: 0.4),
            CGRect(x: -768, y: -180, width: 768, height: 1080)
        )
    }

    func testShortSideDrawersAreVerticallyCentered() {
        let screen = CGRect(x: 1440, y: 900, width: 1920, height: 1080)
        XCTAssertEqual(
            DrawerEdge.left.panelFrame(in: screen, heightRatio: 0.5, widthRatio: 0.25),
            CGRect(x: 1440, y: 1170, width: 480, height: 540)
        )
        XCTAssertEqual(
            DrawerEdge.right.panelFrame(in: screen, heightRatio: 0.5, widthRatio: 0.25),
            CGRect(x: 2880, y: 1170, width: 480, height: 540)
        )
    }

    func testFullSizeDrawerFillsDisplayFromAnyEdge() {
        let screen = CGRect(x: -1512, y: 982, width: 1512, height: 982)
        for edge in DrawerEdge.allCases {
            XCTAssertEqual(
                edge.panelFrame(in: screen, heightRatio: 1, widthRatio: 1),
                screen
            )
        }
    }
}
