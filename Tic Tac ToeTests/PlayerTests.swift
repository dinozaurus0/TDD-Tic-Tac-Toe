import Testing
@testable import Tic_Tac_Toe

@Suite
struct PlayerTests {
    @Test
    func onSet_whenField_fieldValueIsNotNil() throws {
        let sut = Player()
        let field = Field()
        
        try sut.set(field: field)
        
        #expect(field.player == sut)
    }
    
    @Test
    func onSet_whenFieldIsTaken_throwsError() throws {
        let field = Field()
        try field.take(Player("O"))
        let sut = Player()
        
        #expect(throws: TicTacToeError.fieldIsTaken) {
            try sut.set(field: field)
        }
    }
    
    @Test
    func onInit_idDefaultsToX() {
        let sut = Player()
        #expect(sut.id == "X")
    }
    
    @Test
    func onInit_whenPlayerIdIsX_playerIdIsX() {
        let playerId = "X"
        let sut = Player(playerId)
        #expect(sut.id == playerId)
    }
    
    @Test(arguments: ["U", "V", "W", "Y", "Z"])
    func onInit_whenPlayerIdIsVariableValue_playerIdIsTheGivenValue(_ playerId: String) {
        let sut = Player(playerId)
        #expect(sut.id == playerId)
    }
    
    @Test
    func equatable_whenDifferentPlayersWithSameId_returnsTrue() {
        let playerId = "X"
        let sut = Player(playerId)
        let other = Player(playerId)
        #expect(sut == other)
    }
    
    @Test
    func equatable_whenDifferentPlayersWithDifferentId_returnsFalse() {
        let sut = Player("X")
        let other = Player("Z")
        #expect(sut != other)
    }
}
