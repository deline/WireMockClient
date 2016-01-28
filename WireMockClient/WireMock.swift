//
//  WireMock.swift
//  WireMockClient
//
//  Created by Deline Neo on 28/01/2016.
//  Copyright © 2016 Deline Neo. All rights reserved.
//

import Foundation



public func stubFor(requestMappingBuilder: RequestMappingBuilder) {
    
}

public func get(url: Url) -> RequestMappingBuilder {
    return RequestMappingBuilder(method: .GET, url: url)
}

public func url(url: String) -> Url {
    return Url(url)
}

public func response(status: Int) -> ResponseMappingBuilder {
    return ResponseMappingBuilder(status: status)
}

