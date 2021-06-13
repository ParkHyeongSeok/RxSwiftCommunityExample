//
//  DetailViewController.swift
//  RC_RxFlow
//
//  Created by 박형석 on 2021/06/13.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {
    
    var article: Article?
    
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleContent: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        updateUI(article: article)
    }
    
    private func configureUI() {
        title = "Detail"
        thumbnailImage.contentMode = .scaleAspectFill
    }
    
    private func updateUI(article: Article?) {
        thumbnailImage.sd_setImage(with: article?.thumbnailImageURL, completed: nil)
        articleTitle.text = article?.title
        articleContent.text = article?.content
    }

}
