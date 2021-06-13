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

class ArticleViewModel {
    
    private let service = ArticleService()
    
    let section = ArticleSection(header: "news", footer: "end", items: [])
    
    lazy var articles: BehaviorRelay<[ArticleSection]> = BehaviorRelay(value: [])

    func fetch() {
        service.fetch { [weak self] articles in
            guard let self = self else { return }
            
            let section = ArticleSection(header: "news", footer: "end", items: articles)
            
            self.articles.accept([section])
        }
    }
    
    var dataSource: RxTableViewSectionedAnimatedDataSource<ArticleSection> = {
        let ds = RxTableViewSectionedAnimatedDataSource<ArticleSection> { dataSource, tableView, indexPath, article -> UITableViewCell in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ArticleTableViewCell else { return UITableViewCell() }
            
            cell.updateUI(article: article)
            
            return cell
        }
        
        ds.titleForHeaderInSection = { dataSource, index in
            return dataSource.sectionModels[index].header
        }
        
        ds.titleForFooterInSection = { dataSource, index in
            return dataSource.sectionModels[index].footer
        }
        
        return ds
    }()
    
}
