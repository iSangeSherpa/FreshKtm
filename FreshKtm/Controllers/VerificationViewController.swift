import UIKit
import SnapKit

// Material component dependencies
import MaterialComponents.MaterialTextControls_OutlinedTextFields

class VerificationViewController: UIViewController {
    
    lazy var usernameField : MDCOutlinedTextField = {
        var frame = CGRect(x: 0, y: 0, width: 300, height: 100)
        var usernameField = MDCOutlinedTextField(frame: frame)
        usernameField.label.text = "Enter username"
        usernameField.label.font = .robotoMedium(fontSize: 15)
        usernameField.layer.cornerRadius = 8
        usernameField.backgroundColor = .white
        
        usernameField.setNormalLabelColor(UIColor.lightGray, for: .normal)
        usernameField.setFloatingLabelColor(UIColor.gray, for: .editing)
        usernameField.setOutlineColor(UIColor.lightGray, for: .normal)
        usernameField.setOutlineColor(UIColor.gray, for: .editing)
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        return usernameField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(usernameField)
        
        usernameField.snp.makeConstraints { maker in
            maker.center.equalToSuperview()
        }
    }
}
