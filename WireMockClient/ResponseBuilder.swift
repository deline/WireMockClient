//
//  ResponseMappingBuilder.swift
//  WireMockClient
//
//  Created by Deline Neo on 28/01/2016.
//  Copyright © 2016 Deline Neo. All rights reserved.
//

import Foundation

typealias ResponseMappingsDictionary = [String: AnyObject]

public class ResponseBuilder {

    private let status: Int
    private var body: String?
    
    init(status: Int) {
        self.status = status
    }
    
    public func withBody(body: String) -> ResponseBuilder {
        self.body = body
        return self
    }
    
    func build() -> ResponseMappingsDictionary {
        return ResponseMappingsDictionary()
    }
}