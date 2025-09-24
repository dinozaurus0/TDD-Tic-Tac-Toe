struct Column {
    var field1 = Field()
    
    var field2 = Field()
    
    var isEnded: Bool {
        return field1.isEnded && field2.isEnded
    }
    
    var isWon: Bool {
        guard field1.player != nil else { return false }
        return field1.player == field2.player
    }
    
    var winner: Player? {
        guard isWon else { return nil }
        return field1.player
    }
    
    subscript(position: Int) -> Field {
        guard position == 0 else { return field2 }
        return field1
    }
}
