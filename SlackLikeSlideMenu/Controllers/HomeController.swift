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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = .red
        setupNavigationItems()
        
        setupMenuController()
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        view.addGestureRecognizer(panGesture)
    }

    func setupNavigationItems() {
        navigationItem.title = "Home"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Hide", style: .plain, target: self, action: #selector(handleHide))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(handleOpen))
    }

    //MARK: Actions
    @objc func handlePan(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        
        if gesture.state == .changed {
            var x = translation.x
            x = min(menuWidth, x)
            x = max(0, x)
            
            let transform = CGAffineTransform(translationX: x, y: 0)
            menuController.view.transform = transform
            navigationController?.view.transform = transform
        } else if gesture.state == .ended {
            handleOpen()
        }
    }
    
    
    fileprivate func setupMenuController() {
        //how do we add a ViewController instead of just plain UIView
        menuController.view.frame = CGRect(x: -menuWidth, y: 0, width: menuWidth, height: self.view.frame.height)
        
        let mainWindow = UIApplication.shared.keyWindow
        mainWindow?.addSubview(menuController.view)
        addChild(menuController)
    }
    
    @objc func handleOpen() {
        performAnimations(transform: CGAffineTransform(translationX: menuWidth, y: 0))
    }
    
    @objc func handleHide() {
        performAnimations(transform: .identity)
    }
    
    private func performAnimations(transform: CGAffineTransform) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.menuController.view.transform = transform
//            self.view.transform = transform
            self.navigationController?.view.transform = transform
        })
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

