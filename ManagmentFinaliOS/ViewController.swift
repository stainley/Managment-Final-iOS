
import UIKit

class ViewController: UIViewController, EmployeeDataSource {
    
    @IBOutlet weak var employeeTableView: UITableView!
    
    @IBOutlet weak var findTextField: UITextField!
    var employeeFilter: [Employee] = [Employee]()
    var employees: [Employee] = [Employee]()
    
    var previousEmployees: [Employee] = [Employee]()
    var isFiltered = false
  
    var colorV: UIColor!
    
    
    @IBAction func findEmployeeRecord(_ sender: UIButton) {
        
        guard let findText = findTextField.text  else {
            return
        }
        
        if findText == "0" || findText == "" {
            employeeTableView.reloadData()
            return
        }
        
        let findById = Int(findText)

        employeeFilter = employees.filter( {
            let found = $0.getById() == findById
            isFiltered = found
            employeeTableView.reloadData()
            return isFiltered
        })
        
    }
    
    func onEmployeeDataDelegate(employee: Employee) {
        employees.append(employee)
        employeeTableView.reloadData()
    }
    
    func onVehicleColorDelegate(color: UIColor) {
        colorV = color
    }
        
    @IBAction func addButton(_ sender: UIButton) {
        let registrationViewController = storyboard?.instantiateViewController(withIdentifier: "registrationID") as! RegistrationViewController
        registrationViewController.onEmployeeDataDelegate = self
        show(registrationViewController, sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCustomTableCell()
        
        employeeTableView.dataSource = self
        employeeTableView.delegate = self
        employeeTableView.reloadData()
        //employees = employeeFilter
    }
      
    func registerCustomTableCell() {
        let contentCell = UINib(nibName: "EmployeeCustomTableViewCell", bundle: nil)
        employeeTableView.register(contentCell, forCellReuseIdentifier: "EmployeeCustomTableViewCell")
    }

}

