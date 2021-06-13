//
//  ArticleTableViewCell.swift
//  RC_RxFlow
//
//  Created by 박형석 on 2021/06/13.
//

import UIKit
import SDWebImage

class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleContent: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    func configureUI() {
        contentView.layer.shadowColor = UIColor.opaqueSeparator.cgColor
        contentView.layer.shadowOpacity = 0.5
        contentView.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        thumbnailImage.layer.cornerRadius = 8
        thumbnailImage.layer.masksToBounds = true
    }
    
    func updateUI(article: Article) {
        thumbnailImage.contentMode = .scaleAspectFill
        thumbnailImage.sd_setImage(with: article.thumbnailImageURL, placeholderImage: UIImage(systemName: "person.fill"), completed: nil)
        articleTitle.text = article.title
        articleContent.text = article.content
        
    }

}
