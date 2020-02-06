//
//  CustomCell.swift
//  segmentedtableview
//
//  Created by C Anusha on 11/17/1398 AP.
//  Copyright © 1398 C Anusha. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func customInit(text: String) {
        self.titleLabel.text = text
        self.titleLabel.textColor = UIColor.darkGray
       // self.contentView.backgroundColor = UIColor.lightGray
    }
    
}
