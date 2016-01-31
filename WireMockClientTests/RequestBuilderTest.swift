//
//  MappingBuilderTest.swift
//  WireMockClient
//
//  Created by Deline Neo on 30/01/2016.
//  Copyright © 2016 Deline Neo. All rights reserved.
//

import Foundation
import XCTest
import ObjectMapper
import Nimble

@testable import WireMockClient

class RequestBuilderTest: XCTestCase {
    
    func testCreatesGetRequest() {
        let builder = RequestBuilder(method: .GET, url: url("/helloWorld"))
        let request = builder.build()
        
        let requestJson = Mapper().toJSON(request) as! [String: String]
        expect(requestJson["method"]).to(equal("GET"))
        expect(requestJson["url"]).to(equal("/helloWorld"))
    }
    
    func testCreatesPostRequest() {
//        let builder = RequestBuilder(method: .POST, url: url(
    }
    
    func testCreatesPostRequestWithJsonBody() {
        
    }
}