

import UIKit



class AccountViewController: UIViewController, UITextFieldDelegate {
    
    var mixer: Mixer!
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var myRatingLabel: UILabel!
    @IBOutlet weak var addRattingButton: UIButton!
    @IBOutlet weak var responseSegmentedControl: UISegmentedControl!
    @IBOutlet weak var rnValueLabel: UILabel!
    @IBOutlet weak var userData: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = "Details"
        nameLabel.text = mixer.name
        locationLabel.text = mixer.location
        thumbnailImageView.image = UIImage(named: mixer.thumbnail)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Current user rating is used to set UI controls and labels
        let currentRating = UserDefaults.standard.integer(forKey: "temp")
        detailLabel.text = String(currentRating)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let addRatingViewController = segue.destination as! ReactModuleViewController
        addRatingViewController.receivedString = userData.text!
    }
}
