//
//  ArticleCollectionViewCell.swift
//  RC_RxFlow
//
//  Created by 박형석 on 2021/06/18.
//

import UIKit
import SDWebImage

class ArticleCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var articleTitle: UILabel!

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
        
    }

}
