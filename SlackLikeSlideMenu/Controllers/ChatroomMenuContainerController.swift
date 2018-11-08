//
//  ChatroomMenuContainerController.swift
//  SlackLikeSlideMenu
//
//  Created by Nuno Pereira on 05/11/2018.
//  Copyright © 2018 Nuno Pereira. All rights reserved.
//

import UIKit

class ChatroomMenuContainerController: UIViewController {
    

    let chatroomsMenuController = ChatroomsMenuController()
    let searchContainer = SearchBarContainer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.2980392157, green: 0.2078431373, blue: 0.2862745098, alpha: 1)
        
        setupViews()
    }

    private func setupViews() {
        
        let chatroomsView = chatroomsMenuController.view!
        chatroomsView.translatesAutoresizingMaskIntoConstraints = false
        searchContainer.searchBar.delegate = chatroomsMenuController
        
        view.addSubview(searchContainer)
        view.addSubview(chatroomsView)
        addChild(chatroomsMenuController)
        
        searchContainer.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        searchContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        searchContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        searchContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 64).isActive = true
        
        chatroomsView.topAnchor.constraint(equalTo: searchContainer.bottomAnchor).isActive = true
        chatroomsView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        chatroomsView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        chatroomsView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

