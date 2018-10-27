//
//  BaseSlidingController.swift
//  SlackLikeSlideMenu
//
//  Created by Nuno Pereira on 26/10/2018.
//  Copyright © 2018 Nuno Pereira. All rights reserved.
//

import UIKit

class BaseSlidingController: UIViewController {
    
    lazy var redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var redViewLeadingConstraint: NSLayoutConstraint!
    let menuWidth: CGFloat = 300
    var isMenuOpened = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow

        setupViews()
        setupGesture()
    }
    
    fileprivate func setupViews() {
        view.addSubview(redView)
        view.addSubview(blueView)
        
        NSLayoutConstraint.activate([
            redView.topAnchor.constraint(equalTo: view.topAnchor),
            redView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            redView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            blueView.topAnchor.constraint(equalTo: redView.topAnchor),
            blueView.trailingAnchor.constraint(equalTo: redView.leadingAnchor),
            blueView.bottomAnchor.constraint(equalTo: redView.bottomAnchor),
            blueView.widthAnchor.constraint(equalToConstant: menuWidth)
            ])
        
        redViewLeadingConstraint = redView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        redViewLeadingConstraint.isActive = true
        
        setupViewControllers()
    }

    private func setupGesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        view.addGestureRecognizer(panGesture)
    }
    
    private func setupViewControllers() {
        let homeController = HomeController()
        let menuController = MenuController()
        let homeView = homeController.view!
        let menuView = menuController.view!
        homeView.translatesAutoresizingMaskIntoConstraints = false
        menuView.translatesAutoresizingMaskIntoConstraints = false
        redView.addSubview(homeView)
        blueView.addSubview(menuView)
        
        addChild(homeController)
        addChild(menuController)
        
        NSLayoutConstraint.activate([
            homeView.topAnchor.constraint(equalTo: redView.topAnchor),
            homeView.leadingAnchor.constraint(equalTo: redView.leadingAnchor),
            homeView.trailingAnchor.constraint(equalTo: redView.trailingAnchor),
            homeView.bottomAnchor.constraint(equalTo: redView.bottomAnchor),
            
            menuView.topAnchor.constraint(equalTo: blueView.topAnchor),
            menuView.leadingAnchor.constraint(equalTo: blueView.leadingAnchor),
            menuView.trailingAnchor.constraint(equalTo: blueView.trailingAnchor),
            menuView.bottomAnchor.constraint(equalTo: blueView.bottomAnchor)
            ])
    }
    
    @objc func handlePan(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        var x = translation.x
        
        x = isMenuOpened ? x + menuWidth : x
        
        x = min(menuWidth, x)
        x = max(0, x)
        redViewLeadingConstraint.constant = x
        
        if gesture.state == .ended {
            handleEnded(gesture: gesture)
        }
    }
    
    private func handleEnded(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        
        if translation.x < menuWidth / 2 {
            redViewLeadingConstraint.constant = 0
            isMenuOpened = false
        } else {
            redViewLeadingConstraint.constant = menuWidth
            isMenuOpened = true
        }
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        })
    }
}
