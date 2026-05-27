import Foundation

struct Board {
    typealias Offset = Int
    
    let isEnded = false
    
    func player(row: Offset, column: Offset) -> Player? {
        if column == 1 {
            return Player()
        } else {
            return nil
        }
    }
    
    func take(row: Offset, column: Offset, player: Player) {
        
    }
}
