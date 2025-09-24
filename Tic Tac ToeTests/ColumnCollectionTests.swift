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
    
    @Test
    func subscript_givenField1HasAPlayer_whenIndex1_returnsDefaultField() {
        let sut = Column()
        sut.field1.player = Player()
        
        let result = sut[1]
        
        #expect(result == Field())
    }
    
    @Test
    func subscript_givenField2HasAPlayer_whenIndex1_returnsField2() {
        let player = Player()
        let sut = Column()
        sut.field2.player = player
        
        let result = sut[1]
        
        #expect(result == sut.field2)
    }
    
    @Test
    func startIndex_returns0() {
        let sut = Column()
        
        #expect(sut.startIndex == 0)
    }
    
    @Test
    func endIndex_returns2() {
        let sut = Column()
        
        #expect(sut.endIndex == 2)
    }
}
