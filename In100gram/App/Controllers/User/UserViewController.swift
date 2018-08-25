import UIKit

class UserViewController: UIViewController {
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    private let factory = AuthRequestFactory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameLabel.text = "Loading..."
        
        factory.getCurrentUser() { [weak self] response in
            let user = response.value?.data
            self?.userNameLabel.text = user?.name
        }
    }
}

