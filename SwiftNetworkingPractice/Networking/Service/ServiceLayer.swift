//
//  FilmServices.swift
//  SwiftNetworkingPractice
//
//  Created by Alvin Matthew Pratama on 21/04/21.
//

import Foundation

struct ServiceLayer {
    
    static let shared = ServiceLayer()
    
    func request<T: Codable>(router: HTTPRouter, body: Data?, _ completion: @escaping (Result<T>) -> ()) {
        do {
            let request = try HTTPNetworkRequest.configureHTTPRequest(from: router.path, with: router.parameters, includes: router.headers, contains: body, and: router.method)
            let session = URLSession(configuration: .default)
            session.dataTask(with: request) { (data, res, err) in
                if let response = res as? HTTPURLResponse, let unwrappedData = data {
                    
                    let result = HTTPNetworkResponse.handleNetworkResponse(for: response)
                    
                    switch result {
                        case .success:
                            let result = try? JSONDecoder().decode(T.self, from: unwrappedData)
                            completion(Result.success(result!))
                        
                        case .failure:
                            completion(Result.failure(HTTPNetworkError.decodingFailed.rawValue))
                    }
                }
            }.resume()
        } catch {
            completion(Result.failure(HTTPNetworkError.badRequest.rawValue))
        }
    }
}
