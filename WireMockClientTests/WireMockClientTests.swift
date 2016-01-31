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

/*
* This test requires you to be running the WireMock standalone jar
* e.g. java -jar wiremock-1.57-standalone.jar - --verbose
*/
class WireMockClientTests: XCTestCase {

    private static let url = "http://localhost:8080/helloWorld"
    
    func testCanCreateStubGet() {
        stubFor(request(.GET, url: "/helloWorld").andReturn(response(200).withBody("This is the body")))
        
        var responseContent: String?
        Alamofire.request(.GET, WireMockClientTests.url).responseString {
            response in
            responseContent = response.result.value
        }
        
        expect(responseContent).toEventuallyNot(beNil())
        expect(responseContent).to(equal("This is the body"))
    }
    
    func testCanCreateStubPost() {
        stubFor(request(.POST, url: "/helloWorld").withRequestBody("post content").andReturn(response(201)))
        
        var responseStatusCode: Int?
        Alamofire.request(.POST, WireMockClientTests.url, parameters: [:], encoding: .Custom({
            (convertible, params) in
            let mutableRequest = convertible.URLRequest.copy() as! NSMutableURLRequest
            mutableRequest.HTTPBody = "post conteXXnt".dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
            return (mutableRequest, nil)
        })).response { _, response, _, _    in
            responseStatusCode = response?.statusCode
        }
        
        expect(responseStatusCode).toEventuallyNot(beNil())
        expect(responseStatusCode).to(equal(400))
    }
}
