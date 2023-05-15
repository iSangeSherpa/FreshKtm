import UIKit
import SnapKit

// Material component dependencies
import MaterialComponents.MaterialTextControls_OutlinedTextFields



class LoginViewController: UIViewController {
        
    // MARK: Variables
    var frame = CGRect(x: 0, y: 0, width: 300, height: 100)
    
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
    
    lazy var usernameField : MDCOutlinedTextField = {
        var usernameField = MDCOutlinedTextField()
        usernameField.label.text = "Enter email or username"
        usernameField.label.font = .robotoMedium(fontSize: 14)
        usernameField.setNormalLabelColor(UIColor.lightGray, for: .normal)
        usernameField.setFloatingLabelColor(UIColor.gray, for: .editing)
        usernameField.setOutlineColor(UIColor.lightGray, for: .normal)
        usernameField.setOutlineColor(UIColor.gray, for: .editing)
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        usernameField.layer.cornerRadius = 8
        usernameField.sizeToFit()
        return usernameField
    }()
    
    lazy var passwordField : MDCOutlinedTextField = {
        var passwordField = MDCOutlinedTextField()
        passwordField.label.text = "Password"
        passwordField.label.font = .robotoMedium(fontSize: 14)
        passwordField.setNormalLabelColor(UIColor.lightGray, for: .normal)
        passwordField.setFloatingLabelColor(UIColor.gray, for: .editing)
        passwordField.setOutlineColor(UIColor.lightGray, for: .normal)
        passwordField.setOutlineColor(UIColor.gray, for: .editing)
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.layer.cornerRadius = 8
        passwordField.sizeToFit()
        return passwordField
    }()
    
    lazy var loginButton : UIButton = {
        var button = UIButton()
        button.contentEdgeInsets = UIEdgeInsets(top: 15, left: 115, bottom: 15, right: 114)
        button.titleLabel?.font = .robotoMedium(fontSize: 20)
        button.setTitle("Login", for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor(red: 31/255, green: 143/255, blue: 42/255, alpha: 1.0)
        return button
    }()
    
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
            maker.top.equalTo(usernameField.snp.bottom).offset(15)
            maker.width.equalToSuperview()
        }
        loginButton.snp.makeConstraints { maker in
            maker.top.equalTo(passwordField.snp.bottom).offset(30)
            maker.width.equalToSuperview()
        }
        
    }
}
