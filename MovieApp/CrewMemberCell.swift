//
//  CrewMemberCell.swift
//  MovieApp
//
//  Created by endava on 08.04.2024..
//

import Foundation
import UIKit

class CrewMemberCell: UICollectionViewCell{
    var nameLabel: UILabel!
    var roleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        nameLabel = UILabel()
        contentView.addSubview(nameLabel)
        
        
        roleLabel = UILabel()
        contentView.addSubview(roleLabel)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
