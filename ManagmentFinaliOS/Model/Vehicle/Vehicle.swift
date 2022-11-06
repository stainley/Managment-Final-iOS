import Foundation

class Vehicle {
    private let make: String
    private let plate: String
    private let color: String
    private let category: String
    private let colour: Any

    init(make: String, plate: String, color: String, category: String, colour: Any) {
        self.make = make
        self.plate = plate
        self.color = color
        self.category = category
        self.colour = colour
    }
    
    func getMake() -> String {
        return self.make
    }
    
    func getPlate() -> String {
        return self.plate
    }
    
    func getColor() -> String {
        return self.color
    }
    
    func getCategory() -> String {
        return self.category
    }
    
    func getColour() -> Any {
        return colour
    }
}
