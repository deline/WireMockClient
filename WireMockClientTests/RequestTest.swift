//
// Created by Deline Neo on 18/02/2016.
// Copyright (c) 2016 Deline Neo. All rights reserved.
//

import Foundation
import XCTest
import ObjectMapper
import Nimble

@testable import WireMockClient

class RequestTest: XCTestCase {
    
    func testCanCreateRequestFromJSON() {
        let request = Mapper<Request>().map("{\"method\":\"POST\",\"url\":\"\\/helloWorld\",\"bodyPatterns\":[{\"matches\":\"requestBodyContent\"}]}")!
        expect(request.method).to(equal(RequestMethod.POST))
        expect(request.url?.url).to(equal("/helloWorld"))
        expect(request.bodyPatterns).notTo(beNil())
    }
}
