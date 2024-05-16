import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let profileVC = UIViewController()
        profileVC.view.backgroundColor = .white
        profileVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "btn_mybank_ios"), tag: 0)
        
        let gridVC = UIViewController()
        gridVC.view.backgroundColor = .white
        gridVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "btn_menu_ios"), tag: 1)
        
        let bellVC = UIViewController()
        bellVC.view.backgroundColor = .white
        bellVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "btn_notification_ios"), tag: 2)
        
        let dotsVC = UIViewController()
        dotsVC.view.backgroundColor = .white
        dotsVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "btn_mypage_ios"), tag: 3)
        
        let viewControllers = [profileVC, gridVC, bellVC, dotsVC]
        self.setViewControllers(viewControllers, animated: false)
        
        if let items = tabBar.items {
            for item in items {
                item.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
            }
        }
        
        tabBar.barTintColor = .white
        tabBar.isTranslucent = false
    }
}
