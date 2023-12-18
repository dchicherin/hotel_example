import XCTest

class BookingModelTests: XCTestCase {
    
    var bookingModel: BookingModel!
    
    override func setUp() {
        super.setUp()
        bookingModel = BookingModel()
    }
    
    override func tearDown() {
        bookingModel = nil
        super.tearDown()
    }
    
    func testGenerateOrderNumber() {
        let orderNumber = bookingModel.generateOrderNumber()
        XCTAssertEqual(orderNumber, 1, "Order number should be 1")
    }
    
    func testCheckFields_WithValidEmailAndPhone() {
        bookingModel.email = "test@example.com"
        bookingModel.phone = "1234567890"
        
        let fieldsAreValid = bookingModel.checkFields()
        
        XCTAssertTrue(fieldsAreValid, "Fields should be valid")
        XCTAssertTrue(bookingModel.emailIsvalid, "Email should be valid")
        XCTAssertFalse(bookingModel.phoneError, "Phone error should be false")
    }
    
    func testCheckFields_WithInvalidEmail() {
        bookingModel.email = "invalidemail"
        bookingModel.phone = "1234567890"
        
        let fieldsAreValid = bookingModel.checkFields()
        
        XCTAssertFalse(fieldsAreValid, "Fields should be invalid")
        XCTAssertFalse(bookingModel.emailIsvalid, "Email should be invalid")
        XCTAssertFalse(bookingModel.phoneError, "Phone error should be false")
    }
    
    func testCheckFields_WithEmptyPhone() {
        bookingModel.email = "test@example.com"
        bookingModel.phone = ""
        
        let fieldsAreValid = bookingModel.checkFields()
        
        XCTAssertFalse(fieldsAreValid, "Fields should be invalid")
        XCTAssertTrue(bookingModel.emailIsvalid, "Email should be valid")
        XCTAssertTrue(bookingModel.phoneError, "Phone error should be true")
    }
    
    func testPhoneMasked() {
        bookingModel.phone = "1234567890"
        
        let maskedPhone = bookingModel.phoneMasked()
        
        XCTAssertEqual(maskedPhone, "+7 (123) 456-78-90", "Phone should be masked correctly")
    }
    
    func testCheckEmail_WithValidEmail() {
        bookingModel.email = "test@example.com"
        
        bookingModel.checkEmail()
        
        XCTAssertTrue(bookingModel.emailIsvalid, "Email should be valid")
    }
    
    func testCheckEmail_WithInvalidEmail() {
        bookingModel.email = "invalidemail"
        
        bookingModel.checkEmail()
        
        XCTAssertFalse(bookingModel.emailIsvalid, "Email should be invalid")
    }
    
}
