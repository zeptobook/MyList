//
//  CalenderCustomTableViewCell.swift
//  MyList
//
//  Created by Adesh on 25/03/23.
//

import UIKit

class CalenderCustomTableViewCell: UITableViewCell {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    
    var myCellType: String = ""
    
    static let identifier = "CalenderCustomTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "CalenderCustomTableViewCell", bundle: nil)
    }
    
    public func configure(with title: String, imageName: String, cellType: String){
        myLabel?.text = title
        myImage?.image = UIImage(systemName: imageName)
        myCellType = cellType
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
