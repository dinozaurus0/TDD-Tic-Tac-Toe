import Testing

@Suite
struct PlayerTests {
    @Test
    func onSet_whenField_fieldValueIsNotNil() {
        let sut = Player()
        let field = Field()
        
        sut.set(field: field)
        
        #expect(field.player == sut)
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
