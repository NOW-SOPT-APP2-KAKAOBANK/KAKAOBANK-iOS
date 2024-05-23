import UIKit

import SnapKit
import Then

class MainTabBarController: UITabBarController {

    let profileVC = MainViewController()
    let gridVC = UIViewController()
    let bellVC = UIViewController()
    let dotsVC = UIViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setHierarchy()
    }
    
    private func setStyle() {
        profileVC.do {
            $0.view.backgroundColor = UIColor(resource: .darkgray1)
            $0.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "btn_mybank_ios"), tag: 0)
        }
        
        gridVC.do {
            $0.view.backgroundColor = .white
            $0.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "btn_menu_ios")?.withRenderingMode(.alwaysOriginal), tag: 1)
        }
        
        bellVC.do {
            $0.view.backgroundColor = .white
            $0.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "btn_notification_ios")?.withRenderingMode(.alwaysOriginal), tag: 2)
        }
        
        dotsVC.do {
            $0.view.backgroundColor = .white
            $0.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "btn_mypage_ios")?.withRenderingMode(.alwaysOriginal), tag: 3)
        }
        
        tabBar.do {
            $0.barTintColor = UIColor(resource: .white)
            $0.isTranslucent = false
            $0.tintColor = UIColor(named: "black2")
            $0.backgroundColor = .white
        }
    }
    
    private func setHierarchy() {
        let profileNavVC = UINavigationController(rootViewController: profileVC)
        
        profileNavVC.setNavigationBarHidden(true, animated: false)

        let viewControllers = [profileNavVC, gridVC, bellVC, dotsVC]
        self.setViewControllers(viewControllers, animated: false)
        
        if let items = tabBar.items {
            for item in items {
                item.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
            }
        }
    }
}
