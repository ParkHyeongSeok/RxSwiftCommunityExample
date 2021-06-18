//
//  AppSteps.swift
//  RC_RxFlow
//
//  Created by 박형석 on 2021/06/17.
//

import Foundation
import RxFlow

enum AppSteps: Step {
    
    case homeIsRequired
    case detailIsRequired(Article)
    
}
