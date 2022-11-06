
import Foundation

class Employee {
    private var id: Int = 0
    private let name: String
    private var birthYear: Int
    private var age: Int = 0
    private var monthlyIncome: Double = 0.0
    private var rate: Int = 100
    private var employeeVehicle: Vehicle?
    
    var contract: Contract?
        
    init(id: Int, name: String, birthYear: Int, rate: Int, monthlyIncomem: Double, employeeVehicle: Vehicle) {
        self.id = id
        self.name = name
        self.birthYear = birthYear
        self.rate = rate
        self.monthlyIncome = monthlyIncomem
        self.employeeVehicle = employeeVehicle
    }
    
    init(id: Int, name: String, birthYear: Int, rate: Int, monthlyIncome: Double) {
        self.id = id
        self.name = name
        self.birthYear = birthYear
        self.rate = rate
        self.monthlyIncome = monthlyIncome
    }
    
    
    init(id: Int, name: String, birthYear: Int, rate: Int) {
        self.id = id
        self.name = name
        self.birthYear = birthYear
        self.rate = rate > 100 ? 100 : rate
        printToLowercase(name: name, employee: self)
    }
    
    init(id: Int, name: String, birthYear: Int) {
        self.id = id
        self.name = name
        self.birthYear = birthYear
        printToLowercase(name: name, employee: self)
    }
    
    func getAge() -> Int {
        let currentYear = Calendar.current.component(.year, from: Date())
        
        return (currentYear - birthYear)
    }
    
    func getById() -> Int {
        return self.id
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getRate() -> Int {
        return self.rate
    }
    
    func getVehicle() -> Vehicle? {
        if let unwrap = self.employeeVehicle {
            return unwrap
        } else {
            return nil
        }
     
    }
    
    func annualIncome() -> Double {
        
        return (12 * monthlyIncome * Double(rate) / 100)
    }

    func signContract(contract: Contract) {
        self.contract = contract
    }
  
}
