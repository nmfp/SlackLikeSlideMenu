//
//  SearchBarContainer.swift
//  SlackLikeSlideMenu
//
//  Created by Nuno Pereira on 06/11/2018.
//  Copyright © 2018 Nuno Pereira. All rights reserved.
//

import UIKit

class SearchBarContainer: UIView {

    let rocketImageView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "rocket"))
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.layer.cornerRadius = 3
        iv.clipsToBounds = true
        return iv
    }()
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = #colorLiteral(red: 0.2156862745, green: 0.1490196078, blue: 0.2235294118, alpha: 1)
        translatesAutoresizingMaskIntoConstraints = false
        
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).textColor = .white
        
        addSubview(searchBar)
        addSubview(rocketImageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        rocketImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        rocketImageView.centerYAnchor.constraint(equalTo: searchBar.centerYAnchor).isActive = true
        rocketImageView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        rocketImageView.widthAnchor.constraint(equalToConstant: 44).isActive = true
        
        searchBar.leadingAnchor.constraint(equalTo: rocketImageView.trailingAnchor).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        searchBar.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4).isActive = true
    }
}
