import Testing
@testable import Tic_Tac_Toe

class Field {
    var player: Player? = nil
    
    var isEnded: Bool {
        player != nil
    }
    
    var isWon: Bool {
        isEnded
    }
    
    var winner: Player? {
        player
    }
}

@Suite
struct FieldTests {
    @Test
    func onInit_whenDefault_assignsValueAsNil() {
        let sut = Field()
        
        let value = sut.player
        
        #expect(value == nil)
    }
    
    @Test
    func onInit_whenDefault_isEndedIsFalse() {
        let sut = Field()
        
        let isEnded = sut.isEnded
        
        #expect(!isEnded)
    }
    
    @Test
    func isEnded_whenPlayerIsSet_isEndedIsTrue() {
        let sut = Field()
        sut.player = Player()
        
        let isEnded = sut.isEnded
        
        #expect(isEnded)
    }
    
    @Test
    func isWon_whenDefault_IsFalse() {
        let sut = Field()
        
        let isWon = sut.isWon
        
        #expect(!isWon)
    }
    
    @Test
    func isWon_whenPlayerIsSet_isTrue() {
        let sut = Field()
        sut.player = Player()
        
        let isWon = sut.isWon
        
        #expect(isWon)
    }
    
    @Test
    func winner_whenDefault_isNil() {
        let sut = Field()
        
        let winner = sut.winner
        
        #expect(winner == nil)
    }
    
    @Test
    func winner_whenPlayerIsSet_isNotNill() {
        let sut = Field()
        sut.player = Player()
        
        let winner = sut.winner
        
        #expect(winner != nil)
    }
}

struct Player: Equatable {
    let id: String
    
    init(_ id: String = "X") {
        self.id = id
    }
    
    func set(field: Field) {
        field.player = self
    }
}

struct Column {
    var field1 = Field()
    
    var field2 = Field()
    
    var isEnded: Bool {
        return field1.isEnded && field2.isEnded
    }
    
    var isWon: Bool {
        guard field1.player != nil else { return false }
        return field1.player == field2.player
    }
    
    var winner: Player? {
        guard isWon else { return nil }
        return field1.player
    }
}

// Is win property for the Column (isWon, winner)
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
