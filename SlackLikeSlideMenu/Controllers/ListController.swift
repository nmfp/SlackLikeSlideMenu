//
//  ListController.swift
//  SlackLikeSlideMenu
//
//  Created by Nuno Pereira on 01/11/2018.
//  Copyright © 2018 Nuno Pereira. All rights reserved.
//

import UIKit

class ListController: UIViewController {

    let label: UILabel = {
        let label = UILabel()
        label.text = "LIST"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.frame = view.frame
        view.addSubview(label)
    }

}
