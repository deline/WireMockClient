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

class MappingBuilderTest: XCTestCase {

    func testBuildsJsonMappingsForWireMock() {
        let builder = MappingBuilder(method: .GET, url: Url("/helloWorld")).andReturn(response(200).withBody("hi there"))
        let mapping = builder.build();
        let jsonMappings = Mapper().toJSON(mapping);
        
        expect(jsonMappings["request"] as? [String: String]).to(equal(["method": "GET", "url": "/helloWorld"]))
        expect(jsonMappings["response"]?["status"]).to(equal(200))
        expect(jsonMappings["response"]?["body"]).to(equal("hi there"))
    }
}