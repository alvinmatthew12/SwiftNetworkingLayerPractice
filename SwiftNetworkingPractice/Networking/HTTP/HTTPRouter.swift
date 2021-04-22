//
//  HTTPNetworkRoute.swift
//  SwiftNetworkingPractice
//
//  Created by Alvin Matthew Pratama on 21/04/21.
//

import Foundation

public enum HTTPRouter {
    
    case getAllFilms
    case getFilmById(String)
    
    var path: HTTPRouterPath {
        switch self {
        case .getAllFilms:
            return "films"
        case .getFilmById(let id):
            return "films/\(id)"
        }
    }
    
    var parameters: HTTPParameters {
        switch self {
        case .getAllFilms, .getFilmById(_):
            return  ["fields":"id,title,description,release_date,director"]
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
        case .getAllFilms, .getFilmById(_):
            return nil
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getAllFilms, .getFilmById(_):
            return .get
        }
    }
}
