//
//  MappingBuilder.swift
//  WireMockClient
//
//  Created by Deline Neo on 28/01/2016.
//  Copyright © 2016 Deline Neo. All rights reserved.
//

import Foundation

public class MappingBuilder {
    let requestBuilder: RequestBuilder
    var responseBuilder: ResponseBuilder?
    
    init(method: RequestMethod, url: Url) {
        requestBuilder = RequestBuilder(method: .GET, url: url)
    }
    
    public func andReturn(responseBuilder: ResponseBuilder) -> MappingBuilder {
        self.responseBuilder = responseBuilder
        return self
    }
    
    func build() -> Mapping {
        debugPrint("XXXXX")
        return Mapping()
    }
}