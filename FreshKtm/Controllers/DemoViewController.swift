import UIKit
import SnapKit

import MaterialComponents.MaterialTextControls_OutlinedTextFields

class DemoViewController: UIViewController {
    
    @FormMaterialTextField(placeholder: "Enter Something") var demoTextField1 : MaterialComponents.MDCOutlinedTextField
    @FormMaterialTextField(placeholder: "Enter Something") var demoTextField2 : MaterialComponents.MDCOutlinedTextField

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(demoTextField1)
        view.addSubview(demoTextField2)
        
        demoTextField1.backgroundColor = .white
        demoTextField1.tag = 1
        demoTextField1.delegate = self
        demoTextField1.becomeFirstResponder()
        
        demoTextField2.backgroundColor = .white
        demoTextField2.tag = 2
        demoTextField2.delegate = self
        
        demoTextField1.snp.makeConstraints { maker in
            maker.center.equalToSuperview()
            maker.width.equalTo(300)
        }
        demoTextField2.snp.makeConstraints { maker in
            maker.centerX.equalTo(demoTextField1.snp.centerX)
            maker.top.equalTo(demoTextField1.snp.bottom).offset(50)
            maker.width.equalTo(300)
        }
    }
}


extension DemoViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        if let nextField = view.viewWithTag(textField.tag + 1) {
            nextField.becomeFirstResponder()
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.backgroundColor = .cyan
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.backgroundColor = .blue
    }
    
}
