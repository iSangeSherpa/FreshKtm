import UIKit
import SnapKit

// Material component dependencies
import MaterialComponents.MaterialTextControls_OutlinedTextFields

class VerificationViewController: UIViewController {
    
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
    @FormMaterialTextField(placeholder: "977") var phonePrefix : MaterialComponents.MDCOutlinedTextField
    @FormMaterialTextField(placeholder: "Phone Number", keyboardType: .numberPad) var phoneField : MaterialComponents.MDCOutlinedTextField
    
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
    
    // Buttons
    let generateOtpButton : UIButton = primaryButton(titleLabel: "Generate OTP")
    let registerButton : UIButton = secondaryButton(titleLabel: "Register Now", font: UIFont.robotoRegular(fontSize: 14))
    
    // Labels
    let phoneLabel : UILabel = customLabel(title: "Enter your Phone Number", size: 16, font: UIFont.robotoMedium(fontSize: 16),textColor: UIColor(fromHex: "#1F8F2A"))
    let helperLabel : UILabel = customLabel(title: "We will send you a 6-digit verification code", size: 14, textColor: .gray)
    let noCodeLabel : UILabel = customLabel(title: "Didn't get the code ?", size: 14, textColor: .gray)
    let orLabel : UILabel = customLabel(title: "OR", size: 14, textColor: .darkGray)
    let newUserLabel : UILabel = customLabel(title: "New user ?", size: 16, textColor: .darkGray)

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
        
        // MARK: ScrollView ChildViews
        containerView.addSubview(phoneLabel)
        containerView.addSubview(helperLabel)
        containerView.addSubview(fieldStack)
        containerView.addSubview(noCodeLabel)
        containerView.addSubview(generateOtpButton)
        containerView.addSubview(orLabel)
        containerView.addSubview(imageStack)
        containerView.addSubview(labelStack)
        
        generateOtpButton.addTarget(self, action: #selector(pushToNextController), for: .touchUpInside)
        
        phonePrefix.isUserInteractionEnabled = false
        
        
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
