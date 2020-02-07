//
//  CustomCell2.swift
//  segmentedtableview
//
//  Created by C Anusha on 11/19/1398 AP.
//  Copyright © 1398 C Anusha. All rights reserved.
//

import UIKit

class CustomCell2: UITableViewCell {

    @IBOutlet weak var commentLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func customInit(text: String) {
           self.commentLabel.text = text
       // self.commentLabel.backgroundColor = UIColor.lightGray
        //self.contentView.backgroundColor = UIColor.lightGray
       // self.commentLabel.textColor = UIColor.darkGray
    }
    
}
