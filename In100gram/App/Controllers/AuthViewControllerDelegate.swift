import Foundation
import UIKit

protocol AuthViewControllerDelegate: class {
    func authViewController(_ viewController: UIViewController, authorizedWith token:String?)
}
