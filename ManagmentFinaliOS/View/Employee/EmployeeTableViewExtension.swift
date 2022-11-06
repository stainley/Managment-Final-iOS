import UIKit

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFiltered ?  employeeFilter.count : employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let employeeRow = tableView.dequeueReusableCell(withIdentifier: "EmployeeCustomTableViewCell", for: indexPath) as! EmployeeCustomTableViewCell
        
        if isFiltered {
            employeeRow.employeeNameLabel.text = "Name: \(employeeFilter[indexPath.row].getName())"
            employeeRow.employeeIdLabel.text = "Id: \(employeeFilter[indexPath.row].getById())"
        } else {
            employeeRow.employeeNameLabel.text = "Name: \(employees[indexPath.row].getName())"
            employeeRow.employeeIdLabel.text = "Id: \(employees[indexPath.row].getById())"
        }
        
        return employeeRow
    }    
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        let employee = isFiltered ? employeeFilter[indexPath.row] : employees[indexPath.row]
        let resultViewController = storyboard?.instantiateViewController(withIdentifier: "reportId") as! ResultViewController
        resultViewController.reportEmployee = employee
        self.show(resultViewController, sender: self)
        return indexPath
    }
}
