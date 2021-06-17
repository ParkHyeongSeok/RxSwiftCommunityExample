//
//  MainFlow.swift
//  RC_RxFlow
//
//  Created by 박형석 on 2021/06/17.
//

import Foundation
import RxFlow
import RxSwift

class MainFlow: Flow {
    
    let navigationController = UINavigationController()
    
    let viewModel: ArticleViewModel
    
    init(viewModel: ArticleViewModel) {
        self.viewModel = viewModel
    }
    
    var root: Presentable {
        return self.navigationController
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppSteps else { return .none }
        
        switch step {
        case .homeIsRequired:
            return homeVCPresent()
        case .detailIsRequired(let article):
            return detailVCPresent(article: article)
            
        }
        
    }
    
    private func homeVCPresent() -> FlowContributors {
        var vc = MainViewController.instantiate()
        vc.bind(viewModel: viewModel)
        self.navigationController.pushViewController(vc, animated: true)
        return .none
    }
    
    private func detailVCPresent(article: Article) -> FlowContributors {
        var vc = DetailViewController.instantiate()
        let detailViewModel = DetailViewModel(title: article.title, content: article.content, thumbnailImageURL: article.thumbnailImageURL)
        vc.bind(viewModel: detailViewModel)
        self.navigationController.pushViewController(vc, animated: true)
        return .none
    }
    
    
}
