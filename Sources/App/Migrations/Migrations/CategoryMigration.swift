//
//  File.swift
//  
//
//  Created by Johan Sas on 11/03/2022.
//

import Foundation
import Fluent
import Vapor

struct CategoryMigration: AsyncMigration {
    
    // MARK: Variables
    var dbSchema = CategoryModel.schema
    var keys = CategoryModel.FieldKeys.self
    
    func prepare(on database: Database) async throws {
        try await database.schema(dbSchema)
            .id()
            .field(keys.title, .string, .required)
            .field(keys.slug, .string, .required)
            .field(keys.headerImage, .string, .required)
            .foreignKey(ArticleModel.FieldKeys.category, references: dbSchema, .id, onDelete: DatabaseSchema.ForeignKeyAction.setNull, onUpdate: .cascade)
            .unique(on: keys.slug)
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database.schema(dbSchema).delete()
        try await database.schema(ArticleModel.schema).delete()
    }
}
