import UIKit

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let totalRow = isFiltered ?  employeeFilter.count : employees.count
        return totalRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let employeeRow = tableView.dequeueReusableCell(withIdentifier: "EmployeeCustomTableViewCell", for: indexPath) as! EmployeeCustomTableViewCell
        
        employeeRow.employeeNameLabel.text =  isFiltered ? "Name: \(employeeFilter[indexPath.row].getName())" : "Name: \(employees[indexPath.row].getName())"
        employeeRow.employeeIdLabel.text = isFiltered ? "Id: \(employeeFilter[indexPath.row].getById())" : "Id: \(employees[indexPath.row].getById())"
      
        
        return employeeRow
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        let employee = isFiltered ? employeeFilter[indexPath.row] : employees[indexPath.row]
        let resultViewController = storyboard?.instantiateViewController(withIdentifier: "reportId") as! ResultViewController
        resultViewController.reportEmployee = employee
        self.show(resultViewController, sender: self)
        return indexPath
    }    
}

extension ViewController: UITableViewDelegate {
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 96
    }
}
