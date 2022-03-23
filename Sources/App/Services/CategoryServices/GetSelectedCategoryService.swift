//
//  File.swift
//  
//
//  Created by Johan Sas on 23/03/2022.
//

import Foundation
import Vapor
import Fluent

struct GetSelectedCategoryService {
    
    static func getSelectedCategory(_ categoryID: String, _ req: Request) throws -> EventLoopFuture<CategoryModel> {
        let uuid = UUID(uuidString: categoryID)!
        return CategoryModel.query(on: req.db)
            .filter(\.$id == uuid)
            .first()
            .unwrap(or: Abort(.notFound))
    }
}
