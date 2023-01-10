//
//  TableViewCell.swift
//  The Sports App
//
//  Created by Richa Kalani on 10/01/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var teamName: UILabel!
    let networkManager = SportsManagerNetwork()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func loadData() {
        networkManager.getData(completion: {(topLevel) in
            DispatchQueue.main.async {
                self.teamName.text = ("\(topLevel.teams["4"]?.nameFull ?? "") vs \(topLevel.teams["5"]?.nameFull ?? "")")
            }
        })
    }
    
}
