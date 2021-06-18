//
//  Article.swift
//  RC_RxFlow
//
//  Created by 박형석 on 2021/06/12.
//

import Foundation
import UIKit
import RxDataSources

struct Article: Equatable, IdentifiableType {
    
    var identity: String = UUID().uuidString
    let title: String
    let content: String
    let thumbnailImageURL: URL
}

struct ArticleSection: AnimatableSectionModelType {
    typealias Item = Article
    
    var header: String
    var footer: String
    var items: [Article]
    var identity: String
    
    init(header: String, footer: String, items: [Article]) {
        self.header = header
        self.footer = footer
        self.items = items
        self.identity = UUID().uuidString
    }
    
    init(original: ArticleSection, items: [Item]) {
        self = original
        self.items = items
    }
}
