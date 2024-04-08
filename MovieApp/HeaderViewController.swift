//
//  HeaderViewController.swift
//  MovieApp
//
//  Created by endava on 06.04.2024..
//

import Foundation
import UIKit
import PureLayout
import MovieAppData

class HeaderViewController : UIViewController {
    
    var movieData: MovieDetailsModel!
    var movieScore: UILabel!
    var movieTitle: UILabel!
    var movieRelease: UILabel!
    var movieCategories: UILabel!
    var movieImageView: UIImageView!
    var addInFavouriteButton: UIButton!
    
    override func viewDidLoad() {
        print("HeaderViewController")
        super.viewDidLoad()
        
        movieData = MovieDetailsViewController.getMovieData(id: 111161)
        buildComponents()
        positionComponents()
        styleComponents()
    }
    
    private func buildComponents(){
        movieImageView = UIImageView()
        view.addSubview(movieImageView)
        setImageFromURL(movieData.imageUrl)
        
        movieTitle = UILabel()
        view.addSubview(movieTitle)
        
        movieScore = UILabel()
        view.addSubview(movieScore)
        
        movieRelease = UILabel()
        view.addSubview(movieRelease)
        
        movieCategories = UILabel()
        view.addSubview(movieCategories)
        
        addInFavouriteButton = UIButton(type: .custom)
        view.addSubview(addInFavouriteButton)
        
    }
    
    private func positionComponents(){
        movieImageView.autoMatch(.width, to: .width, of: view)
        movieImageView.autoMatch(.height, to: .height, of: view)
        movieImageView.contentMode = .scaleAspectFill
        movieImageView.clipsToBounds = true
        
        movieTitle.autoCenterInSuperview()
        movieTitle.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
        
        movieRelease.autoPinEdge(.top, to: .bottom, of: movieTitle, withOffset: 30)
        movieRelease.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
        
        movieScore.autoPinEdge(.bottom, to: .top, of: movieTitle, withOffset: -30)
        movieScore.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
        
        movieCategories.autoPinEdge(.top, to: .bottom, of: movieRelease, withOffset: 5)
        movieCategories.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
        
        addInFavouriteButton.autoPinEdge(.bottom, to: .bottom, of: view, withOffset: -20)
        addInFavouriteButton.autoPinEdge(.left, to: .left, of: view, withOffset: 20)

    }
    
    private func styleComponents(){
        
        movieTitle.text = movieData.name + " (" + String(movieData.year) + ")"
        movieTitle.textColor = .white
        movieTitle.font = UIFont.systemFont(ofSize: 20)
        
        
        movieScore.text = String(movieData.rating) + " User Score"
        movieScore.textColor = .white
        movieScore.font = UIFont.systemFont(ofSize: 15)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let date = dateFormatter.date(from: movieData.releaseDate)
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        movieRelease.text = dateFormatter.string(from: date!)
        movieRelease.textColor = .white
        movieRelease.font = UIFont.systemFont(ofSize: 15)
        
//        TODO
        
        let categoriesTitles: [String] = movieData.categories.map{
            $0.stringValue()
        }
        
//        print(categoriesTitles.joined(separator: ", "))
        
        movieCategories.text = categoriesTitles.joined(separator: ", ") + " " + String(movieData.duration / 60) + "h " + String(movieData.duration % 60) + "m"
        movieCategories.textColor = .white
        movieCategories.font = UIFont.systemFont(ofSize: 15)
        
        addInFavouriteButton.setBackgroundImage(UIImage(systemName: "star.circle.fill"), for: .normal)
    }
    
    
    private func setImageFromURL(_ imageUrlString: String){
//        print(imageUrlString)
        if let imageUrl = URL(string: imageUrlString){
            DispatchQueue.global().async { [weak self] in
                if let imageData = try? Data(contentsOf: imageUrl), let image = UIImage(data: imageData){
                    DispatchQueue.main.async {
                        self?.movieImageView.image = image
                    }
                }
            }
        }
        
    }
}
