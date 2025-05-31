import Testing
@testable import Tic_Tac_Toe

/*
 The rules of the tic tac toe game are the following:

 a game is over when all fields are taken
 a game is over when all fields in a column are taken by a player
 a game is over when all fields in a row are taken by a player
 a game is over when all fields in a diagonal are taken by a player
 a player can take a field if not already taken
 players take turns taking fields until the game is over
 there are two player in the game (X and O)
 */

/*
 1. One field where user can introduce either X or O
 1.1. Creating a field should be an action on its own.
 1.2. A field can have a value/contain a value.
 1.2.1. Make value a concrete type. ~> not implemented
 1.3. One player can introduce a value. At this stage consider only one.
 1.3.1. Define a player
 1.3.2. Define the value ~> Not needed at this stage
 1.3.3. Player can set a value
 1.3.4. Should Field be a value or reference type?
 A field has been set by a given player?
 - Need a way to identify which player is which
    - How to determine that 2 players are equal?
 
 
 1.4. Decide when the user wins a round ~> for this particular case would be only that he introduces a valid value.
 */


// Red - Green - Refactor ^_^

// Least amount of the step!

// action that triggers -- when it gets trigger -- what the result of this is

// TCR

class Field {
    var player: Any? = nil
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
    func onAssign_whenX_assignedValueIsNotNil() {
        let sut = Field()
        sut.player = "X"
        
        let value = sut.player
        
        #expect(value != nil)
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
        
        #expect(field.player as? Player == sut)
    }
    
    @Test
    func equatable_whenSamePlayer_returnsTrue() {
        let sut = Player()
        #expect(sut == sut)
    }
}
