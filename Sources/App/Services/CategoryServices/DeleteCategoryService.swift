//
//  File.swift
//  
//
//  Created by Johan Sas on 23/03/2022.
//

import Foundation
import Vapor
import Fluent

struct DeleteCategoryService {
    
    static func deleteCategory(_ categoryID: String, _ req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let uuid = UUID(uuidString: categoryID)
        return CategoryModel.find(uuid, on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { category in
                category.delete(on: req.db).transform(to: .noContent)
                
            }

        
    }
}
