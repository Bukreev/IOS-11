

import UIKit

class FeedViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var runTestsButton: UIBarButtonItem!
    @IBOutlet weak var itemsLoadingIndicator: UIActivityIndicatorView!
    
    @IBAction func runTestsClicked(_ sender: Any) {
        viewModel.runTasks()
    }
    
    let searchController = UISearchController(searchResultsController: nil)
    
    lazy var viewModel = FeedViewModel(
        repository: AlgorithmRepository(
            provider: Services.feedItemsProvider)
    )
    
    var isSearchBarEmpty: Bool {
        guard let query = searchController.searchBar.text else {
            return true
        }
        return query.isEmpty
    }
    
    var isFiltered: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loading(isLoading: true)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Algorithm"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        viewModel.bind{[unowned self] (state) in
            switch(state){
            case .result:
                self.loading(isLoading: false)
                self.tableView.reloadData()
                self.runTestsButton.isEnabled = !self.viewModel.testsRunned && !self.viewModel.loading
                break
            default:
                break
            }
        }
    }
    
    private func loading(isLoading: Bool){
        if isLoading {
            self.runTestsButton.isEnabled = false
            self.tableView.isHidden = true
            self.itemsLoadingIndicator.isHidden = false
        } else {
            self.tableView.isHidden = false
            self.itemsLoadingIndicator.isHidden = true
        }
    }
}
