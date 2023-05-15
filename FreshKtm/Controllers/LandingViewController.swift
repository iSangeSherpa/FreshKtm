import UIKit
import SnapKit

class LandingViewController: UIViewController {
    
    var imageView : UIImageView = {
       var imageView = UIImageView()
        imageView.image = UIImage(named: "LandingPageImage")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var button : UIButton = {
        var button = UIButton()
        button.titleLabel?.font = .robotoMedium(fontSize: 20)
        button.setTitle("Get Started", for: .normal)
        button.addTarget(
            self,
            action: #selector(pushToNextController),
            for: .touchUpInside
        )
        button.layer.cornerRadius = 12
        button.backgroundColor = UIColor(red: 31/255, green: 143/255, blue: 42/255, alpha: 1.0)
        return button
    }()

    
    // MARK: Main Calling Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(button)
        view.addSubview(imageView)
        
        imageView.snp.makeConstraints { maker in
            maker.top.equalToSuperview().offset(100)
            maker.leading.trailing.equalToSuperview()
        }
        
        button.snp.makeConstraints { maker in
            maker.bottom.equalToSuperview().offset(-100)
            maker.top.equalTo(imageView.snp.bottom).offset(40)
            maker.centerX.equalTo(imageView.snp.centerX)
            maker.height.equalTo(60)
            maker.left.equalToSuperview().offset(20)
            maker.right.equalToSuperview().offset(-20)
        }

    }
    
    @objc func pushToNextController() {
        let loginVC = LoginViewController()
        navigationController?.pushViewController(loginVC, animated: true)
    }


}

