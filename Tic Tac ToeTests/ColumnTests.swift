import Testing
@testable import Tic_Tac_Toe	

@Suite
struct ColumnTests {
    @Test
    func onInit_columnMustHaveAtLeast2Fields() {
        let sut = Column()
        
        #expect(sut.count > 1)
    }
    
    @Test
    func onInit_shouldHave3Fields() {
        let sut = Column()
        
        #expect(sut.count == 3)
    }
    
    @Test
    func onInit_whenDefault_field1IsNotTakenByAnyPlayer() {
        let sut = Column()
        
        let player = sut[0].taker
        
        #expect(player == nil)
    }
    
    @Test
    func onInit_whenDefault_field2IsNotTakenByAnyPlayer() {
        let sut = Column()
        
        let player = sut[1].taker
        
        #expect(player == nil)
    }
    
    @Test
    func onPlayerSet_whenPlayer_field1IsTakenByPlayer() throws {
        let sut = Column()
        let player = Player()
        
        try sut[0].take(player)
        
        #expect(sut[0].taker == player)
    }
    
    @Test
    func onPlayerSet_whenPlayer_field2IsTakenByPlayer() throws {
        let sut = Column()
        let player = Player()
        
        try sut[1].take(player)
        
        #expect(sut[1].taker == player)
    }
    
    @Test
    func isEnded_whenDefault_returnsFalse() {
        let sut = Column()
        
        #expect(!sut.isEnded)
    }
    
    @Test
    func isEnded_whenAllFieldsAreTakenByTheSamePlayer_returnsTrue() throws {
        let sut = Column()
        let player = Player()
        
        try sut.forEach { field in
            try field.take(player)
        }
        
        #expect(sut.isEnded)
    }
    
    @Test
    func isEnded_whenFirstFieldIsTaken_returnsFalse() throws {
        let sut = Column()
        let player = Player()
        
        try sut[0].take(player)
        
        #expect(!sut.isEnded)
    }
    
    @Test
    func isEnded_whenSecondFieldIsTaken_returnsFalse() throws {
        let sut = Column()
        let player = Player()
        
        try sut[1].take(player)
        
        #expect(!sut.isEnded)
    }
    
    @Test
    func isEnded_whenAllFieldsAreTakenByDifferentPlayers_returnsTrue() throws {
        let sut = Column()
        let player1 = Player("X")
        let player2 = Player("O")
        
        try sut.forEach { field in
            try field.take(player1)
        }
        try sut.first?.take(player2)
        
        #expect(sut.isEnded)
    }
    
    @Test
    func isWon_whenDefault_returnsFalse() {
        let sut = Column()
        
        #expect(!sut.isWon)
    }
    
    @Test
    func isWon_whenAPlayerTakesAllFields_returnsTrue() throws {
        let sut = Column()
        let player = Player()
        
        try sut.forEach { field in
            try field.take(player)
        }
        
        #expect(sut.isWon)
    }
    
    @Test
    func isWon_whenOnlyFirstFieldIsTaken_returnsFalse() throws {
        let sut = Column()
        let player = Player()
        
        try sut[0].take(player)
        
        #expect(!sut.isWon)
    }
    
    @Test
    func isWon_whenOnlySecondFieldIsTaken_returnsFalse() throws {
        let sut = Column()
        let player = Player()
        
        try sut[1].take(player)
        
        #expect(!sut.isWon)
    }
    
    @Test
    func isWon_whenAllFieldsAreTakenByMultiplePlayers_returnsFalse() throws {
        let sut = Column()
        
        try sut.forEach { field in
            try field.take(Player("X"))
        }
        try sut[0].take(Player("Y"))
        
        #expect(!sut.isWon)
    }
    
    @Test
    func winner_givenDefault_returnsNil() {
        let sut = Column()
        
        #expect(sut.winner == nil)
    }
    
    @Test
    func winner_givenOnlyFirstFieldPlayerHasBeenSet_returnsNil() throws {
        let sut = Column()
        try sut[0].take(Player("X"))
        
        #expect(sut.winner == nil)
    }
    
    @Test
    func winner_givenOnlySecondFieldPlayerHasBeenSet_returnsNil() throws {
        let sut = Column()
        try sut[1].take(Player("X"))
        
        #expect(sut.winner == nil)
    }
    
    @Test
    func winner_givenAllFieldsHaveAPlayerWithMultiplePlayers_returnsNil() throws {
        let sut = Column()
        
        try sut.forEach { field in
            try field.take(Player("X"))
        }
        try sut[0].take(Player("Y"))
        
        #expect(sut.winner == nil)
    }
    
    @Test
    func winner_givenAllFieldsHaveSamePlayerAssigned_returnsPlayer() throws {
        let sut = Column()
        let player = Player("X")
        
        try sut.forEach { field in
            try field.take(player)
        }
        
        #expect(sut.winner == player)
    }
}
