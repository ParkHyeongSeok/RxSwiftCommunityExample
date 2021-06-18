//
//  ArticleViewModel.swift
//  RC_RxFlow
//
//  Created by 박형석 on 2021/06/12.
//

import Foundation
import RxSwift
import RxCocoa
import RxDataSources
import SDWebImage
import RxFlow
import Action

class ArticleViewModel: Stepper {
    
    var steps: PublishRelay<Step> = .init()
    
    var initialStep: Step {
        return AppSteps.homeIsRequired
    }
    
    lazy var detailAction: Action<Article, Void> = {
        return Action { [weak self] article in
            
            self?.steps.accept(AppSteps.detailIsRequired(article))
            
            return Observable.empty()
        }
    }()
    
    private let service = ArticleService()
    
    lazy var articles: BehaviorRelay<[ArticleSection]> = BehaviorRelay(value: [])

    func fetch() {
        service.fetch { [weak self] articles in
            guard let self = self else { return }
            
            let section = ArticleSection(header: "news", footer: "end", items: articles)
            
            self.articles.accept([section])
        }
    }
    
    var dataSource: RxCollectionViewSectionedAnimatedDataSource<ArticleSection> = {
        let ds = RxCollectionViewSectionedAnimatedDataSource<ArticleSection> { dataSource, collectionView, indexPath, article -> UICollectionViewCell in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ArticleCollectionViewCell else { return UICollectionViewCell() }
            
            cell.updateUI(article: article)
            
            return cell
        }
        
        // collectionView에는 아래 프로퍼티가 없습니다. 원래 collectionView의 헤더는 reusableHeader로 따로 만들어줬습니다.
        
//        ds.titleForHeaderInSection = { dataSource, index in
//            return dataSource.sectionModels[index].header
//        }
//
//        ds.titleForFooterInSection = { dataSource, index in
//            return dataSource.sectionModels[index].footer
//        }
        
        return ds
    }()
  
}
