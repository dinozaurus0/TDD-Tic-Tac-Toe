import Testing
@testable import Tic_Tac_Toe

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

