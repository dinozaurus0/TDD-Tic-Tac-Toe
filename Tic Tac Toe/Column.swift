struct Column: Collection {
    typealias Element = Field
    typealias Index = Int
    
    private let fields = [Element(), Element()]
    
    var field1: Element {
        fields[0]
    }
    
    var field2: Element {
        fields[1]
    }
    
    var startIndex: Index {
        0
    }
    
    var endIndex: Index {
        2
    }
   
    var isEnded: Bool {
        return field1.isEnded && field2.isEnded
    }
    
    var isWon: Bool {
        guard field1.player != nil else { return false }
        return field1 == field2
    }
    
    var winner: Player? {
        guard isWon else { return nil }
        return field1.player
    }
    
    subscript(position: Index) -> Element {
        guard position == 0 else { return field2 }
        return field1
    }
    
    func index(after i: Index) -> Index {
        i + 1
    }
}
