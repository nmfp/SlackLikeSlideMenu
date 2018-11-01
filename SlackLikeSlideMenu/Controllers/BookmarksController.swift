//
//  BookmarksController.swift
//  SlackLikeSlideMenu
//
//  Created by Nuno Pereira on 01/11/2018.
//  Copyright © 2018 Nuno Pereira. All rights reserved.
//

import UIKit

class BookmarksController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cellId")
        cell.textLabel?.text = "Row: \(indexPath.row)"
        return cell
    }
}
