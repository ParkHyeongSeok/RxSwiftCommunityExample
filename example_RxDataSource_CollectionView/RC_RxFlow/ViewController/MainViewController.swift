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

class MainViewController: UIViewController, Storyboarded, ViewModelBindable {

    var viewModel: ArticleViewModel!
   
    @IBOutlet weak var listCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func bindViewModel() {
        listCollectionView.rx.modelSelected(Article.self)
            .bind(to: viewModel.detailAction.inputs)
            .disposed(by: rx.disposeBag)
        
        viewModel.articles
            .bind(to: listCollectionView.rx.items(dataSource: viewModel.dataSource))
            .disposed(by: rx.disposeBag)
        
        viewModel.fetch()
    }
    
}
