//
//  File.swift
//  
//
//  Created by Johan Sas on 09/03/2022.
//

import Foundation
import Fluent
import CloudKit

final class SectionModel: Model {
    // MARK: Database schema
    static let schema = DatabaseSchemas.sections.rawValue
    
    // MARK: Variables
    
    @ID()
    var id: UUID?
    
    @Field(key: FieldKeys.title)
    var title: String
    
    @Field(key: FieldKeys.sectionRole)
    var sectionRole: SectionRole
    
    @Field(key: FieldKeys.createdAt)
    var createdAt: Date
    
    @Field(key: FieldKeys.updatedAt)
    var updatedAt: Date
    
    @Field(key: FieldKeys.contentState)
    var contentState: ContentState
    
    @Field(key: FieldKeys.publishDate)
    var publishDate: Date?
    
    @Parent(key: FieldKeys.course)
    var course: CourseModel
    
    @Children(for: \.$lectures)
    var lectures: [LectureModel]
    
    init() {}
    
    init(id: UUID? = nil, title: String, sectionRole: SectionRole, createdAt: Date, updatedAt: Date, contentState: ContentState, publishDate: Date?, course: CourseModel ) {
        self.id = id
        self.title = title
        self.sectionRole = sectionRole
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.contentState = contentState
        self.publishDate = publishDate
        self.#course.id = course
    }
    
}

extension SectionModel: Content {}
