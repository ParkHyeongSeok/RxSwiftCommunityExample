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
    
    let title: Driver<String>
    
    let content: Driver<String>
    
    let thumbnailImageURL: URL
    
    init(title: String, content: String, thumbnailImageURL: URL) {
        self.title = Driver.just(title)
        self.content = Driver.just(content)
        self.thumbnailImageURL = thumbnailImageURL
    }
    
}
