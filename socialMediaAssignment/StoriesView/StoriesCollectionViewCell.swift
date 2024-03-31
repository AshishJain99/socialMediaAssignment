//
//  StoriesCollectionViewCell.swift
//  socialMediaAssignment
//
//  Created by Ashish Jain on 31/03/24.
//

import UIKit

class StoriesCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var userImageView:UIImageView!
    @IBOutlet weak var newImageView:UIImageView!
    @IBOutlet weak var mainView:UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        userImageView.layer.cornerRadius = userImageView.frame.height/2
    }

}
