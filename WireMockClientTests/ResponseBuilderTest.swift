//
//  ResponseBuilderTest.swift
//  WireMockClient
//
//  Created by Deline Neo on 30/01/2016.
//  Copyright © 2016 Deline Neo. All rights reserved.
//

import Foundation
import XCTest
import ObjectMapper
import Nimble
import SwiftyJSON

@testable import WireMockClient

class ResponseBuilderTest: XCTestCase {
    
    func testCreatesResponseWithCorrectDetailsWhenBodyIsStringContent() {
        let responseBody = "response body to return"
        let builder = ResponseBuilder(status: 200).withBody(responseBody)
        let response = builder.build()
        
        let responseJson = Mapper().toJSON(response)
        expect(responseJson["status"] as? Int).to(equal(200))
        expect(responseJson["body"] as? String).to(equal(responseBody))
    }

    func testCreatesResponseWithCorrectDetailsWhenBodyIsJson() {
        let jsonResponseBody = JSON(["key": "value"])
        let builder = ResponseBuilder(status: 200).withBody(jsonResponseBody)
        let response = builder.build()

        let responseJson = Mapper().toJSON(response)
        expect(responseJson["status"] as? Int).to(equal(200))
        expect(responseJson["body"] as? String).to(equal(jsonResponseBody.rawString()))
    }

    func testDoesNotIncludeFieldsThatAreNilWhenSerialisedToJson() {
        let builder = ResponseBuilder(status: 200)
        let response = builder.build()
        
        let responseJson = Mapper().toJSON(response)
        expect(responseJson["status"] as? Int).to(equal(200))
        expect(responseJson["body"] as? String).to(beNil())
    }
}