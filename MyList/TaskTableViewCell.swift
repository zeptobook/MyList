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
    @IBOutlet weak var favorite: FavoriteView?
    
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
        
        if(task.isFavorite) {
            self.favorite!.markAsFavorite()
        } else {
            self.favorite!.markAsUnFavorite()
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
        
        self.favorite?.favoriteChanged = {
            if(!task.isFavorite){
                self.favorite!.markAsFavorite()
                task.isFavorite = true
            } else {
                self.favorite!.markAsUnFavorite()
                task.isFavorite = false
            }
        }
        
    }

}
