//
//  File.swift
//  
//
//  Created by Johan Sas on 23/03/2022.
//

import Foundation
import Fluent
import Vapor

struct UpdateCategoryService {
    
    static func updateCategory(_ categoryID: String, _ updateCategory: UpdateCategory, _ req :Request) throws -> EventLoopFuture<CategoryModel> {
        let uuid = UUID(uuidString: categoryID)!
        
        return CategoryModel.find(uuid, on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { category in
                category.title = updateCategory.title 
                category.headerImage = updateCategory.headerImage 
                category.slug = updateCategory.slug
                return category.save(on: req.db).map {
                    category
                }
                
                
            }
    }
}
