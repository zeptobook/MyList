//
//  CustomTabBarController.swift
//  MyList
//
//  Created by Adesh on 23/10/22.
//

import Foundation
import UIKit

class CustomTabBarController: UITabBarController {
    @IBInspectable var initialIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedIndex =  initialIndex
    }
}
