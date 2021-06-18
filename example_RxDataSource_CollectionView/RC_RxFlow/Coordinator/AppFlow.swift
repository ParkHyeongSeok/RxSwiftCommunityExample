//
//  AppFlow.swift
//  RC_RxFlow
//
//  Created by 박형석 on 2021/06/17.
//

import Foundation
import RxFlow

class AppFlow: Flow {
    
    let window: UIWindow!
  
    init(window: UIWindow) {
        self.window = window
    }
    
    var root: Presentable {
        return self.window
    }
    
    func navigate(to step: Step) -> FlowContributors {
        
        guard let step = step as? AppSteps else { return FlowContributors.none }
        
        switch step {
        case .homeIsRequired :
            return navigateToHomeFlow()
        case .detailIsRequired :
            return navigateToDetailFlow()
        }
        
    }
    
    private func navigateToHomeFlow() -> FlowContributors {
        
        let viewModel = ArticleViewModel()
        let mainFlow = MainFlow(viewModel: viewModel)
        Flows.use(mainFlow, when: .created) { root in
            self.window.rootViewController = root
        }
        return .one(flowContributor: .contribute(withNextPresentable: mainFlow, withNextStepper: viewModel))
    }
    
    private func navigateToDetailFlow() -> FlowContributors {
        
        return .none
    }
    
    
}
