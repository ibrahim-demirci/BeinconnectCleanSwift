//
//  HeaderView.swift
//  BeinconnectCleanSwift
//
//  Created by İbrahim on 18.11.2023.
//

import UIKit

class HeaderView: UIView {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "header")
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        addGradient()
    }
    
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
