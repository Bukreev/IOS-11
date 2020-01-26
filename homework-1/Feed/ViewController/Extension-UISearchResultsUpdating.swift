

import Foundation
import UIKit

extension FeedViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let query: String = searchController.searchBar.text else {
            return
        }
        viewModel.search(query: query)
    }
}
