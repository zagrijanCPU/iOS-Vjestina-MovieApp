import UIKit
import Foundation
import PureLayout
import MovieAppData

class MovieCollectionView: UICollectionView {
    var movies: [MovieModel] = []
    
    init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout, movies: [MovieModel]) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.movies = movies
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .white
        dataSource = self
        delegate = self
        register(MovieImage.self, forCellWithReuseIdentifier: MovieImage.reuseIdentifier)
    }
}

extension MovieCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieImage.reuseIdentifier, for: indexPath) as? MovieImage else {
            fatalError("Failed to dequeue MovieCell")
        }
        cell.configure(with: movies[indexPath.item]);
        cell.backgroundColor = .white;
        cell.layer.masksToBounds = false
        cell.layer.cornerRadius = 10
        return cell
    }
}

extension MovieCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 150)
    }
}
