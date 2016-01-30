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
    
    /*
     * This requires you to be running the WireMock standalone jar
     * e.g. java -jar wiremock-1.57-standalone.jar - --verbose
     */
    func testCanCreateStubGet() {
        stubFor(get(url("/helloWorld")).andReturn(response(200).withBody("This is the body")))
        
        var responseContent: String?
        Alamofire.request(.GET, "http://localhost:8080/helloWorld").responseString {
            response in
            responseContent = response.result.value
        }
        
        expect(responseContent).toEventuallyNot(beNil())
        expect(responseContent).to(equal("This is the body"))
    }
}
