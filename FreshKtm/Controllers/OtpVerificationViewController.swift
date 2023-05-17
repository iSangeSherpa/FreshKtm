import UIKit
import SnapKit

// Material component dependencies
import MaterialComponents.MaterialTextControls_OutlinedTextFields

class OtpVerificationViewController: UIViewController {
    
    // MARK: Variables
    var textFieldSpacingSmall = 20
    var textFieldSpacingMedium = 30
    
    var smallFont : CGFloat = 14
    var mediumFont : CGFloat = 16
    var largeFont : CGFloat = 20
    
    var colorLight : UIColor = {
        return UIColor(red: 95/255, green: 95/255, blue: 95/255, alpha: 1)
    }()
    var colorGreen : UIColor = {
        return UIColor(red: 31/255, green: 143/255, blue: 42/255, alpha: 1.0)
    }()
    
    
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
    
    
    //  Labels
    
    lazy var otpLabel : UILabel = {
       var otpLabel = UILabel()
        otpLabel.text = "OTP Verification"
        otpLabel.textColor = colorGreen
        otpLabel.font = .robotoMedium(fontSize: mediumFont)
        return otpLabel
    }()
    
    lazy var enterLabel : UILabel = {
       var enterLabel = UILabel()
        enterLabel.text = "Enter the OTP sent to +977 XXX-XXXXXX"
        enterLabel.textColor = .gray
        enterLabel.font = .robotoRegular(fontSize: smallFont)
        enterLabel.numberOfLines = 0
        return enterLabel
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
    @FormMaterialTextField(placeholder: "") var otp_1 : MaterialComponents.MDCOutlinedTextField
    @FormMaterialTextField(placeholder: "") var otp_2 : MaterialComponents.MDCOutlinedTextField
    @FormMaterialTextField(placeholder: "") var otp_3 : MaterialComponents.MDCOutlinedTextField
    @FormMaterialTextField(placeholder: "") var otp_4 : MaterialComponents.MDCOutlinedTextField
    @FormMaterialTextField(placeholder: "") var otp_5 : MaterialComponents.MDCOutlinedTextField
    @FormMaterialTextField(placeholder: "") var otp_6 : MaterialComponents.MDCOutlinedTextField
    
//    private func otpShifting() {
//        otp_1.keyboardType = .decimalPad
//        otp_2.keyboardType = .decimalPad
//        otp_3.keyboardType = .decimalPad
//        otp_4.keyboardType = .decimalPad
//        otp_5.keyboardType = .decimalPad
//        otp_6.keyboardType = .decimalPad
//    }
    
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
    
    lazy var otpConfirmationLabel : UILabel = {
        var otpConfirmationLabel = UILabel()
        otpConfirmationLabel.text = "Didn't receive OTP ?"
        otpConfirmationLabel.textColor = .gray
        otpConfirmationLabel.font = .robotoRegular(fontSize: smallFont)
        return otpConfirmationLabel
    }()

    lazy var otpConfirmationCounterLabel : UILabel = {
        var otpConfirmationCounterLabel = UILabel()
        otpConfirmationCounterLabel.text = "Resend 0:30"
        otpConfirmationCounterLabel.textColor = colorGreen
        otpConfirmationCounterLabel.font = .robotoRegular(fontSize: smallFont)
        return otpConfirmationCounterLabel
    }()
    
    lazy var confirmationStack : UIStackView = {
        var confirmationStack = UIStackView()
        confirmationStack.axis = .horizontal
        confirmationStack.spacing = 10
        confirmationStack.distribution = .fillProportionally
        
        confirmationStack.addArrangedSubview(otpConfirmationLabel)
        confirmationStack.addArrangedSubview(otpConfirmationCounterLabel)
        return confirmationStack
    }()
    
    lazy var verifyButton : UIButton = {
        var verifyButton = UIButton()
        verifyButton.titleLabel?.font = .robotoMedium(fontSize: largeFont)
        verifyButton.setTitle("Verify & Continue", for: .normal)
        verifyButton.layer.cornerRadius = 8
        verifyButton.backgroundColor = colorGreen
        return verifyButton
    }()
    
    lazy var orLabel : UILabel = {
        var orLabel = UILabel()
        orLabel.text = "OR"
        orLabel.textColor = .darkGray
        orLabel.font = .robotoLight(fontSize: smallFont)
        return orLabel
    }()


    lazy var newUserLabel : UILabel = {
        var newUserLabel = UILabel()
        newUserLabel.text = "New user ?"
        newUserLabel.textColor = .darkGray
        newUserLabel.font = .robotoRegular(fontSize: mediumFont)
        return newUserLabel
    }()
    
    lazy var registerLabel : UIButton = {
        var registerButton = UIButton()
        registerButton.frame.size = CGSize(width: 300, height: 50)
        registerButton.setTitle("Register Now", for: .normal)
        registerButton.titleLabel?.font = .robotoRegular(fontSize: smallFont)
        registerButton.setTitleColor(colorGreen, for: .normal)
        
        return registerButton
    }()
    
    lazy var labelStack : UIStackView = {
        var labelStack = UIStackView()
        labelStack.axis = .horizontal
        labelStack.distribution = .fillEqually

        labelStack.addArrangedSubview(newUserLabel)
        labelStack.addArrangedSubview(registerLabel)
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
}
