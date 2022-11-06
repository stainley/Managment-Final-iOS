
import Foundation

class Permanent: Contract{
    
    private var nbChildren: Int
    private var married: Bool = false
    private var monthlySalary: Double
    private var bonusPerChildPerMonth: Double
    private var accumulatedDays: Int
    
    init(nbChildren: Int, married: Bool, monthlySalary: Double, bonusPerChildPerMonth: Double, accumulatedDays: Int) {
        self.nbChildren = nbChildren
        self.married = married
        self.monthlySalary = monthlySalary
        self.bonusPerChildPerMonth = bonusPerChildPerMonth
        self.accumulatedDays = accumulatedDays
    }
    
    func accumulatedSalary() -> Double {
        let WORKING_DAYS_MONTHLY =  20
      
        if married {
            let totalBonusChildren = bonusPerChildPerMonth * Double(nbChildren)
            return Double(accumulatedDays * Int((monthlySalary + (totalBonusChildren))) / WORKING_DAYS_MONTHLY) * 12
        }
        return Double(accumulatedDays *  Int(monthlySalary) / WORKING_DAYS_MONTHLY) * 12
    }
    
    
    func getNbChildren() -> Int {
        return self.nbChildren
    }
    
    func getMarried() -> Bool {
        return self.married
    }
    
    func getAccumulatedDays() -> Int {
        return self.accumulatedDays
    }
    
    func getMonthlySalary() -> Double {
        return self.monthlySalary
    }
}
