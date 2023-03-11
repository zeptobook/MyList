//
//  FavoriteView.swift
//  MyList
//
//  Created by Adesh on 11/03/23.
//

import UIKit

class FavoriteView: UIView {

    var isChecked: Bool
    var favoriteImageView: UIImageView
    var favoriteChanged: () -> () = {}

    required init?(coder aDecoder: NSCoder) {
        self.isChecked = false
        //self.favoriteImageView = UIImageView(image: UIImage(named: "fillStar")?.withRenderingMode(.alwaysTemplate))
        self.favoriteImageView = UIImageView(image: nil)
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        
        //self.layer.borderWidth = 1.0
        //self.layer.borderColor = UIColor.white.cgColor
        self.isUserInteractionEnabled = true
        
        self.favoriteImageView.frame = CGRectMake(2, 2, 25, 25)
        
        self.addSubview(self.favoriteImageView)
        // register tap recognizers
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        self.addGestureRecognizer(tapRecognizer)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        favoriteTapped()
    }
    
    func favoriteTapped() {
        self.favoriteChanged()
    }
    
    func markAsFavorite() {
        //let image = UIImage(named: "fillStar")?.withRenderingMode(.alwaysTemplate)
        let image = UIImage(named: "fillStar")
        self.favoriteImageView.image = image
        self.favoriteImageView.tintColor = .white
        self.layer.borderWidth = 0
    }
    
    func markAsUnFavorite() {
        //let image = UIImage(named: "emptyStar")?.withRenderingMode(.alwaysTemplate)
        let image = UIImage(named: "emptyStar")
        self.favoriteImageView.image = image
        self.favoriteImageView.tintColor = .white
        self.layer.borderWidth = 0
    }
}
