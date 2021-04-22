//
//  ViewController.swift
//  SwiftNetworkingPractice
//
//  Created by Alvin Matthew Pratama on 21/04/21.
//

import UIKit

class ViewController: UIViewController {
    
    var films: [Film] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        getAllFilms()
        getFilmById()
    }
    
    func getAllFilms() {
        ServiceLayer.shared.request(router: HTTPRouter.getAllFilms, body: nil) { (result: Result<[Film]>) in
            switch result {
            case .success:
                if let data = result.value {
                    print(data)
                }
            case .failure:
                print(result)
            }
        }
    }
    
    func getFilmById() {
        ServiceLayer.shared.request(router: HTTPRouter.getFilmById("2baf70d1-42bb-4437-b551-e5fed5a87abe"), body: nil) { (result: Result<Film>) in
            switch result {
            case .success:
                if let data = result.value {
                    print(data)
                }
            case .failure:
                print(result)
            }
        }
    }

}

