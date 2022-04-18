//
//  File.swift
//  
//
//  Created by Johan Sas on 24/03/2022.
//

import Foundation
import Fluent
import Vapor

struct DeleteArticleService {
    
    static func deleteArticle(_ articleID: String, _ req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let uuid = UUID(uuidString: articleID)
        return ArticleModel.find(uuid, on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { article in
                article.delete(on: req.db).transform(to: .noContent)
            }
    }
    
}
