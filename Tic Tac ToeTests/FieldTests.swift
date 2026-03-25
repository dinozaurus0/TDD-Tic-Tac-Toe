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
    func onInit_whenDefault_isTakenIsFalse() {
        let sut = Field()
        
        let isTaken = sut.isTaken
        
        #expect(!isTaken)
    }
    
    @Test
    func isTaken_whenPlayerIsSet_isTakenIsTrue() {
        let sut = Field()
        sut.player = Player()
        
        let isTaken = sut.isTaken
        
        #expect(isTaken)
    }
    
    @Test
    func taker_whenDefault_isNil() {
        let sut = Field()
        
        let taker = sut.taker
        
        #expect(taker == nil)
    }
    
    @Test
    func taker_whenPlayerIsSet_isNotNill() {
        let sut = Field()
        sut.player = Player()
        
        let taker = sut.taker
        
        #expect(taker != nil)
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
    
    @Test
    func equatable_givenHasPlayer_whenDefault_areNotEqual() {
        let sut = Field()
        sut.player = Player()
        let other = Field()
        
        #expect(sut != other)
    }
    
    @Test
    func equatable_givenHasPlayer_whenHasDifferentPlayer_areNotEqual() {
        let sut = Field()
        sut.player = Player("O")
        let other = Field()
        other.player = Player("X")
        
        #expect(sut != other)
    }
    
    @Test
    func equatable_givenHasPlayerX_whenSamePlayer_areEqual() {
        let player = Player()
        let sut = Field()
        sut.player = player
        let other = Field()
        other.player = player
        
        #expect(sut == other)
    }
    
    @Test
    func equatable_givenHasPlayerO_whenSamePlayer_areEqual() {
        let player = Player("O")
        let sut = Field()
        sut.player = player
        let other = Field()
        other.player = player
        
        #expect(sut == other)
    }
}
