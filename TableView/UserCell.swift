//
//  UserCell.swift
//  seshuPageControl
//
//  Created by apple on 9/2/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
   // static let identifier = "UserCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    func populate(with user : User){
        nameLabel.text = user.name
        emailLabel.text = user.email
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text?.removeAll()
        emailLabel.text?.removeAll()
      //  imageView?.image = nil
    }
 
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension UITableViewCell{
    static var identifier : String{
        return String(describing: self)
    }
}
