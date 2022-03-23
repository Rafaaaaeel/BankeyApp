//
//  MainViewController.swift
//  LoginViewNumber2
//
//  Created by Rafael Oliveira on 21/03/22.
//

import Foundation
import UIKit


class MainViewController: UITabBarController{
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupBar()
        
    }
    
    private func setupViews(){
        let summaryVC = AccountSummaryViewController()
        let moneyVC = MoveMoneyViewController()
        let moreVC = MoreViewController()
        
        summaryVC.setTabBarImage(imageName: "list.dash.header.rectangle", title: "Summary")
        moneyVC.setTabBarImage(imageName: "arrow.left.arrow.right", title: "Move Money")
        moreVC.setTabBarImage(imageName: "ellipsis.circle", title: "More")
        
        let summaryNC = UINavigationController(rootViewController: summaryVC)
        let moneyNC = UINavigationController(rootViewController: moneyVC)
        let moreNC = UINavigationController(rootViewController: moreVC)
        
        summaryNC.navigationBar.barTintColor = appColor
        hideNavigationBarLine(summaryNC.navigationBar)
        
        let tabBarList = [summaryNC, moneyNC, moreNC]
        
        viewControllers = tabBarList
    }
    
    private func hideNavigationBarLine(_ navigationBar: UINavigationBar){
        let img = UIImage()
        navigationBar.shadowImage = img
        navigationBar.setBackgroundImage(img, for: .default)
        navigationBar.isTranslucent = false
    }
    
    private func setupBar(){
        tabBar.tintColor = appColor
        tabBar.isTranslucent = false
    }
}

class AccountSummaryViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
}
class MoveMoneyViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}
class MoreViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }
}
