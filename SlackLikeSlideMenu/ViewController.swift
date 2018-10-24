//
//  ViewController.swift
//  SlackLikeSlideMenu
//
//  Created by Nuno Pereira on 22/10/2018.
//  Copyright © 2018 Nuno Pereira. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

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
        let vc = MenuController()
        vc.view.backgroundColor = .yellow
        
        vc.view.frame = CGRect(x: 0, y: 0, width: 300, height: self.view.frame.height)
        
        let mainWindow = UIApplication.shared.keyWindow
        mainWindow?.addSubview(vc.view)
        
    }
    
    @objc func handleHide() {
        print("Hiding...")
    }
    
    
    //MARK: - TableViewController
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cellId")
        return cell
    }
}

