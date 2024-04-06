//
//  MovieDetailsViewController.swift
//  MovieApp
//
//  Created by endava on 05.04.2024..
//

import Foundation
import UIKit
import PureLayout
import MovieAppData

class MovieDetailsViewController : UIViewController {
//    var headerRect: UIView!
//    var imageView: UIImageView!
//    var movieData: MovieDetailsModel!
//    var movieTitle: UILabel!
//    var movieDate: UILabel!
//    var userScore: UILabel!
    
    var header: HeaderViewController!
    
    override func viewDidLoad() {
        print("MovieDetailsViewController")
        super.viewDidLoad()
        view.backgroundColor = .white
        

        buildViews()
        styleViews()
        positionViews()
    }
    
    private func buildViews(){
        header = HeaderViewController()
        
    }
    
    private func positionViews(){
        addChild(header)
        view.addSubview(header.view)
        header.didMove(toParent: self)
        
        header.view.autoPinEdge(toSuperviewEdge: .top)
        header.view.autoPinEdge(toSuperviewEdge: .leading)
        header.view.autoMatch(.width, to: .width, of: view)
        header.view.autoSetDimension(.height, toSize: view.bounds.height / 2.5)
    }
    
    private func styleViews(){
        header.view.backgroundColor = .cyan
    }
    
//    private func buildViews(){
//        headerRect = UIView()
//        view.addSubview(headerRect)
//        
//        imageView = UIImageView()
//        headerRect.addSubview(imageView)
//        
//        movieTitle = UILabel()
//        headerRect.addSubview(movieTitle)
//        
//        movieDate = UILabel()
//        headerRect.addSubview(movieDate)
//        
//        userScore = UILabel()
//        headerRect.addSubview(userScore)
//        
//    }
//    
//    private func styleViews(){
//        headerRect.backgroundColor = .cyan
//        
//        imageView.contentMode = .scaleAspectFill
//        
//        let imageUrlStrig = movieData.imageUrl
//        
//        if let imageUrl = URL(string: imageUrlStrig){
//            DispatchQueue.global().async { [weak self] in
//                if let imageData = try? Data(contentsOf: imageUrl), let image = UIImage(data: imageData){
//                    DispatchQueue.main.async {
//                        self?.imageView.image = image
//                    }
//                }
//            }
//        }
//        
//        movieTitle.text = movieData.name + " (" + String(movieData.year) + ")"
//        movieTitle.textColor = .white
//        movieDate.text = movieData.releaseDate
//        movieDate.textColor = .white
//        userScore.text = String(movieData.rating) + " User Score"
//        userScore.textColor = .white
//    }
//    
//    private func positionViews(){
//        headerRect.autoPinEdge(toSuperviewEdge: .leading, withInset: 0)
//        headerRect.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
//        headerRect.autoMatch(.width, to: .width, of: view)
//        headerRect.autoSetDimension(.height, toSize: view.bounds.height / 3.5)
//        
//        imageView.autoPinEdge(toSuperviewEdge: .leading)
//        imageView.autoPinEdge(toSuperviewEdge: .top)
//        imageView.autoMatch(.width, to: .width, of: headerRect)
//        imageView.autoMatch(.height, to: .height, of: headerRect)
//        
//        movieTitle.autoPinEdge(toSuperviewEdge: .leading, withInset: 10)
//        movieTitle.autoCenterInSuperview()
//        
//        movieDate.autoPinEdge(.top, to: .bottom, of: movieTitle, withOffset: 20)
//        movieDate.autoPinEdge(toSuperviewEdge: .leading, withInset: 10)
//        
//        userScore.autoPinEdge(.bottom, to: .top, of: movieTitle, withOffset: -20)
//        userScore.autoPinEdge(toSuperviewEdge: .leading, withInset: 10)
//    }
//    

}
