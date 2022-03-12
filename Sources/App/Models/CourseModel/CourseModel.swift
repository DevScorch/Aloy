//
//  File.swift
//  
//
//  Created by Johan Sas on 08/03/2022.
//

import Foundation
import Fluent
import Vapor
import CloudKit

final class CourseModel: Model {
    // MARK: Database schema
    static let schema = DatabaseSchemas.courses.rawValue
    
    // MARK: Variabeles
    
    @ID
    var id: UUID?
    
    @Field(key: FieldKeys.title)
    var title: String?
    
    @Field(key: FieldKeys.description)
    var description: String?
    
    @Field(key: FieldKeys.shortDescription)
    var shortDescription: String?
    
    @Field(key: FieldKeys.headerImage)
    var headerImage: URL?
    
    @Field(key: FieldKeys.article)
    var article: String?
    
    @Field(key: FieldKeys.sylabus)
    var sylabus: URL?
    
    @Field(key: FieldKeys.assetsURL)
    var assetsURL: URL?
    
    @Field(key: FieldKeys.contentState)
    var contentState: ContentState.RawValue
    
    @Field(key: FieldKeys.publishDate)
    var publishDate: Date?
    
    @Field(key: FieldKeys.contentRole)
    var contentRole: ContentRole.RawValue

    @Field(key: FieldKeys.createdAt)
    var createdAt: Date
    
    @Field(key: FieldKeys.updatedAt)
    var updatedAt: Date
    
    @Field(key: FieldKeys.instructor)
    var instructor: String
    
    @Parent(key: FieldKeys.category)
    var category: CategoryModel
    
    @Children(for: \.$course)
    var sections: [SectionModel]
    
    init() {}
    
    init(id: UUID? = nil, title: String?, description: String? , shortDescription: String?, headerImage: URL?, article: String?, sylabus: URL?, assetsURL: URL?, contentState: ContentState.RawValue, publishDate: Date?, contentRole: ContentRole.RawValue, createdAt: Date, updatedAt: Date, instructor: String, category: UUID) {
        self.id = id
        self.title = title
        self.description = description
        self.shortDescription = shortDescription
        self.headerImage = headerImage
        self.article = article
        self.sylabus = sylabus
        self.assetsURL = assetsURL
        self.contentState = contentState
        self.publishDate = publishDate
        self.contentRole = contentRole
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.instructor = instructor
        self.$category.id = category
    }
    
    
}

extension CourseModel: Content {
    
}
