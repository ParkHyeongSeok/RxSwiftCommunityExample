//
//  AppStepper.swift
//  RC_RxFlow
//
//  Created by 박형석 on 2021/06/17.
//

import Foundation
import RxFlow
import RxCocoa
import RxSwift

class AppStepper: Stepper {
    
    var steps: PublishRelay<Step> = .init()
    
    var initialStep: Step {
        return AppSteps.homeIsRequired
    }
    
}
