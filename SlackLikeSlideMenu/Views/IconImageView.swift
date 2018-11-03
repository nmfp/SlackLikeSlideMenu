//
//  IconImageView.swift
//  SlackLikeSlideMenu
//
//  Created by Nuno Pereira on 01/11/2018.
//  Copyright © 2018 Nuno Pereira. All rights reserved.
//

import Foundation
import UIKit

class IconImageView: BaseImageView { }

class BaseImageView: UIImageView {
    var value: CGFloat!
    
    override var intrinsicContentSize: CGSize {
        return .init(width: value, height: value)
    }
    
    init(with value: CGFloat) {
        self.value = value
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
