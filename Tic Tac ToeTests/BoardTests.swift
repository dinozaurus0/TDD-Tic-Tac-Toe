import Testing
@testable import Tic_Tac_Toe

struct BoardTests {
    @Test
    func isEnded_whenDefault_returnsFalse() {
        let sut = Board()
        
        #expect(!sut.isEnded)
    }

}
