
import Foundation

class Programmer : Employee {
    
    private var nbProjects: Int
    private var employeeVehicle: Vehicle?
    private let GAIN_FACTOR_PROJECTS = 200
    
    
    init(id: Int, name: String, birthYear: Int, rate: Int, nbProjects: Int, monthlyIncomem: Double, employeeVehicle: Vehicle) {
        self.nbProjects = nbProjects
        self.employeeVehicle = employeeVehicle
        super.init(id: id, name: name, birthYear: birthYear, rate: rate, monthlyIncome: monthlyIncomem)
    }
    
    
    init(id: Int, name: String, birthYear: Int, nbProjects: Int, rate: Int, employeeVehicle: Vehicle) {
        self.nbProjects = nbProjects
        self.employeeVehicle = employeeVehicle
        super.init(id: id, name: name, birthYear: birthYear, rate: rate)
    }
    
    init(id: Int, name: String, birthYear: Int, nbProjects: Int, employeeVehicle: Vehicle) {
        self.nbProjects = nbProjects
        self.employeeVehicle = employeeVehicle
        super.init(id: id, name: name, birthYear: birthYear)
    }
    
    init(id: Int, name: String, birthYear: Int, nbProjects: Int, rate: Int) {
        self.nbProjects = nbProjects
        super.init(id: id, name: name, birthYear: birthYear, rate: rate)
    }
    
    init(id: Int, name: String, birthYear: Int , nbProjects: Int) {
        self.nbProjects = nbProjects
        super.init(id: id, name: name, birthYear: birthYear)
    }
    
    override func getVehicle() -> Vehicle? {
        return self.employeeVehicle
    }
    
    func getNbProjects() -> Int {
        return self.nbProjects
    }
    
    override func annualIncome() -> Double {
        return super.annualIncome() + Double(nbProjects * GAIN_FACTOR_PROJECTS)
    }
}
