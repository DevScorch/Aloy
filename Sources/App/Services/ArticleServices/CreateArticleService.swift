//
//  File.swift
//  
//
//  Created by Johan Sas on 23/03/2022.
//

import Foundation
import Fluent
import Vapor

struct CreateNewArticleService {
    
    static func createNewArticle(_ newArticle: NewArticle, _ req: Request) throws -> EventLoopFuture<ArticleModel> {
        let user = try req.auth.require(UserModel.self)
        let newArticle = ArticleModel(id: nil, title: newArticle.title, slug: newArticle.slug, intro: newArticle.intro!, excerp: newArticle.excerp, content: newArticle.content, headerImage: newArticle.headerImage, author: user.name, contentState: newArticle.contentState, contentRole: newArticle.contentRole, savedByUsers: nil, createdAt: Date(), updatedAt: Date(), publishDate: newArticle.publishDate!, categories: newArticle.category)
        return newArticle.save(on: req.db).map {
            newArticle
        }
    }
}
