//
//  File.swift
//  
//
//  Created by Johan Sas on 09/03/2022.
//

import Foundation
import Fluent
import Vapor

final class CategoryModel: Model, Content {
    // MARK: Database schema
    static let schema = DatabaseSchemas.categories.rawValue
    
    // MARK: Variables
    @ID
    var id: UUID?
    
    @Field(key: FieldKeys.title)
    var title: String
    
    @Field(key: FieldKeys.slug)
    var slug: String
    
    @Field(key: FieldKeys.headerImage)
    var headerImage: URL
    
    @Children(for: \.$category)
    var courses: [CourseModel]
    
    @Children(for: \.$categories)
    var articles: [ArticleModel]
    
    init() {}
    
    init(id: UUID? = nil, title: String, slug: String, headerImage: URL) {
        self.id = id
        self.title = title
        self.headerImage = headerImage
    }
    
}
