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
    func equatable_whenSamePlayer_returnsTrue() {
        let sut = Player()
        #expect(sut == sut)
    }
}
