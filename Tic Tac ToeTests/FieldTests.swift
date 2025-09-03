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
    
    // MARK: - Equatable
    
    @Test
    func equatable_givenDefault_whenDefault_isTrue() {
        let sut = Field()
        let other = Field()
        
        #expect(sut == other)
    }
    
    @Test
    func equatable_givenDefault_whenHasPlayer_areNotEqual() {
        let sut = Field()
        let other = Field()
        other.player = Player()
        
        #expect(sut != other)
    }
}
