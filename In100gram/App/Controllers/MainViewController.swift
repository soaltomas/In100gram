import UIKit

class MainViewController: UIViewController {

    struct API {
        static let host = "https://api.instagram.com/v1"
        static let token = "?access_token="
        
        static func URLFor(apiMethod: String, token: String)-> String {
            return self.host + apiMethod + self.token + token
        }
    }
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel.text = "Loading..."
        getUser()
        
    }
    
    func getUser() {
        guard let token = Credential.accessToken else {
            return
        }
        
        APIManager.shared.load(API.URLFor(apiMethod: "/users/self", token: token), {[weak self] (result) in
            guard
                let result = (result as? [String: Any])?["data"] as? [String: Any]
            else {
                DispatchQueue.main.async {
                    self?.userNameLabel.text = "error"
                }
                return
            }
            
            guard
                let idString = result["id"] as? String,
                let id = UInt(idString),
                let name = result["username"] as? String,
                let avatarURL = result["profile_picture"] as? String,
                let fullName = result["full_name"] as? String
            else {
                return
            }
            
            let user = User(id: id, name: name, avatarURL: avatarURL, fullName: fullName)
            DispatchQueue.main.async {
                self?.userNameLabel.text = user.name
            }
        })
    }
}

