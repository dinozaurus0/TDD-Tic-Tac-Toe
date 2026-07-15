import Testing
@testable import Tic_Tac_Toe

struct BoardTests {
    @Test
    func isEnded_whenDefault_returnsFalse() throws {
        let sut = Board()
        
        #expect(!sut.isEnded)
    }
    
    @Test
    func player_givenDefault_when0x0_returnsNil() throws {
        let sut = Board()
        
        let player = sut.player(row: 0, column: 0)
        
        #expect(player == nil)
    }
    
    // Minimal test of take().
    @Test
    func take_givenDefault_when0x1AndDefaultPlayer_0x1IsDefaultPlayer() throws {
        let sut = Board()
        let player = Player()
        
        sut.take(row: 0, column: 1, player: player)
        
        let takenPlayer = sut.player(row: 0, column: 1)
        #expect(takenPlayer == player)
    }
    
    // take() works for different players.
    @Test
    func take_givenDefault_when0x1AndPlayerO_0x1IsPlayerO() throws {
        let sut = Board()
        let player = Player("O")
        
        sut.take(row: 0, column: 1, player: player)
        
        let takenPlayer = sut.player(row: 0, column: 1)
        #expect(takenPlayer == player)
    }
    
    // take() works for column other than 1.
    @Test
    func take_givenDefault_when0x2AndPlayerO_0x2IsPlayerO() throws {
        let sut = Board()
        let player = Player("O")
        
        sut.take(row: 0, column: 2, player: player)
        
        let takenPlayer = sut.player(row: 0, column: 2)
        #expect(takenPlayer == player)
    }
    
    // The column used by take() matters for player().
    @Test
    func player_given0x1IsPlayerO_when0x2_returnsNil() throws {
        let sut = Board()
        let player = Player("O")
        sut.take(row: 0, column: 1, player: player)
        
        let takenPlayer = sut.player(row: 0, column: 2)
        
        #expect(takenPlayer == nil)
    }
    
    // The row used by take() matters for player().
    @Test
    func player_given0x1IsPlayerO_when2x1_returnsNil() throws {
        let sut = Board()
        let player = Player("O")
        sut.take(row: 0, column: 1, player: player)
        
        let takenPlayer = sut.player(row: 2, column: 1)
        
        #expect(takenPlayer == nil)
    }
}
