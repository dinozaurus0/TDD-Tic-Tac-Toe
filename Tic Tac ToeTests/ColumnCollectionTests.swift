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
    func subscript_givenFirstFieldHasAPlayer_whenIndex0_returnsFirstField() {
        let player = Player()
        let sut = Column()
        sut[0].player = player
        
        let result = sut[0]
        
        #expect(result == sut[0])
    }
    
    @Test
    func subscript_givenFirstFieldHasAPlayer_whenIndex1_returnsDefaultField() {
        let sut = Column()
        sut[0].player = Player()
        
        let result = sut[1]
        
        #expect(result == Field())
    }
    
    @Test
    func subscript_givenSecondFieldHasAPlayer_whenIndex1_returnsSecondField() {
        let player = Player()
        let sut = Column()
        sut[1].player = player
        
        let result = sut[1]
        
        #expect(result == sut[1])
    }
    
    @Test
    func startIndex_returns0() {
        let sut = Column()
        
        #expect(sut.startIndex == 0)
    }
    
    @Test
    func endIndex_returnsPositionAfterTheLastElement() {
        let sut = Column()
        
        #expect(sut.endIndex == sut.count)
    }
    
    @Test
    func indexAfter_when0_returns1() {
        let sut = Column()
        
        let result = sut.index(after: 0)
        
        #expect(result == 1)
    }
    
    @Test
    func indexAfter_when1_returns2() {
        let sut = Column()
        
        let result = sut.index(after: 1)
        
        #expect(result == 2)
    }
    
    @Test
    func indexAfter_when100_returns101() {
        let sut = Column()
        
        let result = sut.index(after: 100)
        
        #expect(result == 101)
    }
    
    @Test
    func column_conformsToCollectionProtocol() {
        let result: (any Collection.Type)? = Column.self
        
        #expect(result != nil)
    }
}
