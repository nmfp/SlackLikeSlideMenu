//
//  ChatroomsMenuController.swift
//  SlackLikeSlideMenu
//
//  Created by Nuno Pereira on 03/11/2018.
//  Copyright © 2018 Nuno Pereira. All rights reserved.
//

import UIKit

class ChatroomsMenuController: UITableViewController {
    
    let sectionTitles = [
        "UNREADS",
        "CHANNELS",
        "DIRECT MESSAGES"
    ]
    
    let chatroomGroups = [
        ["general", "introductions"],
        ["jobs"],
        ["Nuno Pereira", "Steve Jobs", "Tim Cook", "Barak Obama"]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = .none
        tableView.backgroundColor = #colorLiteral(red: 0.2980392157, green: 0.2078431373, blue: 0.2862745098, alpha: 1)
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
     
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatroomGroups[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = chatroomGroups[indexPath.section][indexPath.row]
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        cell.textLabel?.textColor = .white
        cell.backgroundColor = .clear
        return cell
    }
    
    
}
