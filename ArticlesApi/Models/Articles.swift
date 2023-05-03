//
//  Articles.swift
//  ArticlesApi
//
//  Created by Толкын Жагыпар on 01.05.2023.
//

import Foundation

struct News: Decodable{
    let status: String
    let articles: [Article]!
}

struct Article: Decodable{
    let author: String?
    let title: String?
    let publishedAt: String?
    let content: String?
    let urlToImage: String?
}

