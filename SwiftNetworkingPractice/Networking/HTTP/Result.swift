//
//  Result.swift
//  SwiftNetworkingPractice
//
//  Created by Alvin Matthew Pratama on 21/04/21.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(String)
    
    var value: T? {
        switch self {
            case .success(let value): return value
            case .failure: return nil
        }
    }
}
