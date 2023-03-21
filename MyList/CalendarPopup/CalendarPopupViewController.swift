//
//  CalendarPopupViewController.swift
//  MyList
//
//  Created by Adesh on 20/03/23.
//

import UIKit

class CalendarPopupViewController: UIViewController {

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
    }
    
    func configView() {
        //self.view.backgroundColor = .clear
    }
    
    func appear(sender: UIViewController) {
        sender.present(self, animated: true)
    }
    
//    private func show() {
//        UIView.animate(withDuration: 1, delay: 0.1, animations: nil)
//    }

    func hide() {
        UIView.animate(withDuration: 1, delay: 0.0, options: .curveEaseOut) {
            
        } completion: { _ in
            self.dismiss(animated: false)
            self.removeFromParent()
        }
        
    }
}
