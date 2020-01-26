
import Foundation
import RealmSwift
import DynamicJSON

public class RealmObject: Object {
    
    convenience required init(data: JSON) {
        self.init()
    }
}
