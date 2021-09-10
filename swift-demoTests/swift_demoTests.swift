//
//  swift_demoTests.swift
//  swift-demoTests
//
//  Created by Ricardo Ruiz on 9/9/21.
//

import XCTest
@testable import swift_demo

class swift_demoTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

//    func testLoadCollection() throws {
//        
//        let closureTest = expectation(description: "loadCollection closureTest")
//        var testData = Data()
//        Network.manager.loadCollection(urlString: Constants.kCategoriesEndpoint) { (results) in
//            switch results {
//                case .success(let data):
//                    print("objects: \(String(describing: data))")
//                    
//                    testData = data
//                    closureTest.fulfill()
//                case .failure(let error):
//                    print("Error: \(error)")
//            }
//        }
//        waitForExpectations(timeout: 5) { (error) in
//            XCTAssert(testData.count > 0)
//        }
//    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
