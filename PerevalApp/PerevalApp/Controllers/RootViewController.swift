import UIKit

class RootViewController: UIViewController {
    
    private var currentVC: UIViewController
    
    init() {
        self.currentVC = SplashViewController()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChild(currentVC)
        currentVC.view.frame = view.bounds
        view.addSubview(currentVC.view)
        currentVC.didMove(toParent: self)
    }
    
    func switchToMountainPassListScreen() {
        let mountainPassListVC = MountainPassListVC()
        let mountainPassListScreen = UINavigationController(rootViewController: mountainPassListVC)
        animateFadeTransition(to: mountainPassListScreen)
    }
    
    func showWelcomeScreen() {
        let welcomeScreen = UINavigationController(rootViewController: WelcomeVC())
        
        addChild(welcomeScreen)
        welcomeScreen.view.frame = view.bounds
        view.addSubview(welcomeScreen.view)
        welcomeScreen.didMove(toParent: self)
        
        currentVC.willMove(toParent: nil)
        currentVC.view.removeFromSuperview()
        currentVC.removeFromParent()
        currentVC = welcomeScreen
    }
    
    private func animateFadeTransition(to new: UIViewController, completion: (() -> Void)? = nil) {
        currentVC.willMove(toParent: nil)
        addChild(new)
        transition(from: currentVC, to: new, duration: 0.5, options: [.transitionCrossDissolve, .curveEaseOut], animations: {
        }) { completed in
            self.currentVC.removeFromParent()
            new.didMove(toParent: self)
            self.currentVC = new
            completion?()
        }
    }
}
