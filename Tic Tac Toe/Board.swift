import Foundation

class Board {
    typealias Offset = Int
    
    private var player: Player?
    
    let isEnded = false
    
    func player(row: Offset, column: Offset) -> Player? {
       player
    }
    
    func take(row: Offset, column: Offset, player: Player) {
        self.player = player
    }
}
