import Foundation

class Board {
    typealias Offset = Int
    
    private var row: Offset?
    private var column: Offset?
    private var player: Player?
    
    let isEnded = false
    
    func player(row: Offset, column: Offset) -> Player? {
        if row == self.row, column == self.column {
            return player
        }
        return nil
    }
    
    func take(row: Offset, column: Offset, player: Player) throws {
        self.row = row
        self.column = column
        self.player = player
    }
}
