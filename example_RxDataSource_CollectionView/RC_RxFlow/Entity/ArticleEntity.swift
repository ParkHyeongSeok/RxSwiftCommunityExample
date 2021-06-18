//
//  ArticleEntity.swift
//  RC_RxFlow
//
//  Created by 박형석 on 2021/06/12.
//

import Foundation

struct ArticleResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [ArticleEntity]
}

struct ArticleEntity: Codable {
    let author: String?
    let title: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}
