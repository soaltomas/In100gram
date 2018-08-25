import Foundation
import UIKit

class UserBuilderFactory {
    static func getBuilderForDevice(device: UIUserInterfaceIdiom) -> AbstractUserBuilder {
        switch device {
        case .pad:
            return UserIPadBuilder()
        default:
            return UserIPhoneBuilder()
        }
    }
}
