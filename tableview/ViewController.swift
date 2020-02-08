//
//  ViewController.swift
//  segmentedtableview
//
//  Created by C Anusha on 11/17/1398 AP.
//  Copyright © 1398 C Anusha. All rights reserved.
//

import UIKit

class Cell1: UITableViewCell {
    
    @IBOutlet weak var post_author: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var upvote: UILabel!
    @IBOutlet weak var created_at: UILabel!
    @IBOutlet weak var statusButton: UIButton!
    func setExpanded() -> Void {
       statusButton.setImage(UIImage(named: "icon"), for: .normal)
    }
    
    func setCollapsed() -> Void {
        statusButton.setImage(UIImage(named: "icond"), for: .normal)
    }
}

class Cell2: UITableViewCell {
    
    @IBOutlet weak var comment_author: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
     var tableViewData = [cellData]()
    
   // var data = ["A", "B", "C"]
  //  var p: Int!
   

    @IBOutlet weak var scSegment: UISegmentedControl!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       /* let nib = UINib(nibName: "CustomCell", bundle: nil)
        let nib2 = UINib(nibName: "CustomCell2", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CustomCell")
        tableView.register(nib2, forCellReuseIdentifier: "CustomCell2")*/
        
       tableViewData = [cellData(opened: false, title: "post 1", Sectiondata: ["p1c1", "p1c2", "p1c3"]),
                               cellData(opened: false, title: "post 2", Sectiondata: ["p2c1", "p2c2"]),
                               cellData(opened: false, title: "post 3", Sectiondata: ["p3c1", "p3c2", "p3c3"]),
                               cellData(opened: false, title: "post 4", Sectiondata: ["p4c1"])]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if tableViewData[section].opened == true {
            return tableViewData[section].Sectiondata.count + 1
        }
        else {
            return 1
        }
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
             let cell = tableView.dequeueReusableCell(withIdentifier: "cell1") as! Cell1
                  
                 cell.titleLabel.text = tableViewData[indexPath.section].title
            if tableViewData[indexPath.section].opened == true {cell.setExpanded()}
            else {cell.setCollapsed()}
                 return cell
             }
             else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") as! Cell2
                 cell.contentLabel.text = tableViewData[indexPath.section].Sectiondata[indexPath.row - 1]
                 return cell
    }
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 107.0
//    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           if indexPath.row == 0 {
           if tableViewData[indexPath.section].opened == true {
               tableViewData[indexPath.section].opened = false
               let sections = IndexSet.init(integer: indexPath.section)
             tableView.reloadSections(sections, with: .none)
            //   tableView.reloadData()
               }
           else {
               tableViewData[indexPath.section].opened = true
               let sections = IndexSet.init(integer: indexPath.section)
                         tableView.reloadSections(sections, with: .none)
              // tableView.reloadData()
           }
       }
       }

    @IBAction func isTapped(_ sender: UISegmentedControl) {
        
        let getIndex = scSegment.selectedSegmentIndex
        switch getIndex {
        case 0:
            view.backgroundColor = UIColor.red
            
            tableViewData = [cellData(opened: false, title: "post 1", Sectiondata: ["p1c1", "p1c2", "p1c3"]),
                                          cellData(opened: false, title: "post 2", Sectiondata: ["p2c1", "p2c2"]),
                                          cellData(opened: false, title: "post 3", Sectiondata: ["p3c1", "p3c2", "p3c3"]),
                                          cellData(opened: false, title: "post 4", Sectiondata: ["p4c1"])]
        tableView.reloadData()
        case 1:
            
            tableViewData = [cellData(opened: false, title: "post 1", Sectiondata: ["p1c1", "p1c2", "p1c3"]),
            cellData(opened: false, title: "post 2", Sectiondata: ["p2c1", "p2c2"]),
            cellData(opened: false, title: "post 3", Sectiondata: ["p3c1", "p3c2", "p3c3"])]
            tableView.reloadData()
            view.backgroundColor = UIColor.yellow
            
        default:
            print ("Nothing")
            
            //self.view.backgroundColor = UIColor.red
        }
    }
    

}
