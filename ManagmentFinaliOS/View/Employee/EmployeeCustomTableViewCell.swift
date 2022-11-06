
import UIKit

class EmployeeCustomTableViewCell: UITableViewCell {

    @IBOutlet weak var employeeNameLabel: UILabel!
    
    @IBOutlet weak var employeeIdLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
