import Foundation

extension Array {
    /// Initialise an array repeating a closure for each element.
    /// - Parameters:
    ///   - size: Number of elements to init.
    ///   - element: A closure that returns an element.
    init(size: Int, element: () -> Element) {
        self.init(
            (0..<size).map { _ in
                element()
            }
        )
    }
}
