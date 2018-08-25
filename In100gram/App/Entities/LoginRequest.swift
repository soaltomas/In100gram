import Foundation

struct LoginRequest: RequestModel {
    let parameters: [String : Any]
    
    init(accessToken: String) {
        parameters = ["access_token" : accessToken]
    }
}
