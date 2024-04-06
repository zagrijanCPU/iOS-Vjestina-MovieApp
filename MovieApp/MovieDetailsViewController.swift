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
    
    var header: HeaderViewController!
    var content: ContentViewController!
    
    override func viewDidLoad() {
        print("MovieDetailsViewController")
        super.viewDidLoad()
        view.backgroundColor = .white
        
        buildViews()
        positionViews()
    }
    
    private func buildViews(){
        header = HeaderViewController()
        view.addSubview(header.view)
        
        content = ContentViewController()
        view.addSubview(content.view)
    }
    
    private func positionViews(){
    
        header.view.autoPinEdge(.top, to: .top, of: view)
        header.view.autoMatch(.width, to: .width, of: view)
        header.view.autoSetDimension(.height, toSize: view.bounds.height / 2.5)
        
        content.view.autoMatch(.width, to: .width, of: view)
        content.view.autoPinEdge(.top, to: .bottom, of: header.view)
        content.view.autoPinEdge(.bottom, to: .bottom, of: view)
        
    }
    
    
    public static func getMovieData(id: Int) -> MovieDetailsModel? {
        let data = MovieUseCase()
        let movieData = data.getDetails(id: id)
        print(movieData?.crewMembers)
        return movieData
    }
    
}
