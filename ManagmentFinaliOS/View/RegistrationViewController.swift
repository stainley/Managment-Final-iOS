import UIKit

class RegistrationViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    public weak var onEmployeeDataDelegate: (any EmployeeDataSource)?
    
    var employee: Employee!
    var vehicle: Vehicle!
    var typeContract: TypeContract!
    var typeEmployee: TypeEmployee!
    var typeVehicle: TypeVehicle!
        
    var fullName: String!
    var birthYear: Int!
    var monthlySalary: Double!
    var occupationRate: Int!
    var numbersOfExtra: Int = 0
    var employeeId: Int = 0
    var vehicleModel: String = ""
    var vehicleCategory: String = ""
    var hasSideCar: Bool = false
    
    var selectedEmployeeType: String?
    let employeeType: [String] = ["Choose Type", "Manager", "Programmer", "Tester"]
    var vehicleColor: UIColor!
    
    @IBOutlet weak var employeeTypePicker: UIPickerView!
    @IBOutlet weak var employeeTypeTextFiled: UITextField!
    @IBOutlet weak var employeeTypeLabel: UILabel!
    
    @IBOutlet weak var employeeIdTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    @IBOutlet weak var birthYearTextField: UITextField!
    @IBOutlet weak var monthlySalaryTextField: UITextField!
    @IBOutlet weak var occupationRateTextField: UITextField!
    
    @IBOutlet weak var sideCardOption: UISegmentedControl!
    @IBOutlet weak var plateNumberTextField: UITextField!
    
    @IBOutlet weak var carTypeTextField: UITextField!
    
    @IBOutlet weak var vehicleModelTextField: UITextField!
    @IBOutlet weak var carSideLabel: UILabel!
    @IBOutlet weak var typeVehicleOption: UISegmentedControl!
    
    @IBAction func typeVehicleOption(_ sender: UISegmentedControl) {
        
        let position = sender.selectedSegmentIndex
        
        switch position {
            case 0:
                typeVehicle = .CAR
                carTypeTextField.isHidden = false
                sideCardOption.isHidden = true
                carSideLabel.text = "Car Type"
            case 1:
                typeVehicle = .MOTORCYCLE
                carTypeTextField.isHidden = true
                sideCardOption.isHidden = false
                carSideLabel.text = "Side Car"
            default:
                typeVehicle = .CAR
                carTypeTextField.isHidden = false
                sideCardOption.isHidden = true
                carSideLabel.text = "Car Type"
        }
    }
    
    @IBAction func sideCardSelection(_ sender: UISegmentedControl) {
        let optionSelected = sender.selectedSegmentIndex
        
        switch optionSelected {
            case 0:
                hasSideCar = true
            case 1:
                hasSideCar = false
            default:
                hasSideCar = false
        }
    }
    
    override func viewDidLoad() {
        employeeTypePicker.dataSource = self
        employeeTypePicker.delegate = self
        employeeTypeLabel.text = ""
        employeeTypeLabel.isHidden = true
        employeeTypeTextFiled.isHidden = true
        
        typeVehicleOption.selectedSegmentIndex = 0
        carTypeTextField.isHidden = false
        sideCardOption.isHidden = true
        typeVehicle = .CAR
    }
    
    func createPickerView() {
        let pickerView = UIPickerView()
        pickerView.delegate = self
    }

    @IBAction func chooseColorButton(_ sender: UIButton) {
        let colorChooserPicker = UIColorPickerViewController()
        colorChooserPicker.delegate = self
        
        self.present(colorChooserPicker, animated: true, completion: {
            self.vehicleColor = colorChooserPicker.selectedColor
            print(self.vehicleColor!)
        })
    }
    
    @IBAction func registerButton(_ sender: UIButton) {
        
        employeeId = Int(employeeIdTextField.text ?? "") ?? 0
        fullName = "\(firstNameTextField.text ?? "") \(lastnameTextField.text ?? "")"
        birthYear = Int(birthYearTextField.text ?? "") ?? 0
        monthlySalary = Double(monthlySalaryTextField.text ?? "") ?? 0.0
        occupationRate = Int(occupationRateTextField.text ?? "") ?? 0
        
        vehicleModel = vehicleModelTextField.text ?? ""
        vehicleCategory = carTypeTextField.text ?? ""
        
        numbersOfExtra = Int(employeeTypeTextFiled.text ?? "") ?? 0
                
        guard typeEmployee != nil, typeVehicle != nil, fullName != "",
             birthYear != 0, monthlySalary != 0, occupationRate != 0, numbersOfExtra != 0,
              vehicleModel != "", vehicleColor != nil
        else {
            validateEmptyField()
            return
        }
        
        registerVehicle(typeVehicle: typeVehicle)
        registerEmployee(typeEmployee: typeEmployee)
        
        onEmployeeDataDelegate?.onEmployeeDataDelegate(employee: employee)
        self.dismiss(animated: true)
    }    
  
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return employeeType.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
      
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedEmployeeType = employeeType[row]
        employeeOptionSelected()
        
        if selectedEmployeeType == "Manager" {
            typeEmployee = .MANAGER
        } else if selectedEmployeeType == "Programmer" {
            typeEmployee = .PROGRAMMER
        } else if selectedEmployeeType == "Tester" {
            typeEmployee = .TESTER
        } else {
            print("Invalid Option")
        }
    }
  
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return employeeType[row]
    }
}
