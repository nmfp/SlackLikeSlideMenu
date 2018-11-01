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
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(handleOpen))
    }
    
    @objc func handleOpen() {
        
    }
    
    @objc func handleHide() {
        
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

