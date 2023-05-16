import UIKit
import SnapKit

// Material component dependencies
import MaterialComponents.MaterialTextControls_OutlinedTextFields



class LoginViewController: UIViewController {
        
    // MARK: Variables
    var textFieldSpacing = 20
    var smallFont : CGFloat = 14
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
    
    // Fields
    
//    @FormMaterialTextField(placeholder: "Enter email or username") var usernameField : MaterialComponents.MDCOutlinedTextField
    lazy var usernameField : MDCOutlinedTextField = {

        var usernameField = MDCOutlinedTextField()
        usernameField.label.text = "Enter email or username"
        usernameField.label.font = .robotoMedium(fontSize: smallFont)
        usernameField.layer.cornerRadius = 8
        
        usernameField.preferredContainerHeight = 44
        usernameField.verticalDensity = 1
        
        usernameField.setNormalLabelColor(UIColor.lightGray, for: .normal)
        usernameField.setFloatingLabelColor(UIColor.gray, for: .editing)
        usernameField.setOutlineColor(UIColor.lightGray, for: .normal)
        usernameField.setOutlineColor(UIColor.gray, for: .editing)
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        return usernameField
    }()
    
    lazy var passwordField : MDCOutlinedTextField = {
        var passwordField = MDCOutlinedTextField()
        passwordField.label.text = "Password"
        passwordField.label.font = .robotoRegular(fontSize: smallFont)
        passwordField.layer.cornerRadius = 8
        
        passwordField.preferredContainerHeight = 44
        passwordField.verticalDensity = 1
        
        passwordField.setNormalLabelColor(UIColor.lightGray, for: .normal)
        passwordField.setFloatingLabelColor(UIColor.gray, for: .editing)
        passwordField.setOutlineColor(UIColor.lightGray, for: .normal)
        passwordField.setOutlineColor(UIColor.gray, for: .editing)
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        return passwordField
    }()
    
    lazy var loginButton : UIButton = {
        var loginButton = UIButton()
        loginButton.contentEdgeInsets = UIEdgeInsets(top: 15, left: 115, bottom: 15, right: 114)
        loginButton.titleLabel?.font = .robotoMedium(fontSize: 20)
        loginButton.setTitle("Login", for: .normal)
        loginButton.layer.cornerRadius = 8
        loginButton.backgroundColor = colorGreen
        return loginButton
    }()
    
    
    //  Labels
    
    lazy var forgotPasswordLabel : UILabel = {
       var label = UILabel()
        label.text = "Forgot Password / Username ?"
        label.textColor = colorLight
        label.font = .robotoRegular(fontSize: 15)
        return label
    }()
    
    lazy var noAccountLabel : UILabel = {
       var label = UILabel()
        label.text = "Don't have an account ?"
        label.textColor = colorLight
        label.font = .robotoRegular(fontSize: 15)
        return label
    }()
    
    lazy var signUpButton : UIButton = {
       var button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.titleLabel?.font = .robotoMedium(fontSize: 15)
        button.setTitleColor(colorGreen, for: .normal)
        button.backgroundColor = .none
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        button.addTarget(
            self,
            action: #selector(pushToNextController),
            for: .touchUpInside
        )
        return button
    }()
    
    lazy var signUpStack : UIStackView = {
       var stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 5
        stack.addArrangedSubview(noAccountLabel)
        stack.addArrangedSubview(signUpButton)
        return stack
    }()
    
    
    // Containers
    
    lazy var containerView : UIView = {
       var containerView = UIView()
        return containerView
    }()
    
    lazy var scrollView : UIScrollView = {
       var scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = true
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
        
        // ScrollView ChildViews
        containerView.addSubview(usernameField)
        containerView.addSubview(passwordField)
        containerView.addSubview(loginButton)
        containerView.addSubview(forgotPasswordLabel)
        containerView.addSubview(noAccountLabel)
        containerView.addSubview(signUpStack)
        
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
        
        // Constraints for containers
        scrollViewContainer.snp.makeConstraints { maker in
            maker.centerX.centerY.equalToSuperview()
            maker.leading.equalToSuperview().offset(20)
            maker.trailing.equalToSuperview().offset(-20)
            maker.top.equalTo(view.safeAreaLayoutGuide).offset(110)
            maker.bottom.equalTo(view.safeAreaLayoutGuide).offset(-80)
        }
        scrollView.snp.makeConstraints { maker in
            maker.top.equalToSuperview()
            maker.left.equalToSuperview().offset(20)
            maker.right.equalToSuperview().offset(-20)
            maker.width.equalTo(250)
            maker.bottom.equalToSuperview()
        }
        
        containerView.snp.makeConstraints { maker in
            maker.left.top.right.bottom.equalToSuperview()
            maker.width.equalToSuperview()
            maker.height.equalToSuperview()
        }
        
        // Constraints for input fields
        usernameField.snp.makeConstraints { maker in
            maker.top.equalToSuperview().offset(50)
            maker.width.equalToSuperview()
        }
        passwordField.snp.makeConstraints { maker in
            maker.top.equalTo(usernameField.snp.bottom).offset(textFieldSpacing)
            maker.width.equalToSuperview()
        }
        loginButton.snp.makeConstraints { maker in
            maker.top.equalTo(passwordField.snp.bottom).offset(30)
            maker.height.equalTo(44)
            maker.width.equalToSuperview()
        }
        
        
        // Constraints for bottom labels
        forgotPasswordLabel.snp.makeConstraints { maker in
            maker.top.equalTo(loginButton.snp.bottom).offset(50)
            maker.centerX.equalToSuperview()
        }
        signUpStack.snp.makeConstraints { maker in
            maker.top.equalTo(forgotPasswordLabel.snp.bottom).offset(15)
            maker.centerX.equalToSuperview()
        }
        
        
    }
    
    @objc func pushToNextController() {
        navigationController?.pushViewController(SignupViewController(), animated: true)
    }
}
