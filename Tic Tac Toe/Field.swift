class Field: Equatable {
    var player: Player? = nil
    
    var isEnded: Bool {
        player != nil
    }
    
    var winner: Player? {
        player
    }
    
    static func == (lhs: Field, rhs: Field) -> Bool {
        lhs.player == rhs.player
    }
}
