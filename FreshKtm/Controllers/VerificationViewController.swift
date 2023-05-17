import UIKit
import SnapKit

// Material component dependencies
import MaterialComponents.MaterialTextControls_OutlinedTextFields

class VerificationViewController: UIViewController {
    
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
    
    lazy var phoneLabel : UILabel = {
       var phoneLabel = UILabel()
        phoneLabel.text = "Enter your Phone Number"
        phoneLabel.textColor = colorGreen
        phoneLabel.font = .robotoMedium(fontSize: mediumFont)
        return phoneLabel
    }()
    
    lazy var helperLabel : UILabel = {
       var helperLabel = UILabel()
        helperLabel.text = "We will send you a 6-digit verification code"
        helperLabel.textColor = .gray
        helperLabel.font = .robotoRegular(fontSize: smallFont)
        return helperLabel
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
    @FormMaterialTextField(placeholder: "977") var phonePrefix : MaterialComponents.MDCOutlinedTextField
    @FormMaterialTextField(placeholder: "Phone Number") var phoneField : MaterialComponents.MDCOutlinedTextField
    
    lazy var fieldStack : UIStackView = {
        var stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 5
        stack.alignment = .fill
        stack.distribution = .fill
        
        stack.addArrangedSubview(phonePrefix)
        stack.addArrangedSubview(phoneField)
        return stack
    }()
    
    lazy var noCodeLabel : UILabel = {
        var noCodeLabel = UILabel()
        noCodeLabel.text = "Didn't get the code ?"
        noCodeLabel.textColor = .gray
        noCodeLabel.font = .robotoRegular(fontSize: smallFont)
        return noCodeLabel
    }()
    
    lazy var generateOtpButton : UIButton = {
        var generateOtpButton = UIButton()
        generateOtpButton.titleLabel?.font = .robotoMedium(fontSize: largeFont)
        generateOtpButton.setTitle("Generate OTP", for: .normal)
        generateOtpButton.layer.cornerRadius = 8
        generateOtpButton.backgroundColor = colorGreen
        
        generateOtpButton.addTarget(self, action: #selector(pushToNextController), for: .touchUpInside)
        return generateOtpButton
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
        registerButton.titleLabel?.font = .robotoRegular(fontSize: mediumFont)
        registerButton.setTitleColor(colorGreen, for: .normal)
        
//        registerButton.addTarget(self, action: #selector(pushToNextController), for: .touchUpInside)
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
        phonePrefix.isUserInteractionEnabled = false
        
        view.addSubview(logoImageView)
        view.addSubview(backgroundImageView)
        view.addSubview(scrollViewContainer)
        
        // MARK: ScrollView ChildViews
        containerView.addSubview(phoneLabel)
        containerView.addSubview(helperLabel)
        containerView.addSubview(fieldStack)
        containerView.addSubview(noCodeLabel)
        containerView.addSubview(generateOtpButton)
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
        phoneLabel.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalToSuperview().offset(textFieldSpacingMedium)
        }
        helperLabel.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(phoneLabel.snp.bottom).offset(textFieldSpacingMedium)
        }
        fieldStack.snp.makeConstraints { maker in
            maker.left.equalToSuperview().offset(1)
            maker.right.equalToSuperview().offset(-1)
            maker.top.equalTo(helperLabel.snp.bottom).offset(textFieldSpacingMedium)
            maker.width.equalToSuperview()
        }
        phonePrefix.snp.makeConstraints { maker in
            maker.width.equalTo(50)
        }
        noCodeLabel.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(phoneField.snp.bottom).offset(40)
        }
        generateOtpButton.snp.makeConstraints { maker in
            maker.top.equalTo(noCodeLabel.snp.bottom).offset(textFieldSpacingSmall)
            maker.height.equalTo(44)
            maker.width.equalToSuperview()
        }
        orLabel.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(generateOtpButton.snp.bottom).offset(textFieldSpacingMedium)
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
    
    
    @objc func pushToNextController() {
        navigationController?.pushViewController(OtpVerificationViewController(), animated: true)
    }
}
