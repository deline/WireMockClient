//
//  Request.swift
//  WireMockClient
//
//  Created by Deline Neo on 30/01/2016.
//  Copyright © 2016 Deline Neo. All rights reserved.
//

import Foundation
import ObjectMapper

class Request: Mappable {
    
    var url: String?
    var method: String?
    
    init(method: RequestMethod, url: Url) {
        self.method = method.rawValue
        self.url = url.url
    }
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        url     <- map["url"]
        method  <- map["method"]
    }
}