//
//  CalendarTableViewCell.swift
//  MyList
//
//  Created by Adesh on 25/03/23.
//

import UIKit

class CalendarTableViewCell: UITableViewCell {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    static let identifier = "CalendarTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "CalendarTableViewCell", bundle: nil)
    }
    
    public func configure(cellType: String) {
        
        datePicker.locale = .current
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .inline
        datePicker.date = Date()

        datePicker.addTarget(self, action: #selector(dateSelected), for: .valueChanged)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func dateSelected() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let finalDate = dateFormatter.string(from: datePicker.date)
        print(finalDate)
    }
    
}
