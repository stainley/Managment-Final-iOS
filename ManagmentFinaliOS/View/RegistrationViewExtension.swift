

import UIKit

extension RegistrationViewController: UIColorPickerViewControllerDelegate {
    
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        vehicleColor = viewController.selectedColor
    }
        
    func employeeOptionSelected() {
        
        if selectedEmployeeType == "Tester" {
            employeeTypeLabel.text = "# of bugs"
            employeeTypeTextFiled.placeholder = "number"
            employeeTypeLabel.isHidden = false
            employeeTypeTextFiled.isHidden = false
            
        } else if selectedEmployeeType == "Manager" {
            employeeTypeLabel.text = "# of clients"
            employeeTypeTextFiled.placeholder = "number"
            employeeTypeLabel.isHidden = false
            employeeTypeTextFiled.isHidden = false

        } else if selectedEmployeeType == "Programmer" {
            employeeTypeLabel.text = "# of projects"
            employeeTypeTextFiled.placeholder = "number"
            employeeTypeLabel.isHidden = false
            employeeTypeTextFiled.isHidden = false
            
        } else {
            employeeTypeLabel.text = ""
            employeeTypeTextFiled.isHidden = true
            employeeTypeTextFiled.placeholder = ""
            employeeTypeLabel.isHidden = true
        }
    }
    
    /**
    * If they're empty field show an alert
    */
    func validateEmptyField() {
        
        let messageAction = UIAlertController(title: "Empty Field", message: "Please fill are fields", preferredStyle: .alert)
        let alertCancel = UIAlertAction(title: "Cancel", style: .cancel)
        messageAction.addAction(alertCancel)
        self.present(messageAction, animated: true)
    }
        

    func registerVehicle(typeVehicle: TypeVehicle) {
        switch typeVehicle {
            case .CAR:
                // instead using colors, are passed the UIColor object to the vehicle
                vehicle = Car(make: vehicleModel, plate: plateNumberTextField.text ?? "", color: "", category: vehicleCategory, gear: "", type: "", colour: vehicleColor!)
            case .MOTORCYCLE:
                vehicle = Motorcycle(make: vehicleModel, plate: plateNumberTextField.text ?? "", color: "", category: vehicleCategory, sidecar: hasSideCar, colour: vehicleColor!)
        }
    }
    
    func registerEmployee(typeEmployee: TypeEmployee) {
        
        switch typeEmployee {
            case .MANAGER:
                employee = Manager(id: employeeId, name: fullName, birthYear: birthYear, nbClients: numbersOfExtra, rates: occupationRate, monthlyIncome: monthlySalary, employeeVehicle: vehicle)
            case .PROGRAMMER:
                employee = Programmer(id: employeeId, name: fullName, birthYear: birthYear, rate: occupationRate, nbProjects: numbersOfExtra, monthlyIncomem: monthlySalary, employeeVehicle: vehicle)
            case .TESTER:
                employee = Tester(id: employeeId, name: fullName, birthYear: birthYear, nbBugs: numbersOfExtra, monthlyIncome: monthlySalary, rate: occupationRate, employeeVehicle: vehicle)
        }
    }
}
