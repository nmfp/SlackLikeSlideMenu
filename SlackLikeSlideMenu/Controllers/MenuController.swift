//
//  MenuController.swift
//  SlackLikeSlideMenu
//
//  Created by Nuno Pereira on 25/10/2018.
//  Copyright © 2018 Nuno Pereira. All rights reserved.
//

import UIKit

class MenuController: UITableViewController {
    
    let cellId = "cellId"
    let menuItems = [
        MenuItem(icon: #imageLiteral(resourceName: "profile"), title: "Home"),
        MenuItem(icon: #imageLiteral(resourceName: "lists"), title: "Lists"),
        MenuItem(icon: #imageLiteral(resourceName: "bookmarks"), title: "Bookmarks"),
        MenuItem(icon: #imageLiteral(resourceName: "moments"), title: "Moments")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        tableView.register(MenuItemCell.self, forCellReuseIdentifier: cellId)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MenuItemCell
        cell.titleLabel.text = menuItems[indexPath.row].title
        cell.iconImageView.image = menuItems[indexPath.row].icon
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let customHeaderView = CustomHeaderView()
        return customHeaderView
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let baseSlidingController = UIApplication.shared.keyWindow?.rootViewController as? BaseSlidingController
        baseSlidingController?.didSelectMenuItem(indexPath: indexPath)
    }
}
