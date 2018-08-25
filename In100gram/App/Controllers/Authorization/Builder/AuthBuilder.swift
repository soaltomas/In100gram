import Foundation
import UIKit

class AuthBuilder: AbstractAuthBuilder {
    
    func viewController() -> UIViewController {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AuthViewController") as? AuthViewController
        let router = AuthRouter(viewController: viewController!)
        viewController?.router = router
        return viewController!
    }
}
