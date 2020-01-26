

import Foundation

class Services {
    static var feedProvider: FeedDataProvider = {
        return FeedDataProvider()
    }()
    
    static var algoProvider: AlgoProvider = {
        return AlgoProvider()
    }()
    
    static var feedItemsProvider: AlgorithmItemsProvider = {
        return AlgorithmItemsProvider(networkClient: Services.networkClient)
    }()
    
    static var networkClient: NetworkClient = {
        return NetworkClientBuilder()
            .setScheme(scheme: "https")
            .setHost(host: "test.ru")
            .build()
    }()
}
