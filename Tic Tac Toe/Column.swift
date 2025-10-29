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
        let firstField = fields.first
        guard let player = firstField?.player else { return false }

        let remainingFields = fields.dropFirst()
        let hasDifferentPlayer = remainingFields.first { $0.player != player }
        let allPlayersSame = hasDifferentPlayer == nil
        return allPlayersSame
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
