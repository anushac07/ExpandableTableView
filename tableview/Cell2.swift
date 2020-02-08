//
//  Cell2.swift
//  segmentedtableview
//
//  Created by C Anusha on 11/19/1398 AP.
//  Copyright © 1398 C Anusha. All rights reserved.
//
import UIKit
import Foundation

class Cell2: UITableViewCell {
    
    @IBOutlet weak var comment_author: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    func update(for comments: CommentDetails) {
        comment_author.text = comments.author
        contentLabel.text = comments.content
    }
}

