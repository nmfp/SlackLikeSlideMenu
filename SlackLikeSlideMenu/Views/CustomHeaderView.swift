//
//  CustomHeaderView.swift
//  SlackLikeSlideMenu
//
//  Created by Nuno Pereira on 28/10/2018.
//  Copyright © 2018 Nuno Pereira. All rights reserved.
//

import Foundation
import UIKit

class CustomHeaderView: UIView {
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .red
        label.text = "TESTE"
        return label
    }()
    
    lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .green
        label.text = "TESTE"
        return label
    }()
    
    lazy var statsLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .purple
        label.text = "TESTE"
        return label
    }()
    
    lazy var profileImage: ProfileImageView = {
        let iv = ProfileImageView(image: #imageLiteral(resourceName: "download"))
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 48 / 2
        iv.backgroundColor = .red
        return iv
    }()
    
    var stackView: UIStackView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupStackView()
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    private func setupStackView() {
        stackView = UIStackView(arrangedSubviews: [UIStackView(arrangedSubviews: [profileImage, UIView()]), nameLabel, usernameLabel, SpacerView(space: 16), statsLabel])
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 24, left: 24, bottom: 24, right: 24)
    }
}
