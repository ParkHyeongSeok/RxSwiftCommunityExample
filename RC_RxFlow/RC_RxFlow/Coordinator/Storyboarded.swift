//
//  Storyboarded.swift
//  RC_RxFlow
//
//  Created by 박형석 on 2021/06/16.
//

import Foundation
import UIKit

protocol Storyboarded {
    
    static func instantiate() -> Self
    
}

extension Storyboarded where Self: UIViewController {
    
    static func instantiate() -> Self {

        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: className) as! Self
        
        return vc
    }
    
}
