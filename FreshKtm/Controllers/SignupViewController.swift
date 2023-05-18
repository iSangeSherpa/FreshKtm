import UIKit
import SnapKit

// Material component dependencies
import MaterialComponents.MaterialTextControls_OutlinedTextFields


class SignupViewController: UIViewController {
    
    // MARK: Variables
    var textFieldSpacing = 20
    
    //  MARK: Images
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
    
    
    //  MARK: Fields
    @FormMaterialTextField(placeholder: "Enter username") var usernameField : MaterialComponents.MDCOutlinedTextField
    @FormMaterialTextField(placeholder: "Enter email") var emailField : MaterialComponents.MDCOutlinedTextField
    @FormMaterialTextField(placeholder: "Enter password") var passwordField : MaterialComponents.MDCOutlinedTextField
    @FormMaterialTextField(placeholder: "Confirm Password") var confirmPasswordField : MaterialComponents.MDCOutlinedTextField
    
    let signUpButton : UIButton = primaryButton(titleLabel: "Sign Up")
    let membershipButton : UIButton = secondaryButton(titleLabel: "Get a membership", font: UIFont.robotoRegular(fontSize: 14))
    let registerWithPhoneButton : UIButton = secondaryButton(titleLabel: "Register with Phone Number", titleColor: .gray)
    
    //  MARK: Labels
    let orLabel : UILabel = customLabel(title: "OR", size: 15, textColor: .darkGray)

    // MARK: Containers
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
       var scrollViewContainer = UIView()
        scrollViewContainer.backgroundColor = .white
        scrollViewContainer.layer.cornerRadius = 8
        // Shadow properties
        scrollViewContainer.layer.shadowColor = UIColor.black.cgColor
        scrollViewContainer.layer.shadowOffset = .zero
        scrollViewContainer.layer.shadowRadius = 5
        scrollViewContainer.layer.shadowOpacity = 0.1
        
        scrollViewContainer.addSubview(scrollView)
        return scrollViewContainer
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
        
        // ScrollView ChildViews
        containerView.addSubview(usernameField)
        containerView.addSubview(emailField)
        containerView.addSubview(passwordField)
        containerView.addSubview(confirmPasswordField)
        containerView.addSubview(signUpButton)
        containerView.addSubview(registerWithPhoneButton)
        containerView.addSubview(orLabel)
        containerView.addSubview(imageStack)
        containerView.addSubview(membershipButton)
        
        registerWithPhoneButton.addTarget(self, action: #selector(pushToNextController), for: .touchUpInside)
        
        // MARK: Image Constraints
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
            maker.height.equalTo(600)
        }
        
        
        // MARK: Constraints for input fields
        usernameField.snp.makeConstraints { maker in
            maker.top.equalToSuperview().offset(30)
            maker.left.equalToSuperview().offset(1)
            maker.right.equalToSuperview().offset(-1)
        }
        emailField.snp.makeConstraints { maker in
            maker.top.equalTo(usernameField.snp.bottom).offset(textFieldSpacing)
            maker.left.equalToSuperview().offset(1)
            maker.right.equalToSuperview().offset(-1)
        }
        passwordField.snp.makeConstraints { maker in
            maker.top.equalTo(emailField.snp.bottom).offset(textFieldSpacing)
            maker.left.equalToSuperview().offset(1)
            maker.right.equalToSuperview().offset(-1)
        }
        confirmPasswordField.snp.makeConstraints { maker in
            maker.top.equalTo(passwordField.snp.bottom).offset(textFieldSpacing)
            maker.left.equalToSuperview().offset(1)
            maker.right.equalToSuperview().offset(-1)
        }
        signUpButton.snp.makeConstraints { maker in
            maker.top.equalTo(confirmPasswordField.snp.bottom).offset(30)
            maker.height.equalTo(44)
            maker.left.equalToSuperview().offset(1)
            maker.right.equalToSuperview().offset(-1)
        }
        
        
        // MARK: Constraints for bottom labels
        registerWithPhoneButton.snp.makeConstraints { maker in
            maker.top.equalTo(signUpButton.snp.bottom).offset(20)
            maker.centerX.equalToSuperview()
        }
        orLabel.snp.makeConstraints { maker in
            maker.top.equalTo(registerWithPhoneButton.snp.bottom).offset(20)
            maker.centerX.equalToSuperview()
        }
        imageStack.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.width.equalTo(view.frame.width/2.5)
            maker.height.equalTo(view.frame.width/4)
            maker.top.equalTo(orLabel.snp.bottom).offset(10)
        }
        membershipButton.snp.makeConstraints { maker in
            maker.top.equalTo(imageStack.snp.bottom).offset(30)
            maker.centerX.equalToSuperview()
        }
    }

    
    @objc func pushToNextController() {
        navigationController?.pushViewController(VerificationViewController(), animated: true)
    }
    
}
