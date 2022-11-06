

import UIKit

extension RegistrationViewController: UIColorPickerViewControllerDelegate {
    
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        vehicleColor = viewController.selectedColor
        print(vehicleColor!)
    }
}
