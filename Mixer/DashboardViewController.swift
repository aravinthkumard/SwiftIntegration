

import UIKit

class DashboardViewController: UITableViewController {
    
    var mixers = [Mixer]()
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mixers = Mixer.loadAllMixers()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mixers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MixerCell", for: indexPath) as! MixerCell
        let mixer = mixers[(indexPath as NSIndexPath).row] as Mixer
        cell.mixer = mixer
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedCell = sender as? UITableViewCell, let selectedRowIndex = (tableView.indexPath(for: selectedCell) as NSIndexPath?)?.row
            , segue.identifier == "showMixerDetailsSegue" else {
                fatalError("sender is not a UITableViewCell or was not found in the tableView, or segue.identifier is incorrect")
        }
        
        let mixer = mixers[selectedRowIndex]
        let detailViewController = segue.destination as! AccountViewController
        detailViewController.mixer = mixer
    }
    
}
