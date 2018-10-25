//
//  ViewController.swift
//  SlackLikeSlideMenu
//
//  Created by Nuno Pereira on 22/10/2018.
//  Copyright © 2018 Nuno Pereira. All rights reserved.
//

import UIKit

class HomeController: UITableViewController {
    
    let menuController = MenuController()
    let menuWidth: CGFloat = 300
    lazy var slideTransform: CGAffineTransform = CGAffineTransform(translationX: menuWidth, y: 0)

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

    //MARK: Actions
    @objc func handleOpen() {
        print("opening...")
        
        //how do we add a ViewController instead of just plain UIView
        menuController.view.frame = CGRect(x: -menuWidth, y: 0, width: menuWidth, height: self.view.frame.height)
        
        let mainWindow = UIApplication.shared.keyWindow
        mainWindow?.addSubview(menuController.view)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.menuController.view.transform = self.slideTransform
            self.view.transform = self.slideTransform
        })
        
        addChild(menuController)
    }
    
    @objc func handleHide() {
        print("Hiding...")
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.menuController.view.transform = .identity
            self.view.transform = .identity
        })
//        menuController.view.removeFromSuperview()
//        menuController.removeFromParent()
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

