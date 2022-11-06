import Foundation

extension Employee: CustomStringConvertible {
    
    var description: String {
        var gear: String = ""
        var type: String = ""
        var sidecard: String = ""
        var typeOfVehicle: String = ""
                        
        var vehicle: Vehicle! = getVehicle()
        if getVehicle() != nil {
            vehicle = getVehicle()!
        }
        
        if let car = vehicle as? Car {
            typeOfVehicle = "car"
            gear = car.getGear()
            type = car.getType()
        } else if let moto = vehicle as? Motorcycle {
            typeOfVehicle = "motorcycle"
            sidecard = moto.getSidecar() ? "with sidecard" : "without sidecard"
        }
        
        var isPossitionOf: Bool = false
        var occupationMessage: String = ""
        
        if let manag = self as? Manager {
            isPossitionOf = true
            //occupationMessage = "He/She travelled \(manag.getNbTravelDays()) days and has brought \(manag.getNbClients()) new clients."
            occupationMessage = " has brought \(manag.getNbClients()) new clients."
        } else if let prog = self as? Programmer {
            isPossitionOf = true
            occupationMessage = " has ompleted \(prog.getNbProjects()) projects."
        } else if let test = self as? Tester {
            isPossitionOf = true
            occupationMessage = " has corrected \(test.getNbBugs()) bugs."
        }
        
        
        var yearlyIncome: Double = 0
        
        if  self.contract != nil  {
            if let perm = self.contract as? Permanent {
                yearlyIncome = perm.accumulatedSalary() * Double(getRate()) / 100
                yearlyIncome += annualIncome()
            } else if let temp = self.contract as? Temporary {
                yearlyIncome = temp.accumulatedSalary() * Double(getRate()) / 100
                yearlyIncome += annualIncome()
            }
        } else {
            yearlyIncome = annualIncome()
        }
        //- color: \(vehicle != nil ? vehicle.getColor() : "")
        let report: String = """
        Name: \(getName()), a \(Self.self)
        Age: \(getAge())
        Employee has a \(typeOfVehicle)
            - Model: \(vehicle != nil ? vehicle.getMake() : "")
            - Plate: \(vehicle != nil ? vehicle.getPlate() : "")
            - category: \(vehicle != nil ? vehicle.getCategory() : "")
            Occupation rate: \(getRate())
            Annual income: $\(yearlyIncome)
            He/She \(isPossitionOf == true ? occupationMessage : "")
        """
        
        return report
    }
    
    /**
     \(typeOfVehicle == "car" ? "- gear: \(gear)\n\t- type: \(type)"  : "- \(sidecard)")
     \(getName()) has an Occupation rate: \(getRate())% \(isPossitionOf == true ? occupationMessage : "")
     His/Her estimated annual income is \(yearlyIncome)
     */
}
