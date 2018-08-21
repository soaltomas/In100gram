import Foundation
import Locksmith

class Credential {
    static let accessTokenKey = "accessTokenKey"
    
    static var isUserAuthenticated: Bool {
        return accessToken != nil
    }
    
    static var accessToken: String? {
       /* get {
            print("---It's here: \(Locksmith.loadDataForUserAccount(userAccount: "In100gramAccessToken")?["accessToken"] as? String)")
            guard
                let token = Locksmith.loadDataForUserAccount(userAccount: "In100gramAccessToken")?["accessToken"] as? String
            else {
                return nil
            }
            return token
        }
        
        set {
            do {
                try Locksmith.saveData(data: ["accessToken" : accessToken ?? ""], forUserAccount: "In100gramAccessToken")
            } catch {
                print("Unable to save data.")
            }
        }*/
        
        get {
            return UserDefaults.standard.value(forKey: accessTokenKey) as? String
        }
        set {
            UserDefaults.standard.set(newValue, forKey: accessTokenKey)
        }
    }
}
