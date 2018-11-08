//
//  ViewController.swift
//  SlackLikeSlideMenu
//
//  Created by Nuno Pereira on 22/10/2018.
//  Copyright © 2018 Nuno Pereira. All rights reserved.
//

import UIKit

class HomeController: UITableViewController, UIGestureRecognizerDelegate {
    
    private let menuController = MenuController()
    private let menuWidth: CGFloat = 300
    private var isMenuOpened = false
    private let velocityOpenThreshold: CGFloat = 500
    private let darkCoverView = UIView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = .red
        setupNavigationItems()
        
    }

    func setupNavigationItems() {
        navigationItem.title = "Home"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Hide", style: .plain, target: self, action: #selector(handleHide))
        setupCircularNavigationButton()
    }
    
    private func setupCircularNavigationButton() {
        let customView = UIButton(type: .system)
        customView.addTarget(self, action: #selector(handleOpen), for: .touchUpInside)
        customView.setImage(#imageLiteral(resourceName: "download").withRenderingMode(.alwaysOriginal), for: .normal)
        customView.imageView?.contentMode = .scaleAspectFit
        
        customView.layer.cornerRadius = 20
        customView.clipsToBounds = true
        //Since system layout the navBar items with autolayout even if we set a frame on customView
        customView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        customView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        let barButtonItem = UIBarButtonItem(customView: customView)
        navigationItem.leftBarButtonItem = barButtonItem
    }
    
    @objc func handleOpen() {
        (UIApplication.shared.keyWindow?.rootViewController as? BaseSlidingController)?.handleOpenMenu()
    }
    
    @objc func handleHide() {
        (UIApplication.shared.keyWindow?.rootViewController as? BaseSlidingController)?.handleCloseMenu()
    }
    
    //MARK: - TableViewController
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "teste")
        cell.textLabel?.text = "Cell: Section \(indexPath.section) - Row \(indexPath.row)"
        return cell
    }
}

