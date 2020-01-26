

import Foundation

class AlgorithmsStorage: Storage {
    let algorithmsFileName = "algorithmsFileName"
    let cacheDirectory = Directory.caches
    
    func getCachedData(_ completion: ([AlgorithmItem]) -> ()) {
        completion(retrieve(algorithmsFileName, from: cacheDirectory, as: [AlgorithmItem].self))
    }
    
    func isCacheExist() -> Bool {
        return isFileExist(fileName: algorithmsFileName, from: cacheDirectory)
    }
    
    func cacheData(_ items:[AlgorithmItem]) {
        store(items, to: cacheDirectory, as: algorithmsFileName)
    }
}
