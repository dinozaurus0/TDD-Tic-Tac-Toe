class Field {
    var player: Player? = nil
    
    var isEnded: Bool {
        player != nil
    }
    
    var isWon: Bool {
        isEnded
    }
    
    var winner: Player? {
        player
    }
    
    static func == (lhs: Field, rhs: Field) -> Bool {
        true
    }
}
