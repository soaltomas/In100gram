import UIKit
import WebKit

class AuthViewController: UIViewController {
    
    let clientId = "24de0079c65146c3a0bb00cae115b4b0"
    let redirectURI = "https://instagram.com"
    
    weak var delegate: AuthViewControllerDelegate?

    @IBOutlet weak var wkWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard
            let url = URL(string: "https://api.instagram.com/oauth/authorize/?client_id=\(clientId)&redirect_uri=\(redirectURI)&response_type=token")
        else {
            return
        }
        
        
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 15.0)
        wkWebView.navigationDelegate = self
        removeCache()
        wkWebView.load(request)
    }
    
    func removeCache() {
        let dataStore = WKWebsiteDataStore.default()
        dataStore.fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes()) { (records) in
            for record in records {
                dataStore.removeData(ofTypes: record.dataTypes, for: [record], completionHandler: {})
            }
        }
    }
}



extension AuthViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        guard
            let urlString =  navigationAction.request.url?.absoluteString
        else {
            decisionHandler(.allow)
            return
        }
        guard
            urlString.range(of: "#access_token") != nil
        else {
            decisionHandler(.allow)
            return
        }
        
        let accessToken = urlString.components(separatedBy: "#access_token=").last!
        self.delegate?.authViewController(self, authorizedWith: accessToken)
        
        decisionHandler(.cancel)
        
    }
}
