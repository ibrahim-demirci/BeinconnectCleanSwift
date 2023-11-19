//
//  GenresTableViewCell.swift
//  BeinconnectCleanSwift
//
//  Created by İbrahim on 18.11.2023.
//

import UIKit

class GenresTableViewCell: UITableViewCell {
    
    static let identifier = "GenresTableViewCell"
    
    weak var delegate: MoviesDataSourceDelegate?
    var movies: [Movie] = [Movie]()
    

    private lazy var collectionView: UICollectionView = {
        
        let layout: UICollectionViewFlowLayout = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.itemSize = CGSize(width: BaseHelper.getWidth() * 0.35,
                                     height: BaseHelper.getHeight() * 0.2)
            return layout
        }()
        
        
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(MovieCollectionViewCell.self,
                                forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        return collectionView
        
    }()

    func configureCell(movies: [Movie]) {
        self.movies = movies
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemPink
        contentView.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
}

extension GenresTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        guard let cell = collectionView.dequeueReusableCell(
                                            withReuseIdentifier: MovieCollectionViewCell.identifier,
                                            for: indexPath) as? MovieCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(with: movies[indexPath.row])
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.movieSelected(movie: movies[indexPath.row])
    }
}
