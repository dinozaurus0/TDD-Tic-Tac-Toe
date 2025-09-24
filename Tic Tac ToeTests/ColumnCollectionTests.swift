import Testing
@testable import Tic_Tac_Toe

@Suite
struct ColumnCollectionTests {
    @Test
    func subscript_givenDefault_whenIndex0_returnsDefaultField() {
        let sut = Column()
        
        let result = sut[0]
        
        #expect(result == Field())
    }
    
    @Test
    func subscript_givenField1HasAPlayer_whenIndex0_returnsField1() {
        let player = Player()
        let sut = Column()
        sut.field1.player = player
        
        let result = sut[0]
        
        #expect(result == sut.field1)
    }
}

/*
 2. Subscript is other than zero
 1. When the field is not the default one ~> Has a player set on it
 */
