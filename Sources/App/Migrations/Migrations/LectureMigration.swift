//
//  File.swift
//  
//
//  Created by Johan Sas on 12/03/2022.
//

import Foundation
import Fluent

struct LectureMigration: AsyncMigration {
    // MARK: Variables
    
    var dbSchema = LectureModel.schema
    var keys = LectureModel.FieldKeys.self
    
    func prepare(on database: Database) async throws {
        try await database.schema(dbSchema)
            .id()
            .field(keys.title, .string)
            .field(keys.contentState, .string, .required)
            .field(keys.publishDate, .datetime)
            .field(keys.createdAt, .datetime, .required)
            .field(keys.updatedAt, .datetime)
            .field(keys.content, .data)
            .field(keys.mp4URL, .string)
            .field(keys.section, .uuid)
            .unique(on: keys.mp4URL)
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database.schema(dbSchema).delete()
    }
}
