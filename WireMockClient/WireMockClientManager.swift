//
//  WireMockClientManager.swift
//  WireMockClient
//
//  Created by Deline Neo on 28/01/2016.
//  Copyright © 2016 Deline Neo. All rights reserved.
//

import Foundation
import Alamofire

class WireMockClientManager {
    func addMapping(mapping: Mapping) {
        
        let semaphore = dispatch_semaphore_create(0)
        Alamofire.request(.POST, "http://localhost:8080/__admin/mappings/new", parameters: mapping.toJSON(), encoding: .JSON).response {
            _ in
            dispatch_semaphore_signal(semaphore)
        }
        
        while dispatch_semaphore_wait(semaphore, DISPATCH_TIME_NOW) != 0 {
            NSRunLoop.currentRunLoop().runMode(NSDefaultRunLoopMode, beforeDate: NSDate(timeIntervalSinceNow: 10))
        }
    }
    
    func allMappings() -> [String] {
        let semaphore = dispatch_semaphore_create(0)
        Alamofire.request(.GET, "http://localhost:8080/__admin").responseString {
            response in
            print("Success: \(response.result.isSuccess)")
            print("Response String: \(response.result.value)")
            
            dispatch_semaphore_signal(semaphore)
        }
        
        while dispatch_semaphore_wait(semaphore, DISPATCH_TIME_NOW) != 0 {
            NSRunLoop.currentRunLoop().runMode(NSDefaultRunLoopMode, beforeDate: NSDate(timeIntervalSinceNow: 10))
        }
        
        return []
    }
    
    func resetAllMappings() {
        
    }
}