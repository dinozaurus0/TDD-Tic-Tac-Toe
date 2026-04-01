class Field: Equatable {
    var player: Player? = nil
    
    var isTaken: Bool {
        player != nil
    }
    
    var taker: Player? {
        player
    }
    
    func take(_ player: Player) throws {
        guard !isTaken else { return }
        self.player = player
    }
    
    static func == (lhs: Field, rhs: Field) -> Bool {
        lhs.player == rhs.player
    }
}
