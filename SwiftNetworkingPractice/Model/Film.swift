//
//  FilmModel.swift
//  SwiftNetworkingPractice
//
//  Created by Alvin Matthew Pratama on 21/04/21.
//

import Foundation

struct Film: Codable {
    let id: String
    let title: String
    let director: String
    let releaseDate: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case director
        case releaseDate = "release_date"
        case description
    }
}
