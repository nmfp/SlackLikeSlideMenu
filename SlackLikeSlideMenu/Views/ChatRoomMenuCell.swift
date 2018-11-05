//
//  ChatRoomMenuCell.swift
//  SlackLikeSlideMenu
//
//  Created by Nuno Pereira on 03/11/2018.
//  Copyright © 2018 Nuno Pereira. All rights reserved.
//

import UIKit

class ChatRoomMenuCell: UITableViewCell {
    
    let bgView: UIView = {
        let v = UIView()
        v.backgroundColor = #colorLiteral(red: 0.2823529412, green: 0.5921568627, blue: 0.4980392157, alpha: 1)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 5
        return v
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        bgView.isHidden = !selected
    }

    
    private func setupViews() {
        selectionStyle = .none
        addSubview(bgView)

        bgView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        bgView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        bgView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        bgView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        sendSubviewToBack(bgView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
