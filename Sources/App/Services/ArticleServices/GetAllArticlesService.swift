//
//  File.swift
//  
//
//  Created by Johan Sas on 23/03/2022.
//

import Foundation
import Vapor
import Fluent

struct GetAllArticleService {
    
    static func getAllArticles(_ req: Request) throws -> EventLoopFuture<[ArticleModel]> {
        let user = try req.auth.require(UserModel.self)
        let contentState = ContentState.published.rawValue
        
        let userRetrievedArticles = ArticleModel.query(on: req.db)
            .filter(\.$contentState == contentState)
            .all()
        
        let adminRetrievedArticles = ArticleModel.query(on: req.db)
            .all()
        return user.username == UserRole.admin.rawValue ? adminRetrievedArticles : userRetrievedArticles
    }
}
