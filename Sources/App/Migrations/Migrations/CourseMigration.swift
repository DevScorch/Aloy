//
//  File.swift
//  
//
//  Created by Johan Sas on 11/03/2022.
//

import Foundation
import Fluent
import Vapor

struct CourseMigration: AsyncMigration {
    
    // MARK: Variables
    var dbSchema = CourseModel.schema
    var keys = CourseModel.FieldKeys.self
    
    func prepare(on database: Database) async throws {
        try await database.schema(dbSchema)
            .id()
            .field(keys.title, .string)
            .field(keys.updatedAt, .datetime)
            .field(keys.createdAt, .datetime, .required)
            .field(keys.publishDate, .datetime)
            .field(keys.contentState, .string)
            .field(keys.headerImage, .string)
            .field(keys.contentRole, .string, .required)
            .field(keys.article, .data)
            .field(keys.instructor, .string)
            .field(keys.shortDescription, .string)
            .field(keys.assetsURL, .string)
            .field(keys.sylabus, .string)
            .field(keys.description, .string)
            .field(keys.category, .uuid)
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database.schema(dbSchema).delete()
    }
}
