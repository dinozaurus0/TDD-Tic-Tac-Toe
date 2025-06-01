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
 - Need a way to identify which player is which. (Not needed at this stage)
    - How to determine that 2 players are equal?
 Ask a field if the game is over.
 
 
 1.4. Decide when the user wins a round ~> for this particular case would be only that he introduces a valid value.
 */


// Red - Green - Refactor ^_^

// Least amount of the step!

// action that triggers -- when it gets trigger -- what the result of this is

// TCR

class Field {
    var player: Player? = nil
    
    var isEnded: Bool {
        player != nil
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

struct Board {
  private var fields: [Field]
  var fieldCount: Int {
    fields.count
  }

  init(fields: [Field]) {
    self.fields = fields
  }

  init(fieldCount: Int) {
    self.fields = Array(repeating: Field(), count: fieldCount)
  }

  init(height: Int, width: Int) {
    self.fields = Array(repeating: Field(), count: height * width)
  }
}

@Suite
struct BoardTests {
  @Test
  func structure_onInstantiate_hasArrayofFields() {
    let sut = Board(fields: [])
    let mirror = Mirror(reflecting: sut)
    let property = mirror.children.first { $0.label == "fields" }

    #expect(property != nil) // There should be a property named "fields"
    #expect(property?.value is [Field]) // fields property should be an array of Field objects
  }

  @Test
  func onInit_withSomeNumberOfFieldCount_shouldHaveFieldCount() {
    let number = Int.random(in: 1...10)
    let sut = Board(fieldCount: number)

    #expect(sut.fieldCount == number)
  }

  @Test
  func onInit_withSomeHeightAndWidth_shouldHaveFieldCout() {
    let height = Int.random(in: 1...10)
    let width = Int.random(in: 1...10)

    let sut = Board(height: height, width: width)

    #expect(sut.fieldCount == width * height) // Assuming Board has a way to calculate fieldCount based on width and height
  }
}
