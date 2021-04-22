//
//  FilmViewModel.swift
//  SwiftNetworkingPractice
//
//  Created by Alvin Matthew Pratama on 23/04/21.
//

import Foundation

class FilmsViewModel: NSObject {
    
    private(set) var films: [Film]! {
        didSet {
            self.bindFilmsViewModelToController()
        }
    }
    
    override init() {
        super .init()
        getFilmsData()
    }
    
    var bindFilmsViewModelToController: (() -> Void) = {}
    
    func getFilmsData() {
        APIService.shared.request(router: HTTPRouter.getAllFilms, body: nil) { (result: Result<[Film]>) in
            if let data = result.value {
                self.films = data
            }
        }
    }
    
}
