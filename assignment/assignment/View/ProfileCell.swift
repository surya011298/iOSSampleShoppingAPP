//
//  ProfileCell.swift
//  assignment
//
//  Created by Surya Koneru on 11/03/23.
//

import UIKit

class ProfileCell: UITableViewCell {

    @IBOutlet weak var pointsEarnedLabel: UILabel!
    @IBOutlet weak var walletBalanceLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var dobTF: UITextField!
    @IBOutlet weak var addressTF: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
