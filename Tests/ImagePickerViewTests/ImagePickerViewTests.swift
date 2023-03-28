@testable import ImagePickerView
import XCTest

final class ImagePickerViewTests: XCTestCase {
    var imagePickerView: ImagePickerView!
    
    override func setUp() {
        super.setUp()
        imagePickerView = ImagePickerView()
    }
    
    override func tearDown() {
        imagePickerView = nil
        super.tearDown()
    }
    
    func testPlaceholderImage() {
        let placeholderImage = UIImage(named: "test_image")
        imagePickerView.placeholderImage = placeholderImage
        XCTAssertEqual(imagePickerView.image, placeholderImage)
    }
    
    func testColor() {
        let testColor = UIColor.red
        imagePickerView.color = testColor
        XCTAssertEqual(imagePickerView.backgroundColor, testColor)
    }
    
    func testCornerRadius() {
           let testCornerRadius: CGFloat = 10.0
           imagePickerView.cornerRadius = testCornerRadius
           XCTAssertEqual(imagePickerView.layer.cornerRadius, testCornerRadius)
       }
}
