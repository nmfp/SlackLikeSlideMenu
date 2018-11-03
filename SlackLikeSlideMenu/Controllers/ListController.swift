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
        label.font = UIFont.systemFont(ofSize: 64, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.frame = view.frame
        view.addSubview(label)
        view.backgroundColor = .white
    }

}
