//
//  Cell1.swift
//  segmentedtableview
//
//  Created by C Anusha on 11/19/1398 AP.
//  Copyright © 1398 C Anusha. All rights reserved.
//
import UIKit
import Foundation

class Cell1: UITableViewCell {
    
    @IBOutlet weak var post_author: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var upvote: UILabel!
    @IBOutlet weak var created_at: UILabel!
    @IBOutlet weak var statusButton: UIButton!
    @IBOutlet weak var context: UILabel!
    func setExpanded() -> Void {
       statusButton.setImage(UIImage(named: "icon"), for: .normal)
    }
    
    func setCollapsed() -> Void {
        statusButton.setImage(UIImage(named: "icond"), for: .normal)
    }
    
    func update(for posts: PostDetails) {
        post_author.text = posts.author
        titleLabel.text = posts.title
        created_at.text = String(posts.time)+" hours ago"
        upvote.text = String(posts.upvotes)+" likes"
        context.text = posts.content
        
        
    }
}
