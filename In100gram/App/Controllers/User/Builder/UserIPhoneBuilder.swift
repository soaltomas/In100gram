import Foundation
import UIKit

class UserIPhoneBuilder: AbstractUserBuilder {
    
    func viewController() -> UIViewController {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UserViewController") as? UserViewController
        return viewController!
    }
}
