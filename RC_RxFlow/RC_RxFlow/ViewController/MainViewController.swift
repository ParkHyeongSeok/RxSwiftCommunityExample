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

class MainViewController: UIViewController {
    
    let viewModel = ArticleViewModel()
    
    @IBOutlet weak var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listTableView.rx.modelSelected(Article.self)
            .subscribe(onNext: { [weak self] article in
                guard let vc = self?.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
                vc.article = article
                self?.navigationController?.pushViewController(vc, animated: true)
            })
        
        viewModel.articles
            .bind(to: listTableView.rx.items(dataSource: viewModel.dataSource))
            .disposed(by: rx.disposeBag)
        
        viewModel.fetch()
    }
    
}
