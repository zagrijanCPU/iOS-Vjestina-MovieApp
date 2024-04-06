//
//  ContentViewController.swift
//  MovieApp
//
//  Created by endava on 06.04.2024..
//

import Foundation
import UIKit
import PureLayout
import MovieAppData

class ContentViewController: UIViewController{
    
    var movieData: MovieDetailsModel!
    var overviewLabel: UILabel!
    var movieSummary: UILabel!
    
    override func viewDidLoad() {
        print("ContentViewController")
        super.viewDidLoad()
        
        movieData = MovieDetailsViewController.getMovieData(id: 111161)
        buildComponents()
        positionComponents()
        styleComponents()
    }
    
    private func buildComponents(){
        overviewLabel = UILabel()
        view.addSubview(overviewLabel)
        
        movieSummary = UILabel()
        view.addSubview(movieSummary)
    }
    
    private func positionComponents(){
        overviewLabel.autoPinEdge(.top, to: .top, of: view, withOffset: 30)
        overviewLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
        
        movieSummary.autoPinEdge(.top, to: .bottom, of: overviewLabel, withOffset: 30)
        movieSummary.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
        movieSummary.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20)
    }
    
    private func styleComponents(){
//        view.backgroundColor = .lightGray
        
        overviewLabel.text = "Overview"
        overviewLabel.font = UIFont.boldSystemFont(ofSize: 30)
        
        movieSummary.numberOfLines = 0
        movieSummary.text = movieData.summary
        movieSummary.lineBreakMode = .byWordWrapping
        
        
    }
    
}
