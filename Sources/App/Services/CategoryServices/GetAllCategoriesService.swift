//
//  File.swift
//  
//
//  Created by Johan Sas on 23/03/2022.
//

import Foundation
import Fluent
import Vapor

struct GetAllCategoriesService {
    
    static func getAllCategories(_ req: Request) throws -> EventLoopFuture<[CategoryModel]> {
        return CategoryModel.query(on: req.db)
            .all()
    }
}
