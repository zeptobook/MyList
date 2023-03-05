//
//  TaskTableViewCell.swift
//  MyList
//
//  Created by Adesh on 05/03/23.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    
    @IBOutlet weak var name: UILabel?
    @IBOutlet weak var checkbox: CheckBoxView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configure(task: Task) {
        if(task.isSelected) {
            self.checkbox!.markAsChecked()
        } else {
            self.checkbox!.markAsUnChecked()
        }
        
        self.name?.text = task.name
        
        self.checkbox?.checkBoxChanged = {
            if(!task.isSelected){
                self.checkbox!.markAsChecked()
                task.isSelected = true
            } else {
                self.checkbox!.markAsUnChecked()
                task.isSelected = false
            }
        }
    }

}
