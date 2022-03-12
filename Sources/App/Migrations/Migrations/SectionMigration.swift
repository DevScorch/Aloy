//
//  File.swift
//  
//
//  Created by Johan Sas on 11/03/2022.
//

import Foundation
import Fluent
import Vapor

struct SectionMigration: AsyncMigration {
    
    // MARK: Variables
    
    var dbSchema = SectionModel.schema
    var keys = SectionModel.FieldKeys.self
    
    func prepare(on database: Database) async throws {
        try await database.schema(dbSchema)
            .id()
            .field(keys.title, .string)
            .field(keys.contentState, .string, .required)
            .field(keys.createdAt, .datetime, .required)
            .field(keys.publishDate, .datetime)
            .field(keys.sectionRole, .string)
            .field(keys.updatedAt, .datetime)
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database.schema(dbSchema).delete()
    }
}
