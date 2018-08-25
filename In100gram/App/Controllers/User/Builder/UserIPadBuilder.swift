import Foundation
import UIKit

class UserIPadBuilder: AbstractUserBuilder {
    
    func viewController() -> UIViewController {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UserViewControllerIPad") as? UserViewControllerIPad
        return viewController!
    }
}
