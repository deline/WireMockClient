//
//  RequestMappingBuilder.swift
//  WireMockClient
//
//  Created by Deline Neo on 28/01/2016.
//  Copyright © 2016 Deline Neo. All rights reserved.
//

import Foundation

public enum RequestMethod: String {
    case GET
    case PUT
    case DELETE
    case POST
}

public class RequestBuilder {
    
    private let method: RequestMethod
    private let url: Url
    private var responseBuilder: ResponseBuilder?
    
    init(method: RequestMethod, url: Url) {
        self.method = method
        self.url = url
    }

    func build() -> Request {
        return Request(method: method, url: url)
    }
    
}