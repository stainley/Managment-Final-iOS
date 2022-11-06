
import Foundation

class Temporary: Contract {
    
    var hourlySalary: Double
    var accumulatedHours: Int
    
    init(hourlySalary: Double, accumulatedHours: Int) {
        self.hourlySalary = hourlySalary
        self.accumulatedHours = accumulatedHours
    }
 
    func getHourlySalary() -> Double {
        return self.hourlySalary
    }
    
    func getAccumulatedHours() -> Int {
        return self.accumulatedHours
    }
    
    func accumulatedSalary() -> Double {
        return hourlySalary * Double(accumulatedHours) * 12
    }
}
