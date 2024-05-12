

import Foundation
import UIKit
import PureLayout
import MovieAppData

class MovieCategoriesViewController: UIViewController {
    
    var movieImageView: UIImageView!
    var movieTypes = ["What's popular", "Free to Watch", "Trending"];
    var popularMovies: [MovieModel]!
    var freeToWatchMovies: [MovieModel]!
    var trendingMovies: [MovieModel]!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let data = MovieUseCase();
        popularMovies = data.popularMovies;
        freeToWatchMovies = data.freeToWatchMovies;
        trendingMovies = data.trendingMovies;
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        
        stackView.autoPinEdgesToSuperviewEdges()
        
        for movieType in movieTypes {
            
            let label = UILabel()
            label.text = movieType
            label.textAlignment = .center
            stackView.addArrangedSubview(label)
            
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 10
            
            let movieCollectionView = MovieCollectionView(frame: .zero, collectionViewLayout: flowLayout, movies: [])
            stackView.addArrangedSubview(movieCollectionView)
            
            
            switch movieType {
            case "What's popular":
                movieCollectionView.movies = popularMovies
            case "Free to Watch":
                movieCollectionView.movies = freeToWatchMovies
            case "Trending":
                movieCollectionView.movies = trendingMovies
            default:
                break
            }
            
            movieCollectionView.reloadData()
        }

        
    }
}
