//
//  APIRequest-Base.swift
//  iOS-Intermediate-lession-1
//
//  Created by klaudia paprika on 11/23/20.
//  Copyright © 2020 klaudia paprika. All rights reserved.
//

import Foundation

protocol APIEndpoint {
    func endpoint() -> String
}

class APIRequest {
    struct ErrorResponse: Codable {
        let status: String
        let code: Int
        let message: String
    }

    enum APIError: Error {
        case invalidEndpoint
        case errorResponseDetected
        case noData
    }
}

extension APIRequest {
    public static func urlRequest(from request: APIEndpoint) -> URLRequest? {
        let endpoint = request.endpoint()
        guard let endpointUrl = URL(string: "\(AppSettings.shared.serverBaseAddress)\(endpoint)") else {
            return nil
        }

        var endpointRequest = URLRequest(url: endpointUrl)
        endpointRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        return endpointRequest
    }
}

extension APIRequest {
    public static func get<R: Codable & APIEndpoint, T: Codable, E: Codable>(
        request: R,
        onSuccess: @escaping ((_: T) -> Void),
        onError: @escaping ((_: E?, _: Error) -> Void)) {

        guard var endpointRequest = self.urlRequest(from: request) else {
            onError(nil, APIError.invalidEndpoint)
            return
        }
        endpointRequest.httpMethod = "POST"
        endpointRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            endpointRequest.httpBody = try JSONEncoder().encode(request)
        } catch {
            onError(nil, error)
            return
        }

        URLSession.shared.dataTask(
            with: endpointRequest,
            completionHandler: { (data, urlResponse, error) in
                DispatchQueue.main.async {
                    self.processResponse(data, urlResponse, error, onSuccess: onSuccess as! (String) -> Void, onError: onError)
                }
        }).resume()
    }
}

extension APIRequest {
    
    public static func processResponse<E: Codable>(
        _ dataOrNil: Data?,
        _ urlResponseOrNil: URLResponse?,
        _ errorOrNil: Error?,
        onSuccess: ((_: String) -> Void),
        onError: ((_: E?, _: Error) -> Void)) {

        if let data = dataOrNil {
                let decodedResponse = String(data:data, encoding: .utf8)

                onSuccess(decodedResponse!)
        } else {
            onError(nil, errorOrNil ?? APIError.noData)
        }
    }
}
