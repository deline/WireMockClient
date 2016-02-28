//
//  WireMock.swift
//  WireMockClient
//
//  Created by Deline Neo on 28/01/2016.
//  Copyright © 2016 Deline Neo. All rights reserved.
//

import Foundation
import Alamofire

private class WireMockClient {
    
    static let sharedInstance = WireMockClient()
    private let manager = WireMockClientManager()
   
    func registerMapping(mappingBuilder: MappingBuilder) {
        manager.addMapping(mappingBuilder.build())
    }
    
    func allMappings() -> [String] {
        return manager.allMappings()
    }
    
    func resetAllMappings() {
        return manager.resetAllMappings()
    }
}

public func stubFor(mappingBuilder: MappingBuilder) {
    WireMockClient.sharedInstance.registerMapping(mappingBuilder)
}

public func request(method: RequestMethod, url: String) -> MappingBuilder {
    return MappingBuilder(method: method, url: Url(url))
}

public func url(url: String) -> Url {
    return Url(url)
}

public func response(status: Int) -> ResponseBuilder {
    return ResponseBuilder(status: status)
}

public func listAllStubMappings() -> [String] {
    return WireMockClient.sharedInstance.allMappings()
}

public func resetAllMappings() {
    return WireMockClient.sharedInstance.resetAllMappings()
}

