

import Foundation
import React

class ReactModule: NSObject {
    var bridge: RCTBridge?
    static let sharedInstance = ReactModule()
    
    
    func createBridgeIfNeeded() -> RCTBridge {
        if bridge == nil {
            bridge = RCTBridge.init(delegate: self, launchOptions: nil)
        }
        return bridge!
    }
    
    func viewForModule(_ moduleName: String, initialProperties: [String : Any]?) -> RCTRootView {
        let viewBridge = createBridgeIfNeeded()
        let rootView: RCTRootView = RCTRootView(
            bridge: viewBridge,
            moduleName: moduleName,
            initialProperties: initialProperties)
        return rootView
    }
}
extension ReactModule: RCTBridgeDelegate {
    func sourceURL(for bridge: RCTBridge!) -> URL! {
        // Return URL below during development
        return URL(string: "http://localhost:8081/index.ios.bundle?platform=ios")
        
        // Return bundle below if using a pre-bundled file on disk
        //return Bundle.main.url(forResource: "main", withExtension: "jsbundle")
    }
}
