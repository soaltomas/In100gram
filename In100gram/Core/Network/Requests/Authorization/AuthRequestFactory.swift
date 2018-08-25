import Foundation
import Alamofire

class AuthRequestFactory: RequestFactory {
    
    @discardableResult
    func getCurrentUser(completion: @escaping (DataResponse<LoginResponse>) -> Void) -> DataRequest {
        
        let credentials: Parameters = ["access_token" : Credential.accessToken ?? ""]
        
        return self.sessionManager.request(RequestRouter.getCurrentUser(parameters: credentials)).responseCodable(                                                                                                             completion: completion)
    }
    
    @discardableResult
    func getCurrentUserMedia(completion: @escaping (DataResponse<LoginResponse>) -> Void) -> DataRequest {
        
        let credentials: Parameters = ["access_token" : Credential.accessToken ?? ""]
        
        return self.sessionManager.request(RequestRouter.getCurrentUserMedia(parameters: credentials)).responseCodable(                                                                                                             completion: completion)
    }

}
