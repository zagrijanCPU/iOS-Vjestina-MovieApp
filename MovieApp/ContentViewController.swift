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
    var crewMembers: UICollectionView!
    let cellIdentifier = "cellId"
    
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
        
        let layout = UICollectionViewFlowLayout()
        crewMembers = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.addSubview(crewMembers)
        crewMembers.register(CrewMemberCell.self, forCellWithReuseIdentifier: cellIdentifier)
        crewMembers.dataSource = self
        
        
        
    }
    
    private func positionComponents(){
        overviewLabel.autoPinEdge(.top, to: .top, of: view, withOffset: 30)
        overviewLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
        
        movieSummary.autoPinEdge(.top, to: .bottom, of: overviewLabel, withOffset: 30)
        movieSummary.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
        movieSummary.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20)
        
        crewMembers.autoPinEdge(.top, to: .bottom, of: movieSummary, withOffset: 20)
        crewMembers.autoMatch(.width, to: .width, of: view)
        crewMembers.autoMatch(.height, to: .height, of: view, withOffset: view.bounds.height / 3)
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


extension ContentViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieData.crewMembers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CrewMemberCell
        
        let member = movieData.crewMembers[indexPath.item]
        cell.nameLabel.text = member.name
        cell.roleLabel.text = member.role
        
        return cell
    }
    
    
}
