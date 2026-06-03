import Foundation

class Board {
    typealias Offset = Int
    
    private var player: Player?
    
    let isEnded = false
    
    func player(row: Offset, column: Offset) -> Player? {
        if column == 1 {
            return player
        } else {
            return nil
        }
    }
    
    func take(row: Offset, column: Offset, player: Player) {
        self.player = player
    }
}
