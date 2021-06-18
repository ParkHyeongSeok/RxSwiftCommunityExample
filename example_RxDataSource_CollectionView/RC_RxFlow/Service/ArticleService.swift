//
//  ArticleService.swift
//  RC_RxFlow
//
//  Created by 박형석 on 2021/06/12.
//

import Foundation
import UIKit
import SDWebImage

class ArticleService {
    
    private let repository = ArticleRepository()
    
    func fetch(completion: @escaping ([Article])->Void) {
        repository.fetch { articleEntities in
            
            var articles = [Article]()
            
            articleEntities.forEach { articleEntity in
                
                guard let urlString = articleEntity.urlToImage else { return }
                
                let thumbnailImageURL = URL(string: urlString)!
            
                let article = Article(title: articleEntity.title ?? "", content: articleEntity.content ?? "", thumbnailImageURL: thumbnailImageURL)
                
                articles.append(article)
                
            }
            
            completion(articles)
        }
    }
    
}
