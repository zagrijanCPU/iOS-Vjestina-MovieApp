
import UIKit
import PureLayout
import MovieAppData

class MovieCell: UICollectionViewCell {
    static let reuseIdentifier = "cellId"

    var movieTitleLabel: UILabel!;
    var movieImageView: UIImageView!
    var movieSummaryLabel: UILabel!
    
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
        movieImageView.autoPinEdge(toSuperviewEdge: .leading)
        movieImageView.autoSetDimensions(to: CGSize(width: 75, height: 150))
        movieImageView.contentMode = .scaleAspectFill
        movieImageView.clipsToBounds = true
        
        movieTitleLabel = UILabel()
        movieTitleLabel.textColor = .black
        movieTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        movieTitleLabel.numberOfLines = 0
        movieTitleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        addSubview(movieTitleLabel)
        movieTitleLabel.autoPinEdge(.leading, to: .trailing, of: movieImageView, withOffset: 10);
        movieTitleLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 10)
        movieTitleLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20)
        
        movieSummaryLabel = UILabel();
        movieSummaryLabel.textColor = .black;
        movieSummaryLabel.translatesAutoresizingMaskIntoConstraints = false
        movieSummaryLabel.numberOfLines = 3
        movieSummaryLabel.lineBreakMode = .byTruncatingTail;
        movieSummaryLabel.font = UIFont.systemFont(ofSize: 12)
        addSubview(movieSummaryLabel);
        movieSummaryLabel.autoPinEdge(.leading, to: .trailing, of: movieImageView, withOffset: 10);
        movieSummaryLabel.autoPinEdge(.top, to: .bottom, of: movieTitleLabel, withOffset: 20);
        movieSummaryLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20)
        
    }
    
    func configure(with movie: MovieModel) {
        movieTitleLabel.text = movie.name
        setImageFromURL(movie.imageUrl)
        movieSummaryLabel.text = movie.summary
        
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
