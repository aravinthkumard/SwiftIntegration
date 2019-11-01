

import Foundation
import React

@objc(ReactViewManager)
class ReactViewManager: RCTEventEmitter {
    
    override func supportedEvents() -> [String]! {
        return ["AddRatingManagerEvent"]
    }
    
    // Dismiss view controller
    @objc func dismissPresentedViewController(_ reactTag: NSNumber) {
        DispatchQueue.main.async {
            if let view = self.bridge.uiManager.view(forReactTag: reactTag) {
                let presentedViewController: UIViewController! = view.reactViewController()
                presentedViewController.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    // Save rating and dismiss the view controller
    @objc func save(_ reactTag: NSNumber, input: String) -> Void {
        // Save rating
        UserDefaults.standard.set(input, forKey: "temp")
        dismissPresentedViewController(reactTag)
        // Send an event back to React Native
    }
}
