

import Foundation
import DynamicJSON
import RealmSwift

class AlgorithmItem: RealmObject, Codable {
    @objc dynamic var name: String = ""
    @objc dynamic var cellBackground: String = ""
    
//    init(name: String, cellBackground: String) {
//        self.name = name
//        self.cellBackground = cellBackground
//    }
    
    convenience required init(data: JSON) {
        self.init()
        self.name = data.name.string ?? ""
        self.cellBackground = data.cellBackground.string ?? ""
    }
}
