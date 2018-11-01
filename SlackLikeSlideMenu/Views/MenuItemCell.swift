//
//  MenuItemCell.swift
//  SlackLikeSlideMenu
//
//  Created by Nuno Pereira on 01/11/2018.
//  Copyright © 2018 Nuno Pereira. All rights reserved.
//

import Foundation
import UIKit

class MenuItemCell: UITableViewCell {

    
    let iconImageView: IconImageView = {
        let imageView = IconImageView(with: 44)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    var itemsStackView: UIStackView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupStackView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupStackView() {
        itemsStackView = UIStackView(arrangedSubviews: [iconImageView, titleLabel, UIView()])
        itemsStackView.spacing = 12
        itemsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(itemsStackView)
        
        itemsStackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        itemsStackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        itemsStackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        itemsStackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        itemsStackView.isLayoutMarginsRelativeArrangement = true
        itemsStackView.layoutMargins = UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12)
        
    }
    
}
