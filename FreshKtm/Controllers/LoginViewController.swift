import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    // MARK: Variables
    var logoImageView : UIImageView = {
       var imageView = UIImageView()
        imageView.image = UIImage(named: "Logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var scrollView : UIScrollView = {
       var scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        
        scrollView.layer.cornerRadius = 8
        scrollView.layer.shadowColor = UIColor.black.cgColor
        scrollView.layer.shadowOffset = CGSize(width: 0, height: 2)
        scrollView.layer.shadowRadius = 2
        scrollView.layer.shadowOpacity = 0.5
        return scrollView
    }()
    
    var backgroundImageView : UIImageView = {
       var imageView = UIImageView()
        imageView.image = UIImage(named: "BackgroundImage")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .green
        
        view.addSubview(logoImageView)
        view.addSubview(backgroundImageView)
        view.addSubview(scrollView)
        
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
        scrollView.snp.makeConstraints { maker in
            maker.centerX.centerY.equalToSuperview()
            maker.leading.equalToSuperview().offset(20)
            maker.trailing.equalToSuperview().offset(-20)
            maker.top.equalTo(view.safeAreaLayoutGuide).offset(130)
            maker.bottom.equalTo(view.safeAreaLayoutGuide).offset(-80)
        }
    }
}
