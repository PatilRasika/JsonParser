//
//  DTOData.swift
//  JsonParsingAssignment

import UIKit

class DTOData: Codable {
    let articles : [Article]?
    let status : String?
    let totalResults : Int?
    
    init(articles: [Article]?, status: String?, totalResults: Int?) {
        self.articles = articles
        self.status = status
        self.totalResults = totalResults
    }
}

class Article: Codable {
    let author : String?
    let content : String?
    let description : String?
    let publishedAt : String?
    let source : Source?
    let title : String?
    let url : String?
    let urlToImage : String?

    init(author: String?, content: String?, description: String?, publishedAt: String?, source: Source?, title: String?, url: String?, urlToImage: String?) {
        self.author = author
        self.content = content
        self.description = description
        self.publishedAt = publishedAt
        self.source = source
        self.title = title
        self.url = url
        self.urlToImage = urlToImage
    }
}

class Source: Codable {
    let id : String?
    let name : String?

    init(id: String?, name: String?) {
        self.id = id
        self.name = name
    }

}
