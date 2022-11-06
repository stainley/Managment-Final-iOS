
import Foundation

class Tester : Employee {
    private var nbBugs: Int
    private var employeeVehicle: Vehicle?
    private let GAIN_FACTOR_ERROR = 10
    
    init(id: Int, name: String, birthYear: Int, nbBugs: Int, monthlyIncome: Double, rate: Int, employeeVehicle: Vehicle) {
        self.nbBugs = nbBugs
        self.employeeVehicle = employeeVehicle
        super.init(id: id, name: name, birthYear: birthYear, rate: rate, monthlyIncome: monthlyIncome)
    }
    
    init(id: Int, name: String, birthYear: Int, nbBugs: Int, rate: Int, employeeVehicle: Vehicle) {
        self.nbBugs = nbBugs
        self.employeeVehicle = employeeVehicle
        super.init(id: id, name: name, birthYear: birthYear, rate: rate)
    }

    init(id: Int, name: String, birthYear: Int, nbBugs: Int, rate: Int) {
        self.nbBugs = nbBugs
        super.init(id: id, name: name, birthYear: birthYear, rate: rate)
    }
    
    override func getVehicle() -> Vehicle? {
        return self.employeeVehicle
    }
    
    func getNbBugs() -> Int {
        return self.nbBugs
    }
    
    override func annualIncome() -> Double {
        return super.annualIncome() + Double(nbBugs * 10)
    }
}
