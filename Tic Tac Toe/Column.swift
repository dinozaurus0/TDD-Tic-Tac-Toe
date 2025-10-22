struct Column: Collection {
    typealias Element = Field
    typealias Index = Int
    
    private let fields = [Element(), Element()]
  
    var startIndex: Index {
        fields.startIndex
    }
    
    var endIndex: Index {
        fields.endIndex
    }
   
    var isEnded: Bool {
        let hasNonEndedField = fields.first(where: { !$0.isEnded })
        return hasNonEndedField == nil
    }
    
    var isWon: Bool {
        guard fields[0].player != nil else { return false }
        return fields[0] == fields[1]
    }
    
    var winner: Player? {
        guard isWon else { return nil }
        return fields[0].player
    }
    
    subscript(position: Index) -> Element {
        guard position == 0 else { return fields[1] }
        return fields[0]
    }
    
    func index(after i: Index) -> Index {
        i + 1
    }
}
