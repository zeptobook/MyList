//
//  CalendarPopupWindow.swift
//  MyList
//
//  Created by Adesh on 12/03/23.
//

// https://johncodeos.com/how-to-create-a-popup-window-in-ios-using-swift/
import Foundation
import UIKit

private class CalendarPopupWindowView: UIView {
    let popupView = UIView(frame: CGRect.zero)
    let popupTitle =  UILabel(frame: CGRect.zero)
    let popupText = UILabel(frame: CGRect.zero)
    let popupButton = UIButton(frame: CGRect.zero)
    
    let BorderWidth: CGFloat =  2.0
    
    init() {
        super.init(frame: CGRect.zero)
        
        //Semi transparent background
        //backgroundColor =  UIColor.black.withAlphaComponent(0.3)
        backgroundColor = UIColor.black
        
        //Popup background
        popupView.backgroundColor = UIColor.blue
        popupView.layer.borderWidth = BorderWidth
        popupView.layer.masksToBounds = true
        popupView.layer.borderColor = UIColor.white.cgColor
        
        //Popup Title
        popupTitle.textColor = UIColor.white
        popupTitle.backgroundColor = UIColor.yellow
        popupTitle.layer.masksToBounds = true
        popupTitle.adjustsFontSizeToFitWidth = true
        popupTitle.clipsToBounds = true
        popupTitle.font = UIFont.systemFont(ofSize: 23.0, weight: .bold)
        popupTitle.numberOfLines = 1
        popupTitle.textAlignment = .center
        
        //Popup Button
        popupButton.setTitleColor(UIColor.white, for: .normal)
        popupButton.titleLabel?.font = UIFont.systemFont(ofSize: 23.0, weight: .bold)
        popupButton.backgroundColor = UIColor.yellow
        
        popupView.addSubview(popupTitle)
        popupView.addSubview(popupButton)
        
        // Add the popupView(box) in the PopUpWindowView (semi-transparent background)
        addSubview(popupView)
        
        // PopupView constraints
//        popupView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            popupView.widthAnchor.constraint(equalToConstant: 50),
//            popupView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
//            popupView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
//        ])
//
//        // PopupTitle constraints
//        popupTitle.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            popupTitle.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: BorderWidth),
//            popupTitle.trailingAnchor.constraint(equalTo: popupView.trailingAnchor, constant: -BorderWidth),
//            popupTitle.topAnchor.constraint(equalTo: popupView.topAnchor, constant: BorderWidth),
//            popupTitle.heightAnchor.constraint(equalToConstant: 55)
//        ])
//
//        // PopupButton constraints
//        popupButton.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            popupButton.heightAnchor.constraint(equalToConstant: 44),
//            popupButton.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: BorderWidth),
//            popupButton.trailingAnchor.constraint(equalTo: popupView.trailingAnchor, constant: -BorderWidth),
//            popupButton.bottomAnchor.constraint(equalTo: popupView.bottomAnchor, constant: -BorderWidth)
//        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder) has not been implemented")
    }
}

class CalendarPopUpWindow: UIViewController {
    
    private let calendarPopupWindowView = CalendarPopupWindowView()
    
    init(title: String, text: String, buttontext: String) {
        super.init(nibName: nil, bundle: nil)
        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .formSheet
        
        calendarPopupWindowView.popupTitle.text = title
        calendarPopupWindowView.popupText.text = text
        calendarPopupWindowView.popupButton.setTitle(buttontext, for: .normal)
        
        calendarPopupWindowView.popupButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        
        view = calendarPopupWindowView
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func dismissView() {
        self.dismiss(animated: true)
    }
    
}
