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
    let numberOfCellsPerRow = 3
    
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
        layout.scrollDirection = .vertical
        crewMembers = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.addSubview(crewMembers)
        crewMembers.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        crewMembers.dataSource = self
        crewMembers.delegate = self
        
        
        
    }
    
    private func positionComponents(){
        overviewLabel.autoPinEdge(.top, to: .top, of: view, withOffset: 30)
        overviewLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
        
        movieSummary.autoPinEdge(.top, to: .bottom, of: overviewLabel, withOffset: 30)
        movieSummary.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
        movieSummary.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20)
        
        crewMembers.autoPinEdge(.top, to: .bottom, of: movieSummary, withOffset: 20)
        crewMembers.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
        crewMembers.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20)
        crewMembers.autoPinEdge(.bottom, to: .bottom, of: view)
    }
    
    private func styleComponents(){
//        view.backgroundColor = .lightGray
        
        overviewLabel.text = "Overview"
        overviewLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        movieSummary.numberOfLines = 0
        movieSummary.text = movieData.summary
        movieSummary.lineBreakMode = .byWordWrapping
        movieSummary.font = UIFont.systemFont(ofSize: 12)
        
    }
    
}


extension ContentViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return movieData.crewMembers.count / 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieData.crewMembers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        
        let member = movieData.crewMembers[indexPath.item]
        let nameLabel = UILabel()
        nameLabel.text = member.name
        nameLabel.textColor = .black
        nameLabel.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        
        cell.contentView.addSubview(nameLabel)
        
        nameLabel.autoPinEdge(.top, to: .top, of: cell.contentView)
        
        
        let roleLabel = UILabel()
        roleLabel.text = member.role
        roleLabel.textColor = .black
        roleLabel.font = UIFont.systemFont(ofSize: 10)
        
        cell.contentView.addSubview(roleLabel)
        
        roleLabel.autoPinEdge(.top, to: .bottom, of: nameLabel)
        return cell
    }
}

extension ContentViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
                        UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.frame.width / CGFloat(numberOfCellsPerRow + 1)
        return CGSize(width: cellWidth, height: cellWidth / 3)
    }
}
