//
//  carViewCell.swift
//  Lab6
//
//  Created by user228349 on 7/8/24.
//

import UIKit

class carViewCell: UITableViewCell {
    
    @IBOutlet weak var car: UIImageView!
    
    @IBOutlet weak var audi: UILabel!
    
    
    @IBOutlet weak var q8: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
