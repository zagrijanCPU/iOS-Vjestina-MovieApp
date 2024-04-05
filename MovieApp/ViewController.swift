//
//  ViewController.swift
//  MovieApp
//
//  Created by endava on 05.04.2024..
//

import UIKit
import MovieAppData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let details = MovieUseCase().getDetails(id: 111161)
        print(details)
    }


}

