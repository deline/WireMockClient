//
//  Response.swift
//  WireMockClient
//
//  Created by Deline Neo on 30/01/2016.
//  Copyright © 2016 Deline Neo. All rights reserved.
//

import Foundation
import ObjectMapper

class Response: Mappable {
 
    var status: Int?
    var body: String?
    
    init(status: Int, body: String?) {
        self.status = status
        self.body = body
    }
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        status  <- map["status"]
        body    <- map["body"]
    }
}