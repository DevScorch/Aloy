//
//  File.swift
//  
//
//  Created by Johan Sas on 17/03/2022.
//

import Foundation
import Fluent
import Vapor

struct TokenMigration: AsyncMigration {
    
    // MARK: Variables
    
    let dbSchema = TokenModel.schema
    let keys = TokenModel.FieldKeys.self
    
    func prepare(on database: Database) async throws {
        try await database.schema(dbSchema)
            .id()
            .field(keys.value, .string)
            .field(keys.userID, .uuid, .required, .references(UserModel.schema, "id", onDelete: .cascade))
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database.schema(dbSchema).delete()
    }
    
}
