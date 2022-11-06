
import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var imageVehicle: UIImageView!
        
    var reportEmployee: Employee!
    var typeOfVehicle: String!
    
    override func viewDidLoad() {
        let imageConfiguration = UIImage.SymbolConfiguration(pointSize: 17, weight: .medium, scale: .large)
        resultLabel.text = reportEmployee.description
        
        if let typeCar = reportEmployee.getVehicle() as? Car {
            imageVehicle.tintColor = typeCar.getColour() as? UIColor
            typeOfVehicle = "car"
        } else if let typeMoto = reportEmployee.getVehicle() as?  Motorcycle {
            imageVehicle.tintColor = typeMoto.getColour() as? UIColor
            typeOfVehicle = "bicycle"           
        }
        imageVehicle.image = UIImage(systemName: typeOfVehicle, withConfiguration: imageConfiguration)
    }
}
