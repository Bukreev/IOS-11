

import Foundation
import DynamicJSON

struct AlgorithmItemsProvider {
    
    let networkClient:NetworkClient
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    func getRemoteAlgorithmItems(_ completion: @escaping ([AlgorithmItem]) -> ()) {
        Services.networkClient.request(method: "GET", path: "/otus/algorithms", queryParams: [:]) { json ,_ in
            guard let algorithms = JSON(json).items.array else {
                print("Algorithms is empty")
                completion([])
                return
            }
            var values = [AlgorithmItem]()
            for data in algorithms {
                let algorithm = AlgorithmItem.init(data: data)
                values.append(algorithm)
            }
            completion(values)
        }
        
    }
}
