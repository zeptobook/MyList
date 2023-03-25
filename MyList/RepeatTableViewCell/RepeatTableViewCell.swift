//
//  RepeatTableViewCell.swift
//  MyList
//
//  Created by Adesh on 25/03/23.
//

import UIKit

class RepeatTableViewCell: UITableViewCell {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    
    static let identifier = "RepeatTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "RepeatTableViewCell", bundle: nil)
    }
    
    public func configure(with title: String, imageName: String){
        myLabel?.text = title
        myImage?.image = UIImage(systemName: imageName)
        
        print("\(title) and \(imageName)")
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
