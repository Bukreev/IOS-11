

import UIKit

class SessionSummaryViewController: UIViewController {
    @IBOutlet weak var itemLabel: UILabel!
    
    var itemName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if !itemName.isEmpty {
            itemLabel.text = "Launched from \(itemName)"
        }
        
    }

}
