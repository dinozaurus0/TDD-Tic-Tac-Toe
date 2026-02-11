import Testing
@testable import Tic_Tac_Toe

struct ArrayExtensionTests {
    
    @Test
    func init_whenSize2AndClosure_initialise2ElementsBasedOnClosure() {
        let sut = Array.init(size: 2, element: { 0 })
        
        #expect(sut == [0, 0])
    }

}
