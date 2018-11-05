//
//  ChatroomHeaderLabel.swift
//  SlackLikeSlideMenu
//
//  Created by Nuno Pereira on 04/11/2018.
//  Copyright © 2018 Nuno Pereira. All rights reserved.
//

import Foundation
import UIKit



class ChatroomHeaderLabel: UILabel {
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.insetBy(dx: 16, dy: 0))
    }
}
