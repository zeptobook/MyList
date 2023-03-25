//
//  CalendarPopupViewController.swift
//  MyList
//
//  Created by Adesh on 20/03/23.
//

import UIKit

class CalendarPopupViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    var cellImage = ["clock.fill", "clock.badge.fill", "clock.arrow.2.circlepath"]
    var cellLabel = ["Time", "Reminder", "Repeat"]
    var cellType = ["time", "reminder", "repeat"]
    
    @IBOutlet weak var tableView: UITableView!
    
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
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        
        tableView.register(CalenderCustomTableViewCell.nib(), forCellReuseIdentifier: CalenderCustomTableViewCell.identifier)
        
        tableView.register(CalendarTableViewCell.nib(), forCellReuseIdentifier: CalendarTableViewCell.identifier)

        configView()
        
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
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Return three custom cells
        if indexPath.row > 0 {
            let customCell =  tableView.dequeueReusableCell(withIdentifier: CalenderCustomTableViewCell.identifier, for: indexPath) as! CalenderCustomTableViewCell
            
            customCell.configure(with: cellLabel[indexPath.row - 1], imageName: cellImage[indexPath.row - 1], cellType: cellType[indexPath.row - 1])
            
            return customCell
        }
        
        // Return calender cell
        let calenderCell = tableView.dequeueReusableCell(withIdentifier: CalendarTableViewCell.identifier, for: indexPath) as! CalendarTableViewCell
        
        calenderCell.configure(cellType: "calender")
        return calenderCell
    }
}
