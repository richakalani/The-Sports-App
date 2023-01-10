//
//  TableViewCell.swift
//  The Sports App
//
//  Created by Richa Kalani on 10/01/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var venue: UILabel!
    @IBOutlet weak var dateTime: UILabel!
    let networkManager = SportsManagerNetwork()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func loadData() {
        networkManager.getData(completion: {(topLevel) in
            
            DispatchQueue.main.async {
                self.teamName.text = ("\(topLevel.teams["4"]?.nameFull ?? "") vs \(topLevel.teams["5"]?.nameFull ?? "")")
                self.venue.text = topLevel.matchdetail.venue.name
                self.dateTime.text = ("\(topLevel.matchdetail.match.date)  \(topLevel.matchdetail.match.time)")
            }
        })
    }
    
    
    @IBAction func moreDetails(_ sender: Any) {
        
    }
    
}
