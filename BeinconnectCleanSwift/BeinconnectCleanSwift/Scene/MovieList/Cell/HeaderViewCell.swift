//
//  HeaderViewCell.swift
//  BeinconnectCleanSwift
//
//  Created by İbrahim on 19.11.2023.
//

import UIKit

class HeaderViewCell: UITableViewCell {
    
    static let identifider = "HeaderViewCell"

    lazy var label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = contentView.bounds.inset(by: UIEdgeInsets(top: 0, left: ViewDimensionConstants.eight.rawValue, bottom: 0, right: 0))
    }
}
