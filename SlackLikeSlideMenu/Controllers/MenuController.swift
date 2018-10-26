//
//  MenuController.swift
//  SlackLikeSlideMenu
//
//  Created by Nuno Pereira on 25/10/2018.
//  Copyright © 2018 Nuno Pereira. All rights reserved.
//

import UIKit

class MenuController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
//        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
//        self.view.addGestureRecognizer(panGesture)
//    }
//    
//    @objc func handlePan(gesture: UIPanGestureRecognizer) {
//        let translation = gesture.translation(in: view)
//        let x = translation.x
//        self.view.transform = CGAffineTransform(translationX: x, y: 0)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cellId")
        cell.textLabel?.text = "Menu"
        return cell
    }
}
