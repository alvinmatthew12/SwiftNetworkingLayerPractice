//
//  HTTPNetworkRequest.swift
//  SwiftNetworkingPractice
//
//  Created by Alvin Matthew Pratama on 21/04/21.
//

import Foundation

public typealias HTTPRouterPath = String
public typealias HTTPParameters = [String: Any]?
public typealias HTTPHeaders = [String:Any]?

struct HTTPNetworkRequest {
    
    static func configureHTTPRequest(from path: HTTPRouterPath, with parameters: HTTPParameters, includes headers: HTTPHeaders, contains body: Data?, and method: HTTPMethod) throws -> URLRequest {
        guard let url = URL(string: "https://ghibliapi.herokuapp.com/\(path)") else { throw HTTPNetworkError.missingURL }
        
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
        request.httpMethod = method.rawValue
        request.httpBody = body
        
        try configureParametersAndHeaders(parameters: parameters, headers: headers, request: &request)
        
        return request
    }
    
    static func configureParametersAndHeaders(parameters: HTTPParameters?, headers: HTTPHeaders?, request: inout URLRequest) throws {
        do {
            if let headers = headers, let parameters = parameters {
                try URLEncoder.encodeParameters(for: &request, with: parameters)
                try URLEncoder.setHeaders(for: &request, with: headers)
            }
        } catch {
            throw HTTPNetworkError.encodingFailed
        }
    }
}
