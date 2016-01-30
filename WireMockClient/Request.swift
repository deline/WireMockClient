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
    
    var url: Url?
    var method: RequestMethod?
    let urlTransformer = TransformOf<Url, String>(fromJSON: { Url($0!) }, toJSON: { $0.map { $0.url } })
    
    init(method: RequestMethod, url: Url) {
        self.method = method
        self.url = url
    }
    
    required init?(_ map: Map) {        
    }
    
    func mapping(map: Map) {
        url <- (map["url"], urlTransformer)
        method  <- map["method"]
    }
}