import Testing
@testable import Tic_Tac_Toe

struct BoardTests {
    @Test
    func isEnded_whenDefault_returnsFalse() {
        let sut = Board()
        
        #expect(!sut.isEnded)
    }
    
    @Test
    func player_givenDefault_when0x0_returnsNil() {
        let sut = Board()
        
        let player = sut.player(row: 0, column: 0)
        
        #expect(player == nil)
    }
    
    @Test
    func scaffold_player_givenDefault_when0x1_returnsDefaultPlayer() {
        let sut = Board()
        
        let player = sut.player(row: 0, column: 1)
        
        #expect(player == Player())
    }
    
    @Test
    func scaffold_take_givenDefault_when0x1AndDefaultPlayer_0x1IsDefaultPlayer() {
        let sut = Board()
        let player = Player()
        
        sut.take(row: 0, column: 1, player: player)
        
        let takenPlayer = sut.player(row: 0, column: 1)
        #expect(takenPlayer == player)
    }
}
