//
//  DetailViewController.swift
//  RC_RxFlow
//
//  Created by 박형석 on 2021/06/13.
//

import UIKit
import SDWebImage
import RxCocoa
import RxSwift

class DetailViewController: UIViewController, ViewModelBindable, Storyboarded {
    
    var viewModel: DetailViewModel!
    
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleContent: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        thumbnailImage.contentMode = .scaleAspectFill
    }
    
    func bindViewModel() {
        
        viewModel.title
            .drive(articleTitle.rx.text)
            .disposed(by: rx.disposeBag)
        viewModel.content
            .drive(articleContent.rx.text)
            .disposed(by: rx.disposeBag)
        thumbnailImage.sd_setImage(with: viewModel.thumbnailImageURL, completed: nil)
    }
    
}
