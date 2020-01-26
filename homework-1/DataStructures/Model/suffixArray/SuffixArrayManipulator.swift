

import Foundation

protocol SuffixArrayManipulator {
    func arrayHasObjects() -> Bool
    func setupWithSize(_ size: Int) -> TimeInterval
    func setupWithObjects(items: [String], reverse: Bool) -> TimeInterval
    func searchRandomWords(count: Int, wordSize: Int) -> TimeInterval
    func searchAlgoName(query: String) -> [String]
}
