//
//  WireMockClientTests.swift
//  WireMockClientTests
//
//  Created by Deline Neo on 28/01/2016.
//  Copyright © 2016 Deline Neo. All rights reserved.
//

import XCTest
import Nimble
import Alamofire

@testable import WireMockClient

class WireMockClientTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCanCreateStubGet() {
        stubFor(get(url("/helloWorld"))
            .andReturn(response(200)
                .withBody("A")))
        
        var responseContent: String?
        Alamofire.request(.GET, "http://localhost:8080/helloWorld").response {
            request, response, data, error in
            print(request)
            print(response)
            print(data)
            print(error)
            
            responseContent = "XX"
        }
        
        expect(responseContent).toEventuallyNot(beNil())
        
        
        
    }
    
}
