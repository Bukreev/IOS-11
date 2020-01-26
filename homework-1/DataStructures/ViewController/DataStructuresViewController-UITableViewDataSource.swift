

import Foundation
import UIKit

extension DataStructuresViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        //There will always be one section
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //There are always 9 items
        return viewModel.itemsCount
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 26
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //In the superclass, just return an empty cell
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "REUSE")
        
        cell.textLabel!.text = "OVERRIDE"
        cell.detailTextLabel!.text = "in subclass!"
        cell.detailTextLabel!.textColor = UIColor.black
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        return cell
    }
}
