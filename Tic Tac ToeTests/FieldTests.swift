import Testing
@testable import Tic_Tac_Toe

/*
1. RULES:
 
- The game ends when:
  - A full column is taken by a single player.
  - A full row is taken by a single player.
  - A full diagonal is taken by a single player.
  - All fields are taken.

- Players:
  - A player can only mark an unclaimed field.
  - There are two players: X and O.
  - Take turns marking fields until the game ends.


2. STEPS:

- A field represents a single cell on the board.
  - Creating a field should be an explicit action.
  - A field can hold a value (X, O, or empty).
    - Value should eventually be a concrete type. ~> not implemented
        - Update: Value was implemented as a concrete type representing the `Player`.
  - A player can assign a value to a field.
    - Define a `Player` type.
    - Define a method to assign a value to a field.
    - Consider whether `Field` should be a value type or a reference type.
        - Update: We decided to make the `Field` a class as the state of it is going to be modified during its existence. A `struct` would make the interaction with `Field` way harder. Eg: we would need to use `&inout` parameter whenever passing the field around in order for it to be mutable.
  - A field tracks which player sets it.
    - Identifying and comparing players is not required at this stage.
      - Update: We implemented comparison between players by making it conform to `Equatable`.
    - A field (or the board) should be able to check if the game is over.
      - Update: Implemented the check to verify game is over when the player property is set.
  - Win condition:
    - A player takes a field.
  - Decide the winner of the game. At this stage it would represent the only player.
  - Introduce a column as a container for holding 2 fields.
  - Being able to assign a player to a field in a column
 
  - Is ended condition fully implement for column.
  - Is won condition implement for column:
    - when default
    - when one player takes both fields
 
 Next step:
  - Column.isWon:
   - when some fields taken but not all
   - when fields are taken by different players.
  - winner
  - subscript for field
*/


class Field {
    var player: Player? = nil
    
    var isEnded: Bool {
        player != nil
    }
    
    var isWon: Bool {
        isEnded
    }
    
    var winner: Player? {
        player
    }
}

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
}

struct Player: Equatable {
    let id: String
    
    init(_ id: String = "X") {
        self.id = id
    }
    
    func set(field: Field) {
        field.player = self
    }
}

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

struct Column {
    var field1 = Field()
    
    var field2 = Field()
    
    var isEnded: Bool {
        return field1.isEnded && field2.isEnded
    }
    
    var isWon: Bool {
        guard field1.player != nil else { return false }
        return field1.player == field2.player
    }
}

// Is win property for the Column (isWon, winner)
@Suite
struct ColumnTests {
    @Test
    func onInit_whenDefault_field1IsNotTakenByAnyPlayer() {
        let sut = Column()
        
        let player = sut.field1.player
        
        #expect(player == nil)
    }	
    
    @Test
    func onInit_whenDefault_field2IsNotTakenByAnyPlayer() {
        let sut = Column()
        
        let player = sut.field2.player
        
        #expect(player == nil)
    }
    
    @Test
    func onPlayerSet_whenPlayer_field1IsTakenByPlayer() {
        let sut = Column()
        let player = Player()
        
        sut.field1.player = player
        
        #expect(sut.field1.player == player)
    }
    
    @Test
    func onPlayerSet_whenPlayer_field2IsTakenByPlayer() {
        let sut = Column()
        let player = Player()
        
        sut.field2.player = player
        
        #expect(sut.field2.player == player)
    }
    
    @Test
    func isEnded_whenDefault_returnsFalse() {
        let sut = Column()
        
        #expect(!sut.isEnded)
    }
    
    @Test
    func isEnded_whenBothFieldsAreTaken_returnsTrue() {
        let sut = Column()
        let player = Player()
        
        sut.field1.player = player
        sut.field2.player = player
        
        #expect(sut.isEnded)
    }
    
    @Test
    func isEnded_whenField1IsTaken_returnsFalse() {
        let sut = Column()
        let player = Player()
        
        sut.field1.player = player
        
        #expect(!sut.isEnded)
    }
    
    @Test
    func isEnded_whenField2IsTaken_returnsFalse() {
        let sut = Column()
        let player = Player()
        
        sut.field2.player = player
        
        #expect(!sut.isEnded)
    }
    
    @Test
    func isWon_whenDefault_returnsFalse() {
        let sut = Column()
        
        #expect(!sut.isWon)
    }
    
    @Test
    func isWon_whenAPlayerTakesBothFields_returnsTrue() {
        let sut = Column()
        let player = Player()
        
        sut.field1.player = player
        sut.field2.player = player
        
        #expect(sut.isWon)
    }
    
//    - when some fields taken but not all
//    - when fields are taken by different players.
    @Test
    func isWon_whenOnlyFirstFieldIsTaken_returnsFalse() {
        let sut = Column()
        let player = Player()
        
        sut.field1.player = player
        
        #expect(!sut.isWon)
    }
    
    @Test
    func isWon_whenOnlySecondFieldIsTaken_returnsFalse() {
        let sut = Column()
        let player = Player()
        
        sut.field2.player = player
        
        #expect(!sut.isWon)
    }
}
