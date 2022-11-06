import Foundation

class Motorcycle : Vehicle {

    private let sidecar: Bool

    init(make: String, plate: String, color: String, category: String, sidecar: Bool, colour: Any) {
        self.sidecar = sidecar
        super.init(make: make, plate: plate, color: color, category: category, colour: colour)
    }
    
    func getSidecar() -> Bool {
        return self.sidecar
    }
}
