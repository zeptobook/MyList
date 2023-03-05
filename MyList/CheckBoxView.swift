//
//  CheckBoxView.swift
//  CheckBoxUITable
//
//  Created by Adesh on 05/03/23.
//

import UIKit

class CheckBoxView: UIView {
    
    var isChecked: Bool
    var checkBoxImageView: UIImageView
    var checkBoxChanged: () -> () = {}
    
    required init?(coder aDecoder: NSCoder) {
        self.isChecked = false
        self.checkBoxImageView = UIImageView(image: nil)
        
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        // make a border
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.white.cgColor
        self.isUserInteractionEnabled = true
        
        //let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        
        self.checkBoxImageView.frame = CGRectMake(2, 2, 25, 25)
        //self.checkBoxImageView.isUserInteractionEnabled = true
        //self.checkBoxImageView.addGestureRecognizer(tapRecognizer)
        self.addSubview(self.checkBoxImageView)
        
        //let selector: Selector = Selector("checkBoxTapped")
        
        // register tap recognizers
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        self.addGestureRecognizer(tapRecognizer)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        checkBoxTapped()
    }
    
    func checkBoxTapped() {
        self.checkBoxChanged()
    }
    
    func markAsChecked() {
        let image = UIImage(named: "small-check")?.withRenderingMode(.alwaysTemplate)
        self.checkBoxImageView.image = image
        self.checkBoxImageView.tintColor = .white
        self.layer.borderWidth = 0
    }
    
    func markAsUnChecked() {
        self.checkBoxImageView.image = nil
        self.layer.borderWidth = 1.0
    }
}
