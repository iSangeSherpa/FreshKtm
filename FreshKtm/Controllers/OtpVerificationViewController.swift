import UIKit
import SnapKit

// Material component dependencies
import MaterialComponents.MaterialTextControls_OutlinedTextFields

class OtpVerificationViewController: UIViewController {
    
    // MARK: Variables
    var textFieldSpacingSmall = 20
    var textFieldSpacingMedium = 30
    
    
    // Images
    var logoImageView : UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "Logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var backgroundImageView : UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "BackgroundImage")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    var facebookLogo : UIImageView = {
        var facebookLogo = UIImageView()
        facebookLogo.image = UIImage(named: "facebookLogo")
        facebookLogo.contentMode = .scaleAspectFit
        return facebookLogo
    }()
    
    var googleLogo : UIImageView = {
        var googleLogo = UIImageView()
        googleLogo.image = UIImage(named: "googleLogo")
        googleLogo.contentMode = .scaleAspectFit
        return googleLogo
    }()
    
    lazy var imageStack : UIStackView = {
        var imageStack = UIStackView()
        imageStack.axis = .horizontal
        imageStack.distribution = .fillEqually
        imageStack.spacing = 30
        imageStack.addArrangedSubview(facebookLogo)
        imageStack.addArrangedSubview(googleLogo)
        return imageStack
    }()
    
    
    // Fields
    @FormMaterialTextField(placeholder: "", keyboardType: .numberPad, alignment: .center) var otp_1 : MaterialComponents.MDCOutlinedTextField
    @FormMaterialTextField(placeholder: "", keyboardType: .numberPad, alignment: .center) var otp_2 : MaterialComponents.MDCOutlinedTextField
    @FormMaterialTextField(placeholder: "", keyboardType: .numberPad, alignment: .center) var otp_3 : MaterialComponents.MDCOutlinedTextField
    @FormMaterialTextField(placeholder: "", keyboardType: .numberPad, alignment: .center) var otp_4 : MaterialComponents.MDCOutlinedTextField
    @FormMaterialTextField(placeholder: "", keyboardType: .numberPad, alignment: .center) var otp_5 : MaterialComponents.MDCOutlinedTextField
    @FormMaterialTextField(placeholder: "", keyboardType: .numberPad, alignment: .center) var otp_6 : MaterialComponents.MDCOutlinedTextField
    
    lazy var textFieldItems = [otp_1, otp_2, otp_3, otp_4, otp_5, otp_6]
    
    lazy var fieldStack : UIStackView = {
        var fieldStack = UIStackView()
        fieldStack.axis = .horizontal
        fieldStack.spacing = 15
        fieldStack.distribution = .fillEqually
        
        fieldStack.addArrangedSubview(otp_1)
        fieldStack.addArrangedSubview(otp_2)
        fieldStack.addArrangedSubview(otp_3)
        fieldStack.addArrangedSubview(otp_4)
        fieldStack.addArrangedSubview(otp_5)
        fieldStack.addArrangedSubview(otp_6)
        return fieldStack
    }()
    
    // Buttons
    let verifyButton : UIButton = primaryButton(titleLabel: "Verify & Continue")
    let registerButton : UIButton = secondaryButton(titleLabel: "Register Now", font: UIFont.robotoRegular(fontSize: 14))
    let resendButton : UIButton = secondaryButton(titleLabel: "Resend 0:30", font: UIFont.robotoRegular(fontSize: 14))
    
    // Labels
    let otpLabel : UILabel = customLabel(title: "OTP Verification", size: 16, font: UIFont.robotoMedium(fontSize: 16), textColor: UIColor(fromHex: "#1F8F2A"))
    let enterLabel : UILabel = customLabel(title: "Enter the OTP sent to +977 XXX-XXXXXX")
    let otpConfirmationLabel : UILabel = customLabel(title: "Didn't receive OTP ?")
    let orLabel : UILabel = customLabel(title: "OR", textColor: .darkGray)
    let newUserLabel : UILabel = customLabel(title: "New user ?", size: 16, textColor: .darkGray)
    
    lazy var confirmationStack : UIStackView = {
        var confirmationStack = UIStackView()
        confirmationStack.axis = .horizontal
        confirmationStack.spacing = 10
        confirmationStack.distribution = .fillProportionally
        
        confirmationStack.addArrangedSubview(otpConfirmationLabel)
        confirmationStack.addArrangedSubview(resendButton)
        return confirmationStack
    }()
    
    lazy var labelStack : UIStackView = {
        var labelStack = UIStackView()
        labelStack.axis = .horizontal
        labelStack.distribution = .fillEqually
        
        labelStack.addArrangedSubview(newUserLabel)
        labelStack.addArrangedSubview(registerButton)
        return labelStack
    }()
    
    
    // Containers
    
    lazy var containerView : UIView = {
        var containerView = UIView()
        return containerView
    }()
    
    lazy var scrollView : UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(containerView)
        return scrollView
    }()
    
    lazy var scrollViewContainer : UIView = {
        var container = UIView()
        container.backgroundColor = .white
        container.layer.cornerRadius = 8
        // Shadow properties
        container.layer.shadowColor = UIColor.black.cgColor
        container.layer.shadowOffset = .zero
        container.layer.shadowRadius = 5
        container.layer.shadowOpacity = 0.1
        
        container.addSubview(scrollView)
        return container
    }()
    
    
    
    // MARK: Main Calling Function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(logoImageView)
        view.addSubview(backgroundImageView)
        view.addSubview(scrollViewContainer)
        
        otp_1.becomeFirstResponder()
        
        for otpField in textFieldItems {
            otpField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        }        
        
        // MARK: ScrollView ChildViews
        containerView.addSubview(otpLabel)
        containerView.addSubview(enterLabel)
        containerView.addSubview(fieldStack)
        containerView.addSubview(confirmationStack)
        containerView.addSubview(verifyButton)
        containerView.addSubview(orLabel)
        containerView.addSubview(imageStack)
        containerView.addSubview(labelStack)
        
        
        logoImageView.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.width.equalTo(200)
            maker.top.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        backgroundImageView.snp.makeConstraints { maker in
            maker.leading.trailing.equalToSuperview()
            maker.bottom.equalTo(view.safeAreaLayoutGuide)
            maker.height.equalTo(200)
        }
        
        // MARK: Constraints for containers
        scrollViewContainer.snp.makeConstraints { maker in
            maker.centerX.centerY.equalToSuperview()
            maker.leading.equalToSuperview().offset(20)
            maker.trailing.equalToSuperview().offset(-20)
            maker.top.equalTo(view.safeAreaLayoutGuide).offset(110)
            maker.bottom.equalTo(view.safeAreaLayoutGuide).offset(-80)
        }
        scrollView.snp.makeConstraints { maker in
            maker.top.left.equalToSuperview().offset(20)
            maker.bottom.right.equalToSuperview().offset(-20)
            maker.width.equalTo(250)
        }
        containerView.snp.makeConstraints { maker in
            maker.left.top.right.bottom.equalToSuperview()
            maker.width.equalToSuperview()
            maker.height.equalTo(520)
        }
        
        // MARK: Constraints for labels
        otpLabel.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalToSuperview().offset(textFieldSpacingSmall)
        }
        enterLabel.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(otpLabel.snp.bottom).offset(textFieldSpacingSmall)
        }
        fieldStack.snp.makeConstraints { maker in
            maker.top.equalTo(enterLabel.snp.bottom).offset(textFieldSpacingMedium)
            maker.left.equalToSuperview().offset(1)
            maker.right.equalToSuperview().offset(-1)
        }
        confirmationStack.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(fieldStack.snp.bottom).offset(40)
        }
        verifyButton.snp.makeConstraints { maker in
            maker.top.equalTo(confirmationStack.snp.bottom).offset(textFieldSpacingSmall)
            maker.height.equalTo(44)
            maker.width.equalToSuperview()
        }
        orLabel.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(verifyButton.snp.bottom).offset(textFieldSpacingMedium)
        }
        imageStack.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.width.equalTo(view.frame.width/2.5)
            maker.height.equalTo(view.frame.width/4)
            maker.top.equalTo(orLabel.snp.bottom).offset(10)
        }
        labelStack.snp.makeConstraints { maker in
            maker.top.equalTo(imageStack.snp.bottom).offset(30)
            maker.centerX.equalToSuperview()
        }
        
    }
    
    @objc func textFieldDidChange(sender: UITextField) {
        guard let text = sender.text else {return}
        if text.count == 1 {
            changeResponder(textField: sender, textfieldArray: textFieldItems)
        }
    }
    
    func changeResponder(textField : UITextField, textfieldArray : [UITextField]) {
        
        switch textField {
            case textfieldArray[0] : textfieldArray[1].becomeFirstResponder()
                break
                
            case textfieldArray[1] : textfieldArray[2].becomeFirstResponder()
                break
                
            case textfieldArray[2] : textfieldArray[3].becomeFirstResponder()
                break
                
            case textfieldArray[3] : textfieldArray[4].becomeFirstResponder()
                break
                
            case textfieldArray[4] : textfieldArray[5].becomeFirstResponder()
                break
                
            case textfieldArray[5] : textfieldArray[5].resignFirstResponder()
                break
                
            default: break
        }
    }
    
}




extension OtpVerificationViewController: UITextFieldDelegate {
    
    // Limit the textfield input to a single number
    //  Called whenever user types or deletes characters in the text field
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let maxLength = 1
        let currentString = (textField.text ?? "") as NSString
        let newString = currentString.replacingCharacters(in: range, with: string)

        return newString.count <= maxLength
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = view.viewWithTag(textField.tag + 1) {
            nextField.becomeFirstResponder()
        }
        return true
    }

    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }

}
