//
//  File.swift
//  
//
//  Created by Johan Sas on 23/03/2022.
//

import Foundation
import Vapor
import Fluent

struct GetSelectedArticleService {
    
    static func getSelectedArticle(_ articleID: String, _ req: Request) throws -> EventLoopFuture<ArticleModel?> {
        let uuid = UUID(uuidString: articleID)!
        let contentState = ContentState.published.rawValue
        return ArticleModel.query(on: req.db)
            .filter(\.$id == uuid)
            .filter(\.$contentState == contentState)
            .first()
    }
}
