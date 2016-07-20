//
//  SavedBallViewController.swift
//  My PowerBall
//
//  Created by suncihai on 16/1/30.
//  Copyright © 2016年 suncihai. All rights reserved.
//

import UIKit
import Foundation


protocol updatesavelistdelegete{
    func Updatesavelist(list:[Array<String>])
}

class SavedBallViewController:UITableViewController{
    
    var SavedBallList=[["W4.png","W9.png","W24.png","W38.png","W54.png","R8.png"]]
    var delegate:updatesavelistdelegete?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title="SavedBall List"

    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SavedBallList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! SavedBallTableViewCell
        let row=indexPath.row as Int
        cell.SavedWhiteBall1Image.image=UIImage(named: SavedBallList[row][0])
        cell.SavedWhiteBall2Image.image=UIImage(named: SavedBallList[row][1])
        cell.SavedWhiteBall3Image.image=UIImage(named: SavedBallList[row][2])
        cell.SavedWhiteBall4Image.image=UIImage(named: SavedBallList[row][3])
        cell.SavedWhiteBall5Image.image=UIImage(named: SavedBallList[row][4])
        
        cell.SavedRedBallImage.image=UIImage(named: SavedBallList[row][5])
        return cell
        
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if(editingStyle==UITableViewCellEditingStyle.Delete){
            SavedBallList.removeAtIndex(indexPath.row)
            self.delegate?.Updatesavelist(SavedBallList)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }

    }

}