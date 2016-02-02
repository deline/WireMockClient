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
//    let bodyPatternsTransformer = TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } })
    
    var url: Url?
    var method: RequestMethod?
    var bodyPatterns: BodyPatterns?
//    var bodyPatterns = [[String : AnyObject]]()

    
    
    init(method: RequestMethod, url: Url, bodyPatterns: BodyPatterns? = nil) {
        self.method = method
        self.url = url
        self.bodyPatterns = bodyPatterns
//        self.bodyPatterns.append(["XXXXX":"YYYY"])
//        self.bodyPatterns.append(["BBB":"CCC"])
    }
    
    required init?(_ map: Map) {        
    }
    
    func mapping(map: Map) {
        url <- (map["url"], urlTransformer)
        method  <- map["method"]
        bodyPatterns <- (map["bodyPatterns"], X())
//        bodyPatterns <- map["bodyPatterns"]
    }
}


class X: TransformType {
    typealias Object = BodyPatterns
    typealias JSON = [Dictionary<String, AnyObject>]
    
    init() {}
    
    func transformFromJSON(value: AnyObject?) -> BodyPatterns? {
//        if let timeInt = value as? Double {
//            return NSDate(timeIntervalSince1970: NSTimeInterval(timeInt))
//        }
//        
//        if let timeStr = value as? String {
//            return NSDate(timeIntervalSince1970: NSTimeInterval(atof(timeStr)))
//        }
        
        return nil
    }
    
    func transformToJSON(value: BodyPatterns?) -> [Dictionary<String, AnyObject>]? {
        if let bodyPatterns = value {
            let y = bodyPatterns.map {
                (matchKey, matchValue) in
                return [matchKey: matchValue]
            } as [Dictionary<String, AnyObject>]
            
//            debugPrint(y)
//            debugPrint([["matches":"Y"]])
//            return [["matches":"Y"]]
            return y
        }
        
        return nil
    }
}