//
//  BaseSlidingController.swift
//  SlackLikeSlideMenu
//
//  Created by Nuno Pereira on 26/10/2018.
//  Copyright © 2018 Nuno Pereira. All rights reserved.
//

import UIKit

class RedViewContainer: UIView { }
class BlueViewContainer: UIView { }
class DarkViewContainer: UIView { }

class BaseSlidingController: UIViewController {
    
    lazy var redView: RedViewContainer = {
        let view = RedViewContainer()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var blueView: BlueViewContainer = {
        let view = BlueViewContainer()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var darkView: DarkViewContainer = {
        let view = DarkViewContainer()
        view.backgroundColor = UIColor(white: 0, alpha: 0.8)
        view.alpha = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var redViewLeadingConstraint: NSLayoutConstraint!
    var redViewTrailingConstraint: NSLayoutConstraint!
    let menuWidth: CGFloat = 300
    var isMenuOpened = false
    let velocityThreshold: CGFloat = 500
    var rightViewController: UIViewController?
    
    let menuController = ChatroomMenuContainerController()
    
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
            redView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            blueView.topAnchor.constraint(equalTo: redView.topAnchor),
            blueView.trailingAnchor.constraint(equalTo: redView.leadingAnchor),
            blueView.bottomAnchor.constraint(equalTo: redView.bottomAnchor),
            blueView.widthAnchor.constraint(equalToConstant: menuWidth)
            ])
        
        redViewLeadingConstraint = redView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        redViewTrailingConstraint = redView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        redViewLeadingConstraint.isActive = true
        redViewTrailingConstraint.isActive = true
        
        setupViewControllers()
    }

    private func setupGesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        view.addGestureRecognizer(panGesture)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapDismiss))
        darkView.addGestureRecognizer(tapGesture)
    }
    
    private func setupViewControllers() {
        rightViewController = UINavigationController(rootViewController: HomeController())
        
        let homeView = rightViewController!.view!
        let menuView = menuController.view!
        homeView.translatesAutoresizingMaskIntoConstraints = false
        menuView.translatesAutoresizingMaskIntoConstraints = false
        redView.addSubview(homeView)
        redView.addSubview(darkView)
        blueView.addSubview(menuView)
        
        addChild(rightViewController!)
        addChild(menuController)
        
        NSLayoutConstraint.activate([
            homeView.topAnchor.constraint(equalTo: redView.topAnchor),
            homeView.leadingAnchor.constraint(equalTo: redView.leadingAnchor),
            homeView.trailingAnchor.constraint(equalTo: redView.trailingAnchor),
            homeView.bottomAnchor.constraint(equalTo: redView.bottomAnchor),
            
            menuView.topAnchor.constraint(equalTo: blueView.topAnchor),
            menuView.leadingAnchor.constraint(equalTo: blueView.leadingAnchor),
            menuView.trailingAnchor.constraint(equalTo: blueView.trailingAnchor),
            menuView.bottomAnchor.constraint(equalTo: blueView.bottomAnchor),
            
            darkView.topAnchor.constraint(equalTo: redView.topAnchor),
            darkView.leadingAnchor.constraint(equalTo: redView.leadingAnchor),
            darkView.trailingAnchor.constraint(equalTo: redView.trailingAnchor),
            darkView.bottomAnchor.constraint(equalTo: redView.bottomAnchor)
            ])
    }
    
    @objc func handleTapDismiss() {
        handleCloseMenu()
    }
    
    @objc func handlePan(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        var x = translation.x
        
        x = isMenuOpened ? x + menuWidth : x
        x = min(menuWidth, x)
        x = max(0, x)
        
        darkView.alpha = x / menuWidth
        redViewLeadingConstraint.constant = x
        redViewTrailingConstraint.constant = x
        
        if gesture.state == .ended {
            handleEnded(gesture: gesture)
        }
    }
    
    private func handleEnded(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        let velocity = gesture.velocity(in: view)
        
        if isMenuOpened {
            if abs(velocity.x) > velocityThreshold {
                handleCloseMenu()
                return
            }
            
            if abs(translation.x) < menuWidth / 2 {
                handleOpenMenu()
            } else {
                handleCloseMenu()
            }
        } else {
            if velocity.x > velocityThreshold {
                handleOpenMenu()
                return
            }

            if translation.x < menuWidth / 2 {
                handleCloseMenu()
            } else {
                handleOpenMenu()
            }
        }
    }
    
     func handleOpenMenu() {
        redViewLeadingConstraint.constant = menuWidth
        redViewTrailingConstraint.constant = menuWidth
        isMenuOpened = true
        performAnimations()
        setNeedsStatusBarAppearanceUpdate()
    }
    
     func handleCloseMenu() {
        redViewLeadingConstraint.constant = 0
        redViewTrailingConstraint.constant = 0
        isMenuOpened = false
        performAnimations()
        setNeedsStatusBarAppearanceUpdate()
    }
    
    func didSelectMenuItem(indexPath: IndexPath) {
        removePreviousControllerFromParent()
        handleCloseMenu()
        
        switch indexPath.row {
        case 0:
            let navController = UINavigationController(rootViewController: HomeController())
            redView.addSubview(navController.view)
            addChild(navController)
            rightViewController = navController
        case 1:
            let navController = UINavigationController(rootViewController: ListController())
            redView.addSubview(navController.view)
            addChild(navController)
            rightViewController = navController
        case 2:
            let bookmarksController = BookmarksController()
            redView.addSubview(bookmarksController.view)
            addChild(bookmarksController)
            rightViewController = bookmarksController
        default:
            let dummyController = UIViewController()
            dummyController.view.backgroundColor = .white
            dummyController.view.frame = view.frame
            let label = UILabel()
            label.text = ["1", "2", "3", "4"].randomElement()
            label.frame = dummyController.view.frame
            dummyController.view.addSubview(label)
            redView.addSubview(dummyController.view)
            addChild(dummyController)
            rightViewController = dummyController
        }
        
        redView.bringSubviewToFront(darkView)
    }
    
    private func removePreviousControllerFromParent() {
        rightViewController?.view.removeFromSuperview()
        rightViewController?.removeFromParent()
    }
    
    private func performAnimations() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
            self.darkView.alpha = self.isMenuOpened ? 1 : 0
        })
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return isMenuOpened ? .lightContent : .default
    }
}
