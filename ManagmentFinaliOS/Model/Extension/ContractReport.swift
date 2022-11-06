
import Foundation

extension Employee {
    
    func getEmployeePosition() -> TypeEmployee {
        if let _ = self as? Manager {
            return TypeEmployee.MANAGER
        } else if let _ = self as? Programmer {
            return TypeEmployee.PROGRAMMER
        } else {
            return TypeEmployee.TESTER
        }
    }
    
    func contractInfo() -> String {
        var typeContract: TypeContract = TypeContract.TEMPORARY
                
        var married: String = ""
        var nbChildren: Int = 0
        var nbAccumulatedDays: Int = 0
        var monthlySalary: Double = 0
        var hourlySalary: Double = 0
        var accumulatedHours: Int = 0
        
        if let permanent = self.contract as? Permanent {
            typeContract = TypeContract.PERMANENT
            married = permanent.getMarried() ? "married" : "not married"
            nbChildren = permanent.getNbChildren()
            nbAccumulatedDays = permanent.getAccumulatedDays()
            monthlySalary = permanent.getMonthlySalary()
        } else if let temporary = self.contract as? Temporary {
            typeContract = TypeContract.TEMPORARY
            hourlySalary = temporary.getHourlySalary()
            accumulatedHours = temporary.getAccumulatedHours()
        }
        
        let messagePermanent: String = """
            \(getName()) is a \(getEmployeePosition().rawValue). he is \(married) and he/she has \(nbChildren) children.
            He/She has worked for \(nbAccumulatedDays) days and upon contract his/her monthly salary is \(monthlySalary).
            """
        
        let messageTemporary: String = """
            \(getName()) is a \(getEmployeePosition().rawValue). he is \(typeContract.rawValue) employee with \(hourlySalary) hourly salary and he has worked for \(accumulatedHours) hours.
            """
        
        return "\(typeContract == TypeContract.TEMPORARY ? messageTemporary : messagePermanent)"
    }
}
