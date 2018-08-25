import Foundation
import Alamofire

class RequestFactory: AbstractRequestFactory {
    let sessionManager: SessionManager
    let queue: DispatchQueue
    
    init(sessionManager: SessionManager = SessionManagerFactory.sessionManager,
         queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.sessionManager = sessionManager
        self.queue = queue
    }
}
