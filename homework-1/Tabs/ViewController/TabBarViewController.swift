
import UIKit

class TabBarViewController: UITabBarController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return  self.viewControllers?.last?.preferredStatusBarStyle ?? .default
    }
}
