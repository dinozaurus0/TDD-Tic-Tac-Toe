# Task List For Dojo Coding - Tic Tac Toe

## RULES:
 
- The game ends when:
  - A full column is taken by a single player.
  - A full row is taken by a single player.
  - A full diagonal is taken by a single player.
  - All fields are taken.

- Players:
  - A player can only mark an unclaimed field.
  - There are two players: X and O.
  - Take turns marking fields until the game ends.


## STEPS:

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
    - when some fields taken but not all
    - when fields are taken by different players.
  - winner:
    - none:
       - none of the fields are taken
       - less than all fields are taken
       - not all fields taken by the same player
    - fields are taken by the same player
  - extract structs & tests into their own files
  
  - before we can make `Column` conform to `Collection` we need to be able to compare 2 fields. 
    - in order to achieve that we need to implement the equality operator on `Field`.
    - having the equality operator enables `Field` to conform to the `Equatable` protocol. 
    
  - make column conform to `Collection`:
    - subscript
    - startIndex
    - endIndex
    - index(after:)
    - typealias Element, typealias Index
    - add `Collection` protocol conformance
    
  - `Column` isWon should be refactor to check only the fields equality
  
  - Refactor functions & computed properties to be dependent on fields array  
  
  - Refactor column tests to make it easier to change fields. 
  - Change the initialisation of the fields property to have 3 fields instead of 2.
 
### Next step:
  - ⬇️ 
   - Column repeating init 
   - Add Test: isEnded is taken by different players
  
### Future steps:
  - have a column with more than 2 fields
  - have a container of multiple columns
  - ways to check rows and diagonals for win state
  
  Future sessions(2-3 months or more ^^):
  - manual mutation testing
  - setup automated mutation tool (like Muter) 

OBS screen recording 
