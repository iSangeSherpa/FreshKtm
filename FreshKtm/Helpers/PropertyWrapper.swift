import MaterialComponents.MaterialTextControls_OutlinedTextFields
import UIKit

@propertyWrapper
public class FormMaterialTextField {
    public var wrappedValue: MaterialComponents.MDCOutlinedTextField

    public init(placeholder: String, keyboardType: UIKeyboardType = .default, capitalizationType: UITextAutocapitalizationType = .words, isSecureTextEntry: Bool = false, leftView : UIImageView? = nil, alignment: NSTextAlignment = .left){
        
        let colorGreen = UIColor(fromHex: "1F8F2A")

        self.wrappedValue = MaterialComponents.MDCOutlinedTextField()
        wrappedValue.placeholder = placeholder
        wrappedValue.textAlignment = alignment
        wrappedValue.keyboardType = keyboardType
        wrappedValue.autocapitalizationType = capitalizationType
        wrappedValue.isSecureTextEntry = isSecureTextEntry
        wrappedValue.leadingView = leftView
        wrappedValue.leadingViewMode = .always
        wrappedValue.font = UIFont.robotoRegular(fontSize: 14)
        wrappedValue.label.text = placeholder
        wrappedValue.setNormalLabelColor(.systemGray, for: .normal)
        wrappedValue.setOutlineColor(UIColor.clear, for: .normal)
        wrappedValue.setFloatingLabelColor(colorGreen!, for: .editing)
        wrappedValue.setFloatingLabelColor(UIColor.systemGray, for: .normal)
        wrappedValue.setOutlineColor(colorGreen!, for: .editing)
        wrappedValue.verticalDensity = 1
        wrappedValue.setOutlineColor(UIColor.systemGray, for: .normal)
        wrappedValue.layer.cornerRadius = 8
        wrappedValue.preferredContainerHeight = 44
        wrappedValue.sizeToFit()
    }


}
