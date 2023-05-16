import MaterialComponents.MaterialTextControls_OutlinedTextFields
import UIKit

@propertyWrapper
public class FormMaterialTextField {
    public var wrappedValue: MaterialComponents.MDCOutlinedTextField

    public init(placeholder: String, keyboardType: UIKeyboardType = .default, capitalizationType: UITextAutocapitalizationType = .words, isSecureTextEntry: Bool = false, leftView : UIImageView? = nil){

        self.wrappedValue = MaterialComponents.MDCOutlinedTextField()
        wrappedValue.placeholder = placeholder
        wrappedValue.keyboardType = keyboardType
        wrappedValue.autocapitalizationType = capitalizationType
        wrappedValue.isSecureTextEntry = isSecureTextEntry
        wrappedValue.leadingView = leftView
        wrappedValue.leadingViewMode = .always
        wrappedValue.font = UIFont.robotoRegular(fontSize: 14)
        wrappedValue.label.text = placeholder
        wrappedValue.setNormalLabelColor(.systemGray, for: .normal)
        wrappedValue.setOutlineColor(UIColor.clear, for: .normal)
//        wrappedValue.setFloatingLabelColor(UIColor.primary, for: .editing)
        wrappedValue.setFloatingLabelColor(UIColor.systemGray2, for: .normal)
//        wrappedValue.setOutlineColor(UIColor.primary, for: .editing)
        wrappedValue.verticalDensity = 1
        wrappedValue.setOutlineColor(UIColor.systemGray6, for: .normal)
//        wrappedValue.layer.backgroundColor = UIColor.backgroundColor.cgColor
        wrappedValue.layer.cornerRadius = 8
        wrappedValue.preferredContainerHeight = 44
        wrappedValue.sizeToFit()

    }


}
