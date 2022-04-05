//
//  File.swift
//  
//
//  Created by Johan Sas on 24/03/2022.
//

import Foundation
import Vapor
import Fluent

struct UpdateArticleService {
    
    static func updateArticle(_ articleID: String, updateArticle: UpdateArticle, _ req: Request) throws -> EventLoopFuture<ArticleModel> {
        let uuid = UUID(uuidString: articleID)!
        return ArticleModel.find(uuid, on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { article in
                article.title = updateArticle.title ?? article.title
                article.contentState = updateArticle.contentState ?? article.contentState
                article.publishDate = updateArticle.publishDate ?? article.publishDate
                article.contentRole = updateArticle.contentRole ?? article.contentRole
                article.headerImage = updateArticle.headerImage ?? article.headerImage
                article.content = updateArticle.content ?? article.content
                article.excerp = updateArticle.excerp ?? article.excerp
                article.intro = updateArticle.intro ?? article.intro
                article.slug = updateArticle.slug ?? article.slug
                article.createdAt = article.createdAt
                article.updatedAt = Date()
                article.publishDate = updateArticle.publishDate ?? article.publishDate
                article.author = article.author
                return article.save(on: req.db).map {
                    article
                }
            }
    }
}
