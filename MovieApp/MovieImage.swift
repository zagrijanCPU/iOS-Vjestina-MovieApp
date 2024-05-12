

import Foundation
import UIKit
import PureLayout
import MovieAppData

class MovieImage: UICollectionViewCell{
    static let reuseIdentifier = "cellId"

    var movieImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        movieImageView = UIImageView()
        addSubview(movieImageView)
        movieImageView.layer.cornerRadius = 10
        movieImageView.autoPinEdgesToSuperviewEdges()
        movieImageView.contentMode = .scaleAspectFill
        movieImageView.clipsToBounds = true
        
        
    }
    
    func configure(with movie: MovieModel) {
        setImageFromURL(movie.imageUrl)
        
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
