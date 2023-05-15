import UIKit
import SnapKit

class LandingViewController: UIViewController {
    
    var imageView : UIImageView = {
       var imageView = UIImageView()
        imageView.image = UIImage(systemName: "questionmark")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var button : UIButton = {
        var button = UIButton()
        button.titleLabel?.font = UIFont(name: "Poppins", size: 20)
        button.setTitle("get started", for: .normal)
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
        
        button.snp.makeConstraints { maker in
            maker.center.equalToSuperview()
        }

    }
    
    @objc func pushToNextController() {
        let loginVC = LoginViewController()
        navigationController?.pushViewController(loginVC, animated: true)
    }


}

