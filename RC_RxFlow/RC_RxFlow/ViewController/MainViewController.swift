//
//  MainViewController.swift
//  RC_RxFlow
//
//  Created by 박형석 on 2021/06/12.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx
import RxDataSources

class MainViewController: UIViewController, Storyboarded {

    var viewModel = ArticleViewModel()
    
    @IBOutlet weak var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    func bindViewModel() {
        listTableView.rx.modelSelected(Article.self)
            .subscribe(onNext: { [weak self] article in
                let detailViewModel = DetailViewModel(title: article.title, content: article.content, thumbnailImageURL: article.thumbnailImageURL)
                var vc = DetailViewController.instantiate()
                vc.bind(viewModel: detailViewModel)
                self?.navigationController?.pushViewController(vc, animated: true)
            })
            .disposed(by: rx.disposeBag)
        
        viewModel.articles
            .bind(to: listTableView.rx.items(dataSource: viewModel.dataSource))
            .disposed(by: rx.disposeBag)
        
        viewModel.fetch()
    }
    
}
