//
//  File.swift
//  
//
//  Created by Johan Sas on 09/03/2022.
//

import Foundation
import Fluent
import CloudKit

final class ArticleModel: Model {
    // MARK: Database schema
    static let schema: String = DatabaseSchemas.articles.rawValue
    
    @ID
    var id: UUID?
    
    @Field(key: FieldKeys.title)
    var title: String?
    
    @Field(key: FieldKeys.slug)
    var slug: String?
    
    @Field(key: FieldKeys.intro)
    var intro: String?
    
    @Field(key: FieldKeys.excerp)
    var excerp: String?
    
    @Field(key: FieldKeys.content)
    var content: String?
    
    @Parent(key: FieldKeys.category)
    var category: CategoryModel
    
    @Field(key: FieldKeys.headerImage)
    var headerImage: URL?
    
    @Field(key: FieldKeys.author)
    var author: String?
    
    @Field(key: FieldKeys.contentState)
    var contentState: ContentState.RawValue
    
    @Field(key: FieldKeys.contentRole)
    var contentRole: ContentRole.RawValue
    
    @Field(key: FieldKeys.savedByUsers)
    var savedByUsers: [String]
    
    @Field(key: FieldKeys.createdAt)
    var createdAt: Date?
    
    @Field(key: FieldKeys.updatedAt)
    var updatedAt: Date?
    
    @Field(key: FieldKeys.publishDate)
    var publishDate: Date?
    
    init() {}
    
    init(id: UUID? = nil, title: String?, slug: String?, intro: String, excerp: String?, content: String?, headerImage: URL?, author: String?, contentState: ContentState.RawValue, contentRole: ContentRole.RawValue, savedByUsers: [String], createdAt: Date, updatedAt: Date, publishDate: Date, category: UUID) {
        self.id = id
        self.title = title
        self.slug = slug
        self.intro = intro
        self.excerp = excerp
        self.content = content
        self.headerImage = headerImage
        self.author = author
        self.contentState = contentState
        self.contentRole = contentRole
        self.savedByUsers = savedByUsers
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.publishDate = publishDate
        self.$category.id = category
    }
}

