import  UIKit

class SplashViewController: UIViewController {
    private let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(activityIndicator)
        activityIndicator.frame = view.bounds
        activityIndicator.backgroundColor = UIColor(white: 0, alpha: 0.4)
        makeServiceCall()
    }
    
    private func makeServiceCall() {
        activityIndicator.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(1)) {
            self.activityIndicator.stopAnimating()
            
            if UserSettings.currentUser != nil {
                SceneDelegate.shared.rootViewController.switchToMountainPassListScreen()
            } else {
                SceneDelegate.shared.rootViewController.switchToShowWelcomeScreen()
            }
        }
    }
}
