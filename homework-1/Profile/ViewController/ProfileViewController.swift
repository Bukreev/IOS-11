

import UIKit

class ProfileViewController: UIViewController {
    
    var statusBarStyle: UIStatusBarStyle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBehaviors(behaviors: [ChangeColorBehavior(), HideNavigationBarBehavior()])
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return statusBarStyle ?? .default
    }

}
