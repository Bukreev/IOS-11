

import Foundation

struct UnitsSearcher {
    typealias RegexpUnitItem = (regex: String, unit: UnitLength)
    
    var lengthRegexItems = [
        RegexpUnitItem(regex: #"[0-9]+(\.|\,)?[0-9]*\s*(метров|метр|м)"#, unit: UnitLength.meters)
    ]
    private let searcher:Searcher
    
    
    init(searcher: Searcher = Searcher()) {
        self.searcher = searcher
    }
    
    func search(text: String) -> [Measurement<Unit>] {
        var items = [Measurement]()
        for regexpItem in lengthRegexItems {
            let foundItems = searcher.search(text: text, regexp: regexpItem.regex)
            for lengthItem in foundItems {
                var digit = lengthItem.trimmingCharacters(in: CharacterSet(charactersIn: "01234567890.,").inverted)
                digit = digit.replacingOccurrences(of: ",", with: ".")
                if let unitValue = Double(digit) {
                    items.append(Measurement(value: unitValue, unit: regexpItem.unit))
                } else {
                    print("Invalid value \(digit)")
                }
            }
        }
        return items
    }
}
