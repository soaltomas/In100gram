import Foundation
import UIKit

class AuthRouter: AbstractAuthRouter {
    
    weak var viewController: UIViewController?
    
    func navigateAuthSuccess() {
        let mainViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainViewController")
        viewController?.present(mainViewController, animated: true, completion: nil)
    }
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}
