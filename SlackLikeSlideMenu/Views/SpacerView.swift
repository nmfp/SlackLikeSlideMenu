//
//  SpacerView.swift
//  SlackLikeSlideMenu
//
//  Created by Nuno Pereira on 28/10/2018.
//  Copyright © 2018 Nuno Pereira. All rights reserved.
//

import UIKit

class SpacerView: UIView {

    var space: CGFloat
    
    override var intrinsicContentSize: CGSize {
        return .init(width: space, height: space)
    }

    init(space: CGFloat) {
        self.space = space
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
