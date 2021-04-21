//
//  FilmServices.swift
//  SwiftNetworkingPractice
//
//  Created by Alvin Matthew Pratama on 21/04/21.
//

import Foundation

struct FilmServices {
    
    static let shared = FilmServices()
    let filmSession = URLSession(configuration: .default)
    var parameters = ["fields":"id,title,description,release_date,director"]
    
    func getFilms(_ completion: @escaping (Result<[Film]>) -> ()) {
        do {
            let request = try HTTPNetworkRequest.configureHTTPRequest(from: .getAllFilms, with: parameters, includes: nil, contains: nil, and: .get)
            filmSession.dataTask(with: request) { (data, res, err) in
                if let response = res as? HTTPURLResponse, let unwrappedData = data {
                    
                    let result = HTTPNetworkResponse.handleNetworkResponse(for: response)
                    
                    switch result {
                        case .success:
                            let result = try? JSONDecoder().decode([Film].self, from: unwrappedData)
                            completion(Result.success(result!))
                        
                        case .failure:
                            completion(Result.failure(HTTPNetworkError.decodingFailed))
                    }
                }
            }.resume()
        } catch {
            completion(Result.failure(HTTPNetworkError.badRequest))
        }
    }
    
    
    func getFilm(id: String, _ completion: @escaping (Result<[Film]>) -> ()) {
        do {
            let request = try HTTPNetworkRequest.configureHTTPRequest(from: .getFilm, with: parameters, includes: nil, contains: nil, and: .get)
            filmSession.dataTask(with: request) { (data, res, err) in
                if let response = res as? HTTPURLResponse, let unwrappedData = data {
                    
                    let result = HTTPNetworkResponse.handleNetworkResponse(for: response)
                    
                    switch result {
                        case .success:
                            let result = try? JSONDecoder().decode([Film].self, from: unwrappedData)
                            completion(Result.success(result!))
                        
                        case .failure:
                            completion(Result.failure(HTTPNetworkError.decodingFailed))
                    }
                }
            }.resume()
        } catch {
            completion(Result.failure(HTTPNetworkError.badRequest))
        }
    }
}
