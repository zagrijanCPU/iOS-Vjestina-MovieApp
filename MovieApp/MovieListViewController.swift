

import Foundation
import UIKit
import PureLayout
import MovieAppData

class MovieListViewController : UIViewController{
    
    var movies: [MovieModel]!;
    let cellIdentifier = "cellId";
    
    override func viewDidLoad() {
        print("MovieListViewController");
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let flowLayout = UICollectionViewFlowLayout();
        flowLayout.scrollDirection = .vertical;
        flowLayout.minimumLineSpacing = 10;
        let collectionView = UICollectionView(
            frame: CGRect(
                x: 0, y: 0, width: view.bounds.width, height: view.bounds.height
            ),
            collectionViewLayout: flowLayout);
        
        collectionView.backgroundColor = .white;
        view.addSubview(collectionView);
        
        
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.reuseIdentifier)
        collectionView.dataSource = self;
        collectionView.delegate = self;
        
        let movieUseCase = MovieUseCase();
        movies = movieUseCase.allMovies;
        
//        print(movies);
    }
}

extension MovieListViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.reuseIdentifier, for: indexPath) as? MovieCell else {
            fatalError("Failed to dequeue MovieCell")
        }
        
        cell.configure(with: movies[indexPath.item])
        cell.backgroundColor = .white;
        cell.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2)
        cell.layer.shadowOpacity = 0.3
        cell.layer.shadowRadius = 8
        cell.layer.cornerRadius = 10
        return cell
    }

}

extension MovieListViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width-20, height: 150)
    }
}
