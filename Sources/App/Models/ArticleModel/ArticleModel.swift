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
    
    @OptionalField(key: FieldKeys.title)
    var title: String?
    
    @OptionalField(key: FieldKeys.slug)
    var slug: String?
    
    @OptionalField(key: FieldKeys.intro)
    var intro: String?
    
    @OptionalField(key: FieldKeys.excerp)
    var excerp: String?
    
    @OptionalField(key: FieldKeys.content)
    var content: String?
    
    @Parent(key: FieldKeys.categories)
    var categories: CategoryModel
    
    @OptionalField(key: FieldKeys.headerImage)
    var headerImage: URL?
    
    @OptionalField(key: FieldKeys.author)
    var author: String?
    
    @Field(key: FieldKeys.contentState)
    var contentState: ContentState.RawValue
    
    @Field(key: FieldKeys.contentRole)
    var contentRole: ContentRole.RawValue
    
    @OptionalField(key: FieldKeys.savedByUsers)
    var savedByUsers: [String]?
    
    @Field(key: FieldKeys.createdAt)
    var createdAt: Date?
    
    @Field(key: FieldKeys.updatedAt)
    var updatedAt: Date?
    
    @OptionalField(key: FieldKeys.publishDate)
    var publishDate: Date?
    
    init() {}
    
    init(id: UUID? = nil, title: String?, slug: String?, intro: String, excerp: String?, content: String?, headerImage: URL?, author: String?, contentState: ContentState.RawValue, contentRole: ContentRole.RawValue, savedByUsers: [String]?, createdAt: Date, updatedAt: Date, publishDate: Date, categories: UUID) {
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
        self.$categories.id = categories
    }
}

