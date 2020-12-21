//
//  APIListRequest.swift
//  iOS-Intermediate-lession-1
//
//  Created by klaudia paprika on 11/23/20.
//  Copyright © 2020 klaudia paprika. All rights reserved.
//

import Foundation

struct APIListRequest: Codable {
    // no request parameter neede
}

extension APIListRequest: APIEndpoint {
    func endpoint() -> String {
        return Endpoints.list.rawValue
    }
    
    typealias onSuccesClousere = ((_: String) -> Void)
    typealias onFailClousere = ((_: APIRequest.ErrorResponse?, _: Error) -> Void)


    func dispatch(
        onSuccess successHandler: @escaping onSuccesClousere,
        onFailure failureHandler: @escaping onFailClousere) {

        APIRequest.get(
            request: self,
            onSuccess: successHandler,
            onError: failureHandler)
    }
}
