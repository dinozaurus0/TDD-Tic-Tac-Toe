import Testing
@testable import Tic_Tac_Toe	

@Suite
struct ColumnTests {
    @Test
    func onInit_whenDefault_field1IsNotTakenByAnyPlayer() {
        let sut = Column()
        
        let player = sut[0].player
        
        #expect(player == nil)
    }
    
    @Test
    func onInit_whenDefault_field2IsNotTakenByAnyPlayer() {
        let sut = Column()
        
        let player = sut[1].player
        
        #expect(player == nil)
    }
    
    @Test
    func onPlayerSet_whenPlayer_field1IsTakenByPlayer() {
        let sut = Column()
        let player = Player()
        
        sut[0].player = player
        
        #expect(sut[0].player == player)
    }
    
    @Test
    func onPlayerSet_whenPlayer_field2IsTakenByPlayer() {
        let sut = Column()
        let player = Player()
        
        sut[1].player = player
        
        #expect(sut[1].player == player)
    }
    
    @Test
    func isEnded_whenDefault_returnsFalse() {
        let sut = Column()
        
        #expect(!sut.isEnded)
    }
    
    @Test
    func isEnded_whenAllFieldsAreTakenByTheSamePlayer_returnsTrue() {
        let sut = Column()
        let player = Player()
        
        sut.forEach { field in
            field.player = player
        }
        
        #expect(sut.isEnded)
    }
    
    @Test
    func isEnded_whenFirstFieldIsTaken_returnsFalse() {
        let sut = Column()
        let player = Player()
        
        sut[0].player = player
        
        #expect(!sut.isEnded)
    }
    
    @Test
    func isEnded_whenSecondFieldIsTaken_returnsFalse() {
        let sut = Column()
        let player = Player()
        
        sut[1].player = player
        
        #expect(!sut.isEnded)
    }
    
    @Test
    func isWon_whenDefault_returnsFalse() {
        let sut = Column()
        
        #expect(!sut.isWon)
    }
    
    @Test
    func isWon_whenAPlayerTakesAllFields_returnsTrue() {
        let sut = Column()
        let player = Player()
        
        sut.forEach { field in
            field.player = player
        }
        
        #expect(sut.isWon)
    }
    
    @Test
    func isWon_whenOnlyFirstFieldIsTaken_returnsFalse() {
        let sut = Column()
        let player = Player()
        
        sut[0].player = player
        
        #expect(!sut.isWon)
    }
    
    @Test
    func isWon_whenOnlySecondFieldIsTaken_returnsFalse() {
        let sut = Column()
        let player = Player()
        
        sut[1].player = player
        
        #expect(!sut.isWon)
    }
    
    @Test
    func isWon_whenAllFieldsAreTakenByMultiplePlayers_returnsFalse() {
        let sut = Column()
        
        sut.forEach { field in
            field.player = Player("X")
        }
        sut[0].player = Player("Y")
        
        #expect(!sut.isWon)
    }
    
    @Test
    func winner_givenDefault_returnsNil() {
        let sut = Column()
        
        #expect(sut.winner == nil)
    }
    
    @Test
    func winner_givenOnlyFirstFieldPlayerHasBeenSet_returnsNil() {
        let sut = Column()
        sut[0].player = Player("X")
        
        #expect(sut.winner == nil)
    }
    
    @Test
    func winner_givenOnlySecondFieldPlayerHasBeenSet_returnsNil() {
        let sut = Column()
        sut[1].player = Player("X")
        
        #expect(sut.winner == nil)
    }
    
    @Test
    func winner_givenAllFieldsHaveAPlayerWithMultiplePlayers_returnsNil() {
        let sut = Column()
        
        sut.forEach { field in
            field.player = Player("X")
        }
        sut[0].player = Player("Y")
        
        #expect(sut.winner == nil)
    }
    
    @Test
    func winner_givenAllFieldsHaveSamePlayerAssigned_returnsPlayer() {
        let sut = Column()
        let player = Player("X")
        
        sut.forEach { field in
            field.player = player
        }
        
        #expect(sut.winner == player)
    }
}
