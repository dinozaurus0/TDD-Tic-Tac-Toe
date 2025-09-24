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
}
