//
//  CustomTabbarController.swift
//  EditPhotos
//
//  Created by ShapeeCloud on 5/8/21.
//

import UIKit

class CustomTabbarController: UITabBarController {
    var customTabBar: CustomTabBar!
    var tabBarHeight: CGFloat = 60
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCustomTabMenu()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func changeTab(tab: Int) {
        self.selectedIndex = tab
    }
    
    func setupCustomTabMenu() {
        var frame = tabBar.frame
        frame.size.height = 60
        // Ẩn tab bar mặc định của hệ thống đi
        tabBar.isHidden = true
        // Khởi tạo custom tab bar
        customTabBar = CustomTabBar()
        customTabBar.translatesAutoresizingMaskIntoConstraints = false
        customTabBar.clipsToBounds = true
        customTabBar.frame = frame
        customTabBar.itemTapped = changeTab(tab:)
        view.addSubview(customTabBar)
        view.backgroundColor = .white
        
        // Auto layout cho custom tab bar
        NSLayoutConstraint.activate([
            customTabBar.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor,constant: 0),
            customTabBar.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor,constant: 0),
            customTabBar.widthAnchor.constraint(equalToConstant: tabBar.frame.width),
            customTabBar.heightAnchor.constraint(equalToConstant: tabBarHeight),
            customTabBar.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:0)
        ])
        view.layoutIfNeeded()
    }
}

