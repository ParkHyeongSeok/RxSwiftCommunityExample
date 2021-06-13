//
//  DetailViewModel.swift
//  RC_RxFlow
//
//  Created by 박형석 on 2021/06/13.
//

import Foundation
import RxSwift
import RxCocoa

class DetailViewModel {
    
    let detailArticle = BehaviorRelay<Article>(value: Article(title: "Empty News", content: "Network Connection False", thumbnailImageURL: URL(string: "https://cleantechnica.com/files/2021/06/Tesla-Model-3-Paris-France.jpeg")!))
    
    
}
