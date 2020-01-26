

import UIKit

class ChangeColorBehavior: ViewControllerLifecycleBehavior {
    private var previousBarStyle: UIBarStyle?
    private var previousStatusBarStyle: UIStatusBarStyle?
    
    
    func afterAppearing(_ viewController: UIViewController) {
        viewController.view.backgroundColor = UIColor.black
        previousBarStyle = viewController.navigationController?.navigationBar.barStyle
        viewController.navigationController?.navigationBar.barStyle = .black
        if let vc = viewController as? ProfileViewController {
            previousStatusBarStyle = viewController.preferredStatusBarStyle
            vc.statusBarStyle = .lightContent
            vc.setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    func afterDisappearing(_ viewController: UIViewController) {
        viewController.navigationController?.navigationBar.barStyle = previousBarStyle ?? .default
        if let vc = viewController as? ProfileViewController {
            vc.statusBarStyle = previousStatusBarStyle ?? .default
            vc.setNeedsStatusBarAppearanceUpdate()
        }
    }
}
