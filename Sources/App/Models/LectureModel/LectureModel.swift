//
//  File.swift
//  
//
//  Created by Johan Sas on 09/03/2022.
//

import Foundation
import Fluent
import CloudKit

final class LectureModel: Model {
    // MARK: Database Schema
    static let schema = DatabaseSchemas.lectures.rawValue
    
    // MARK: Variables
    
    @ID()
    var id: UUID?
    
    @Field(key: FieldKeys.title)
    var title: String?
    
    @Field(key: FieldKeys.mp4URL)
    var mp4URL: URL?
    
    @Field(key: FieldKeys.createdAt)
    var createdAt: Date
    
    @Field(key: FieldKeys.updatedAt)
    var updatedAt: Date
    
    @Field(key: FieldKeys.publishDate)
    var publishDate: Date
    
    @Field(key: FieldKeys.contentState)
    var contentState: ContentState
    
    @Field(key: FieldKeys.content)
    var content: String?
    
    @Parent(key: FieldKeys.section)
    var section: SectionModel
    
    init() {}
    
    init(id: UUID? = nil, title: String?, mp4URL: URL?, createdAt: Date, updatedAt: Date, publishDate: Date, contentState: ContentState, content: String?, section: SectionModel) {
        self.id = id
        self.title = title
        self.mp4URL = mp4URL
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.publishDate = publishDate
        self.contentState = contentState
        self.content = content
        self.$section.id = section
    }
}

extension LectureModel: Content {}
