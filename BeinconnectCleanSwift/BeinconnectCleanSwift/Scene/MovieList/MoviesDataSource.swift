//
//  MoviesDataSource.swift
//  BeinconnectCleanSwift
//
//  Created by İbrahim on 18.11.2023.
//

import UIKit

class MoviesDataSource: NSObject {
    
    weak var delegate: MoviesDataSourceDelegate?

    var genres: [Genre]
    
    init(_ genres: [Genre]) {
        self.genres = genres
    }
}

extension MoviesDataSource: UITableViewDataSource, UITableViewDelegate {
        
    func numberOfSections(in tableView: UITableView) -> Int {
        genres.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GenresTableViewCell.identifier, for: indexPath) as? GenresTableViewCell else {
            return UITableViewCell()
        }
        
        cell.delegate = delegate
        delegate?.fetchSectionItems(id: genres[indexPath.section].id, indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return BaseHelper.getHeight() * 0.2
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return BaseHelper.getHeight() * 0.05
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HeaderViewCell.identifider) as? HeaderViewCell else {
            return UITableViewHeaderFooterView()
        }
        
        cell.label.text = genres[section].name
        return cell
    }

    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return genres[section].name
    }
}
