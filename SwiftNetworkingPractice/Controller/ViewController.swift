//
//  ViewController.swift
//  SwiftNetworkingPractice
//
//  Created by Alvin Matthew Pratama on 21/04/21.
//

import UIKit

class ViewController: UIViewController {
    
    private var filmsViewModel: FilmsViewModel!
    
    var films: [Film] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        callToViewModelForUpdate()
    }
    
    func callToViewModelForUpdate() {
        filmsViewModel = FilmsViewModel()
        filmsViewModel.bindFilmsViewModelToController = { [self] in
            updateFilmsData(filmsViewModel.films)
        }
    }
    
    func updateFilmsData(_ data: [Film]) {
        self.films = data
        print(films)
    }
}

