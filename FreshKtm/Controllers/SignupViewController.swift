import UIKit
import SnapKit

// Material component dependencies
import MaterialComponents.MaterialTextControls_OutlinedTextFields


class SignupViewController: UIViewController {
    
    // MARK: Variables
    var smallFont : CGFloat = 15
    var colorLight : UIColor = {
        return UIColor(red: 95/255, green: 95/255, blue: 95/255, alpha: 1)
    }()
    var colorGreen : UIColor = {
        return UIColor(red: 31/255, green: 143/255, blue: 42/255, alpha: 1.0)
    }()
    
    
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
//        imageStack.backgroundColor = .red
        imageStack.addArrangedSubview(facebookLogo)
        imageStack.addArrangedSubview(googleLogo)
        return imageStack
    }()
    
    
    //  MARK: Fields
    lazy var usernameField : MDCOutlinedTextField = {
        var usernameField = MDCOutlinedTextField()
        usernameField.label.text = "Enter username"
        usernameField.label.font = .robotoMedium(fontSize: smallFont)
        usernameField.layer.cornerRadius = 8
        
        usernameField.setNormalLabelColor(UIColor.lightGray, for: .normal)
        usernameField.setFloatingLabelColor(UIColor.gray, for: .editing)
        usernameField.setOutlineColor(UIColor.lightGray, for: .normal)
        usernameField.setOutlineColor(UIColor.gray, for: .editing)
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        return usernameField
    }()
    
    lazy var emailField : MDCOutlinedTextField = {
        var emailField = MDCOutlinedTextField()
        emailField.label.text = "Enter email"
        emailField.label.font = .robotoMedium(fontSize: smallFont)
        emailField.layer.cornerRadius = 8
        
        emailField.setNormalLabelColor(UIColor.lightGray, for: .normal)
        emailField.setFloatingLabelColor(UIColor.gray, for: .editing)
        emailField.setOutlineColor(UIColor.lightGray, for: .normal)
        emailField.setOutlineColor(UIColor.gray, for: .editing)
        emailField.translatesAutoresizingMaskIntoConstraints = false
        return emailField
    }()
    
    lazy var passwordField : MDCOutlinedTextField = {
        var emailField = MDCOutlinedTextField()
        emailField.label.text = "Enter password"
        emailField.label.font = .robotoMedium(fontSize: smallFont)
        emailField.layer.cornerRadius = 8
        
        emailField.setNormalLabelColor(UIColor.lightGray, for: .normal)
        emailField.setFloatingLabelColor(UIColor.gray, for: .editing)
        emailField.setOutlineColor(UIColor.lightGray, for: .normal)
        emailField.setOutlineColor(UIColor.gray, for: .editing)
        emailField.translatesAutoresizingMaskIntoConstraints = false
        return emailField
    }()
    
    lazy var confirmPasswordField : MDCOutlinedTextField = {
        var passwordField = MDCOutlinedTextField()
        passwordField.label.text = "Confirm Password"
        passwordField.label.font = .robotoMedium(fontSize: smallFont)
        passwordField.setNormalLabelColor(UIColor.lightGray, for: .normal)
        passwordField.setFloatingLabelColor(UIColor.gray, for: .editing)
        passwordField.setOutlineColor(UIColor.lightGray, for: .normal)
        passwordField.setOutlineColor(UIColor.gray, for: .editing)
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.layer.cornerRadius = 8
        passwordField.sizeToFit()
        return passwordField
    }()
    
    lazy var signUpButton : UIButton = {
        var signUpButton = UIButton()
        signUpButton.contentEdgeInsets = UIEdgeInsets(top: 15, left: 115, bottom: 15, right: 114)
        signUpButton.titleLabel?.font = .robotoMedium(fontSize: 20)
        signUpButton.titleLabel?.numberOfLines = 1
        signUpButton.setTitle("Sign up", for: .normal)
        signUpButton.layer.cornerRadius = 8
        signUpButton.backgroundColor = colorGreen
        return signUpButton
    }()
    
    
    //  MARK: Labels
    lazy var registerWithPhone : UIButton = {
       var registerWithPhone = UIButton()
        registerWithPhone.setTitle("Register with Phone Number", for: .normal)
        registerWithPhone.setTitleColor(.gray, for: .normal)
        registerWithPhone.titleLabel?.font = .robotoMedium(fontSize: 14)
        registerWithPhone.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        registerWithPhone.addTarget(self, action: #selector(pushToNextController), for: .touchUpInside)
        return registerWithPhone
    }()
    
    lazy var orLabel : UILabel = {
       var orLabel = UILabel()
        orLabel.text = "OR"
        orLabel.textColor = .darkGray
        orLabel.font = .robotoLight(fontSize: 15)
        return orLabel
    }()
    
    lazy var membershipLabel : UIButton = {
        var button = UIButton()
         button.setTitle("Get a membership", for: .normal)
         button.titleLabel?.font = .robotoRegular(fontSize: 14)
         button.setTitleColor(colorGreen, for: .normal)
         button.backgroundColor = .none
         button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
         return button
    }()
    

    // MARK: Containers
    lazy var containerView : UIView = {
       var containerView = UIView()
        return containerView
    }()
    
    lazy var scrollView : UIScrollView = {
       var scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        scrollView.backgroundColor = .brown
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
        containerView.addSubview(registerWithPhone)
        containerView.addSubview(orLabel)
        containerView.addSubview(imageStack)
        containerView.addSubview(membershipLabel)
        
        
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
            maker.right.equalToSuperview().offset(-20)
            maker.width.equalTo(250)
            maker.bottom.equalToSuperview().offset(-20)
        }
        containerView.snp.makeConstraints { maker in
            maker.left.top.right.bottom.equalToSuperview()
            maker.width.equalToSuperview()
            maker.height.equalTo(700)
        }
        
        
        // MARK: Constraints for input fields
        usernameField.snp.makeConstraints { maker in
            maker.top.equalToSuperview().offset(50)
            maker.width.equalToSuperview()
        }
        emailField.snp.makeConstraints { maker in
            maker.top.equalTo(usernameField.snp.bottom).offset(15)
            maker.width.equalToSuperview()
        }
        passwordField.snp.makeConstraints { maker in
            maker.top.equalTo(emailField.snp.bottom).offset(15)
            maker.width.equalToSuperview()
        }
        confirmPasswordField.snp.makeConstraints { maker in
            maker.top.equalTo(passwordField.snp.bottom).offset(15)
            maker.width.equalToSuperview()
        }
        signUpButton.snp.makeConstraints { maker in
            maker.top.equalTo(confirmPasswordField.snp.bottom).offset(30)
            maker.height.equalTo(44)
            maker.width.equalToSuperview()
        }
        
        
        // MARK: Constraints for bottom labels
        registerWithPhone.snp.makeConstraints { maker in
            maker.top.equalTo(signUpButton.snp.bottom).offset(20)
            maker.centerX.equalToSuperview()
        }
        orLabel.snp.makeConstraints { maker in
            maker.top.equalTo(registerWithPhone.snp.bottom).offset(20)
            maker.centerX.equalToSuperview()
        }
        imageStack.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.width.equalTo(view.frame.width/2.5)
            maker.height.equalTo(view.frame.width/4)
            maker.top.equalTo(orLabel.snp.bottom).offset(10)
        }
        membershipLabel.snp.makeConstraints { maker in
            maker.top.equalTo(imageStack.snp.bottom).offset(30)
            maker.centerX.equalToSuperview()
        }
        
    }

    
    @objc func pushToNextController() {
        navigationController?.pushViewController(VerificationViewController(), animated: true)
    }
    
}
