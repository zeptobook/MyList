//
//  CalendarPopupViewController.swift
//  MyList
//
//  Created by Adesh on 20/03/23.
//

import UIKit

class CalendarPopupViewController: UIViewController {

    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func Done(_ sender: Any) {
        hide()
    }
    
    init() {
        super.init(nibName: "CalendarPopupViewController", bundle: nil)
        self.modalPresentationStyle = .formSheet
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configView()
        
        datePicker.locale = .current
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .inline
        datePicker.date = Date()
        
        datePicker.addTarget(self, action: #selector(dateSelected), for: .valueChanged)
    }
    
    func configView() {
        //self.view.backgroundColor = .clear
    }
    
    func appear(sender: UIViewController) {
        sender.present(self, animated: true)
    }

    func hide() {
        self.dismiss(animated: true)
    }
    
    @objc func dateSelected() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let finalDate = dateFormatter.string(from: datePicker.date)
        print(finalDate)
    }
}
