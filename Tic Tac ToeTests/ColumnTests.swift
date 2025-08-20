import Testing
@testable import Tic_Tac_Toe	

@Suite
struct ColumnTests {
    @Test
    func onInit_whenDefault_field1IsNotTakenByAnyPlayer() {
        let sut = Column()
        
        let player = sut.field1.player
        
        #expect(player == nil)
    }
    
    @Test
    func onInit_whenDefault_field2IsNotTakenByAnyPlayer() {
        let sut = Column()
        
        let player = sut.field2.player
        
        #expect(player == nil)
    }
    
    @Test
    func onPlayerSet_whenPlayer_field1IsTakenByPlayer() {
        let sut = Column()
        let player = Player()
        
        sut.field1.player = player
        
        #expect(sut.field1.player == player)
    }
    
    @Test
    func onPlayerSet_whenPlayer_field2IsTakenByPlayer() {
        let sut = Column()
        let player = Player()
        
        sut.field2.player = player
        
        #expect(sut.field2.player == player)
    }
    
    @Test
    func isEnded_whenDefault_returnsFalse() {
        let sut = Column()
        
        #expect(!sut.isEnded)
    }
    
    @Test
    func isEnded_whenBothFieldsAreTaken_returnsTrue() {
        let sut = Column()
        let player = Player()
        
        sut.field1.player = player
        sut.field2.player = player
        
        #expect(sut.isEnded)
    }
    
    @Test
    func isEnded_whenField1IsTaken_returnsFalse() {
        let sut = Column()
        let player = Player()
        
        sut.field1.player = player
        
        #expect(!sut.isEnded)
    }
    
    @Test
    func isEnded_whenField2IsTaken_returnsFalse() {
        let sut = Column()
        let player = Player()
        
        sut.field2.player = player
        
        #expect(!sut.isEnded)
    }
    
    @Test
    func isWon_whenDefault_returnsFalse() {
        let sut = Column()
        
        #expect(!sut.isWon)
    }
    
    @Test
    func isWon_whenAPlayerTakesBothFields_returnsTrue() {
        let sut = Column()
        let player = Player()
        
        sut.field1.player = player
        sut.field2.player = player
        
        #expect(sut.isWon)
    }
    
    @Test
    func isWon_whenOnlyFirstFieldIsTaken_returnsFalse() {
        let sut = Column()
        let player = Player()
        
        sut.field1.player = player
        
        #expect(!sut.isWon)
    }
    
    @Test
    func isWon_whenOnlySecondFieldIsTaken_returnsFalse() {
        let sut = Column()
        let player = Player()
        
        sut.field2.player = player
        
        #expect(!sut.isWon)
    }
    
    @Test
    func isWon_whenBothFieldsAreTakenByDifferentPlayers_returnsFalse() {
        let sut = Column()
        let player = Player("X")
        let otherPlayer = Player("Y")
        
        sut.field1.player = player
        sut.field2.player = otherPlayer
        
        #expect(!sut.isWon)
    }
    
    @Test
    func winner_givenDefault_returnsNil() {
        let sut = Column()
        
        #expect(sut.winner == nil)
    }
    
    @Test
    func winner_givenOnlyField1PlayerHasBeenSet_returnsNil() {
        let sut = Column()
        sut.field1.player = Player("X")
        
        #expect(sut.winner == nil)
    }
    
    @Test
    func winner_givenOnlyField2PlayerHasBeenSet_returnsNil() {
        let sut = Column()
        sut.field2.player = Player("X")
        
        #expect(sut.winner == nil)
    }
    
    @Test
    func winner_givenBothFieldsPlayerHasBeenSetWithDifferentPlayers_returnsNil() {
        let sut = Column()
        sut.field1.player = Player("X")
        sut.field2.player = Player("Y")
        
        #expect(sut.winner == nil)
    }
    
    @Test
    func winner_givenBothFieldsPlayerHasBeenSetWithSamePlayer_returnsPlayer() {
        let sut = Column()
        let player = Player("X")
        sut.field1.player = player
        sut.field2.player = player
        
        #expect(sut.winner == player)
    }
}

