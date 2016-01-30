//
//  Mapping.swift
//  WireMockClient
//
//  Created by Deline Neo on 28/01/2016.
//  Copyright © 2016 Deline Neo. All rights reserved.
//

import Foundation
import ObjectMapper

class Mapping: Mappable {
    
    private var request:Request?
    private var response: Response?
    
    init(request: Request, response: Response?) {
        self.request = request
        self.response = response
    }
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        request <- map["request"]
        response <- map["response"]
    }
}