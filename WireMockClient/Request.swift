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
    
    let urlTransformer = TransformOf<Url, String>(fromJSON: { Url($0!) }, toJSON: { $0.map { $0.url } })
    var url: Url?
    var method: RequestMethod?
    var bodyPatterns: BodyPatterns?
    
    init(method: RequestMethod, url: Url, bodyPatterns: BodyPatterns? = nil) {
        self.method = method
        self.url = url
        self.bodyPatterns = bodyPatterns
    }
    
    required init?(_ map: Map) {        
    }
    
    func mapping(map: Map) {
        url <- (map["url"], urlTransformer)
        method  <- map["method"]
        bodyPatterns <- (map["bodyPatterns"], BodyPatternsTransformer())
    }
}


class BodyPatternsTransformer: TransformType {
    typealias Object = BodyPatterns
    typealias JSON = [Dictionary<String, AnyObject>]
    
    init() {}
    
    func transformFromJSON(value: AnyObject?) -> BodyPatterns? {
        return value.map {
            patterns -> BodyPatterns in
            if let patternsArray = patterns as? Array<Dictionary<String, String>> {
                let bodyPatterns = patternsArray.map {
                    item -> BodyPatternValue in
                    return item.first!
                }
                
//                print(bodyPatterns)
                return bodyPatterns
            }
            return []
        }
    }
    
    func transformToJSON(value: BodyPatterns?) -> [Dictionary<String, AnyObject>]? {
        if let bodyPatterns = value {
            let json = bodyPatterns.map {
                (matchKey, matchValue) in
                return [matchKey: matchValue]
            } as [Dictionary<String, AnyObject>]
            return json
        }
        
        return nil
    }
}