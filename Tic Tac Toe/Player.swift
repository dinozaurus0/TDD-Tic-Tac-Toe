struct Player: Equatable {
    let id: String
    
    init(_ id: String = "X") {
        self.id = id
    }
    
    func set(field: Field) {
        field.player = self
    }
}
