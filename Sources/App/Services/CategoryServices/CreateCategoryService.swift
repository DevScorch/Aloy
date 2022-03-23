//
//  File.swift
//  
//
//  Created by Johan Sas on 23/03/2022.
//

import Foundation
import Vapor
import Fluent

struct CreateCategoryService {
    
    static func createNewCategory(_ newCategory: NewCategory, _ req: Request) throws -> EventLoopFuture<CategoryModel> {
        let category = CategoryModel(id: nil, title: newCategory.title, slug: newCategory.slug, headerImage: newCategory.headerImage)
        return category.save(on: req.db).map {
            category
        }
    }
}
