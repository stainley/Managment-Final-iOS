
import Foundation

enum TypeEmployee: String {
    case MANAGER = "manager"
    case TESTER = "tester"
    case PROGRAMMER = "programmer"
}

enum TypeContract: String {
    case PERMANENT = "permanent"
    case TEMPORARY = "temporary"
}

enum TypeVehicle: String {
    case CAR = "Car"
    case MOTORCYCLE = "Motorcycle"
}

extension Employee {
    
    func printToLowercase(name: String, employee: Any)  {
        print("We have a new employee: \(name), as \(String.init(describing:type(of: employee)).lowercased())")
    }
}
