

import UIKit
import React

class ReactModuleViewController: UIViewController {
    
    var mixer: Mixer!
    var addRatingView: RCTRootView!
    var receivedString = ""
    
    @IBOutlet weak var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        addRatingView = ReactModule.sharedInstance.viewForModule(
            "RNApp",
            initialProperties: ["transferAmount": receivedString])
        
        
        self.view.addSubview(addRatingView)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        addRatingView.frame = self.view.bounds
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
