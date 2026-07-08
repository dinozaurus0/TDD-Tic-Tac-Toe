import Foundation

class Board {
    typealias Offset = Int
    
    private var player: Player?
    private var column: Offset?
    
    let isEnded = false
    
    func player(row: Offset, column: Offset) -> Player? {
        if column == self.column {
            return player
        }
        return nil
    }
    
    func take(row: Offset, column: Offset, player: Player) {
        self.player = player
        self.column = column
    }
}
