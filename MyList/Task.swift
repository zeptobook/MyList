//
//  Task.swift
//  MyList
//
//  Created by Adesh on 05/03/23.
//

import Foundation
import UIKit

class Task: NSObject {
    var name: String?
    var isSelected: Bool =  false
    var isFavorite: Bool = false
    var reminderDate: String?
}
