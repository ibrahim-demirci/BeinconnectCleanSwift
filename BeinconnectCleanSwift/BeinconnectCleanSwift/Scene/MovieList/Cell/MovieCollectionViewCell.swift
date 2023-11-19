//
//  MovieCollectionViewCell.swift
//  BeinconnectCleanSwift
//
//  Created by İbrahim on 19.11.2023.
//

import UIKit
import SDWebImage

class MovieCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MovieCollectionViewCell"
    
    private lazy var posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = ViewDimensionConstants.four.rawValue
        imageView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return imageView
    }()
    
    private lazy var movieLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .center
        label.backgroundColor = .systemGray6
        label.clipsToBounds = true
        label.lineBreakMode = .byTruncatingMiddle
        label.layer.cornerRadius = ViewDimensionConstants.four.rawValue
        label.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(movieLabel)
        contentView.addSubview(posterImageView)
        contentView.backgroundColor = .systemBackground
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func applyConstraints() {
        
        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: topAnchor),
            posterImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            posterImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            posterImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
            
            movieLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor),
            movieLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            movieLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            movieLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layer.cornerRadius = ViewDimensionConstants.eight.rawValue
    }
    
    func configure(with model: Movie) {
        if let path = model.backdropPath {
            guard let url = URL(string: API.imageBaseUrl + path) else { return }
            posterImageView.sd_setImage(with: url, completed: nil)
        }
        
        movieLabel.text = model.title
    }
}
