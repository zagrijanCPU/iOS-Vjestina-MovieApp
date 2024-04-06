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
    var movieGenre: UILabel!
    var movieImageView: UIImageView!
    var addInFavouriteButton: UIButton!
    
    override func viewDidLoad() {
        print("HeaderViewController")
        super.viewDidLoad()
        
        getData()
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
        
        movieGenre = UILabel()
        view.addSubview(movieGenre)
        
        addInFavouriteButton = UIButton(type: .custom)
        view.addSubview(addInFavouriteButton)
        
    }
    
    private func positionComponents(){
        movieImageView.autoMatch(.width, to: .width, of: view)
        movieImageView.autoMatch(.height, to: .height, of: view)
        movieImageView.contentMode = .scaleAspectFill
        movieImageView.clipsToBounds = true
        
        movieTitle.autoCenterInSuperview()
        movieTitle.autoPinEdge(toSuperviewEdge: .leading, withInset: 10)
        
        movieRelease.autoPinEdge(.top, to: .bottom, of: movieTitle, withOffset: 20)
        movieRelease.autoPinEdge(toSuperviewEdge: .leading, withInset: 10)
        
        movieScore.autoPinEdge(.bottom, to: .top, of: movieTitle, withOffset: -20)
        movieScore.autoPinEdge(toSuperviewEdge: .leading, withInset: 10)
        
        movieGenre.autoPinEdge(.top, to: .bottom, of: movieRelease, withOffset: 5)
        movieGenre.autoPinEdge(toSuperviewEdge: .leading, withInset: 10)
        
        addInFavouriteButton.autoPinEdge(.bottom, to: .bottom, of: view, withOffset: -10)
        addInFavouriteButton.autoPinEdge(.left, to: .left, of: view, withOffset: 10)

    }
    
    private func styleComponents(){
        
        movieTitle.text = movieData.name + " (" + String(movieData.year) + ")"
        movieTitle.textColor = .white
        
        movieScore.text = String(movieData.rating) + " User Score"
        movieScore.textColor = .white
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let date = dateFormatter.date(from: movieData.releaseDate)
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        movieRelease.text = dateFormatter.string(from: date!)
        movieRelease.textColor = .white
        
//        TODO
        movieGenre.text = "Genres..." + String(movieData.duration / 60) + "h " + String(movieData.duration % 60) + "m"
        movieGenre.textColor = .white
        
        addInFavouriteButton.setBackgroundImage(UIImage(systemName: "star.circle.fill"), for: .normal)
//        Change title with svg icon
//        addInFavouriteButton.setTitle("Add", for: .normal)
//        Set circle to button
    }
    
    private func getData(){
        let data = MovieUseCase()
        movieData = data.getDetails(id: 111161)
//        for category in movieData.categories {
//            print(category)
//        }
        print(movieData.duration)
        print(movieData.duration / 60, movieData.duration % 60)
        
    }
    

    private func setImageFromURL(_ imageUrlString: String){
        print(imageUrlString)
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
