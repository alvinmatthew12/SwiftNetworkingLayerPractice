//
//  ViewController.swift
//  SwiftNetworkingPractice
//
//  Created by Alvin Matthew Pratama on 21/04/21.
//

import UIKit

class ViewController: UIViewController {
    
    var filmServices: FilmServices!
    var films: [Film] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        filmServices = FilmServices()
        
        getAllFilms()
    }
    
    func getAllFilms() {
        filmServices.getFilms { (res) in
            DispatchQueue.main.async {
                print(res)
            }
        }
    }

}

