//
//  AddfriendTableViewCell.swift
//  Lab6
//
//  Created by user228349 on 7/8/24.
//

import UIKit

class AddfriendTableViewCell: UITableViewCell {
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    
    func configure(with friend: Friend) {
        firstNameLabel.text = friend.firstName
        emailLabel.text = friend.email
        phoneNumberLabel.text = friend.phoneNumber
        // Set images based on friend's characteristics
        image1.image = UIImage(named: "image1")
        image2.image = UIImage(named: "image2")
        image3.image = UIImage(named: "image3")
    }
}
        
    

  
