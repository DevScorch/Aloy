//
//  File.swift
//  
//
//  Created by Johan Sas on 11/03/2022.
//

import Foundation
import Fluent
import Vapor

struct ArticleMigration: AsyncMigration {
    
    // MARK: Variables
    
    var dbSchema = ArticleModel.schema
    var keys = ArticleModel.FieldKeys.self
    
    func prepare(on database: Database) async throws {
        try await database.schema(dbSchema)
            .id()
            .field(keys.title, .string)
            .field(keys.contentState, .string)
            .field(keys.publishDate, .datetime)
            .field(keys.contentRole, .string)
            .field(keys.updatedAt, .datetime)
            .field(keys.createdAt, .datetime, .required)
            .field(keys.headerImage, .string)
            .field(keys.content, .data)
            .field(keys.author, .string)
            .field(keys.excerp, .string)
            .field(keys.intro, .string)
            .field(keys.savedByUsers, .array)
            .field(keys.slug, .string)
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database.schema(dbSchema).delete()
    }
}
