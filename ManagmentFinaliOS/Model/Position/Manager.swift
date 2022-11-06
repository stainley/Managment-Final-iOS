
import Foundation


class Manager : Employee {
    private var nbClients: Int
    private var nbTravelDays: Int = 0
    private var employeeVehicle: Vehicle?

    private let GAIN_FACTOR_CLIENT: Int = 500
    private let GAIN_FACTOR_TRAVEL: Int = 100
    
    init(id: Int, name: String, birthYear: Int, nbClients: Int, rates: Int, monthlyIncome: Double, employeeVehicle: Vehicle) {
        self.nbClients = nbClients
        self.employeeVehicle = employeeVehicle
        super.init(id: id, name: name, birthYear: birthYear, rate: rates, monthlyIncome: monthlyIncome)
    }
    
    init(id: Int, name: String, birthYear: Int, nbClients: Int, nbTravelDays: Int, employeeVehicle: Vehicle) {
        
        self.nbClients = nbClients
        self.nbTravelDays = nbTravelDays
        self.employeeVehicle = employeeVehicle
        super.init(id: id, name: name, birthYear: birthYear)
    }
    
    init(id: Int, name: String, birthYear: Int, nbClients: Int, nbTravelDays: Int, rate: Int) {
        self.nbClients = nbClients
        self.nbTravelDays = nbTravelDays
        super.init(id: id, name: name, birthYear: birthYear, rate: rate)
    }
    

    init(id: Int, name: String, birthYear: Int, nbClients: Int, nbTravelDays: Int) {
        self.nbClients = nbClients
        self.nbTravelDays = nbTravelDays
        super.init(id: id, name: name, birthYear: birthYear)
    }

    init(id: Int, name: String, birthYear: Int, nbClients: Int, nbTravelDays: Int, rate: Int, employeeVehicle: Vehicle) {
       self.employeeVehicle = employeeVehicle
        self.nbClients = nbClients
        self.nbTravelDays = nbTravelDays
        super.init(id: id, name: name, birthYear: birthYear, rate: rate)
    }
    
    override func annualIncome() -> Double {
        let yearlyBaseSalary = super.annualIncome()
        var totalBonusClient: Int = 0
        let travelledDays: Int = 0
        
        for _ in 1...nbClients {
            totalBonusClient = totalBonusClient + GAIN_FACTOR_CLIENT
        }
        
        /*for _ in 1...nbTravelDays {
            travelledDays += GAIN_FACTOR_TRAVEL
        }*/
        
        return yearlyBaseSalary + Double(totalBonusClient) + Double(travelledDays)
    }
    
    func getNbClients() -> Int {
        return self.nbClients
    }
    
    func getNbTravelDays() -> Int {
        return self.nbTravelDays
    }
    
    override func getVehicle() -> Vehicle? {
        return self.employeeVehicle
    }

}
