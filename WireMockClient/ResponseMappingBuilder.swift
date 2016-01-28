//
//  ResponseMappingBuilder.swift
//  WireMockClient
//
//  Created by Deline Neo on 28/01/2016.
//  Copyright © 2016 Deline Neo. All rights reserved.
//

import Foundation

public class ResponseMappingBuilder {

    private let status: Int
    private var body: String?
    
    init(status: Int) {
        self.status = status
    }
    
    public func withBody(body: String) -> ResponseMappingBuilder {
        self.body = body
        return self
    }
}