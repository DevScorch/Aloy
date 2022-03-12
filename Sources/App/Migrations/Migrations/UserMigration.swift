//
//  File.swift
//  
//
//  Created by Johan Sas on 11/03/2022.
//

import Foundation
import Fluent
import Vapor

struct UserMigration: AsyncMigration {
    
    // MARK: Variables
    var dbSchema = UserModel.schema
    var keys = UserModel.FieldKeys.self
    
    func prepare(on database: Database) async throws {
        try await database.schema(dbSchema)
            .id()
            .field(keys.name, .string)
            .field(keys.lastname, .string)
            .field(keys.email, .string, .required)
            .field(keys.password, .string, .required)
            .field(keys.createdAt, .datetime, .required)
            .field(keys.updatedAt, .datetime)
            .field(keys.address, .string)
            .field(keys.country, .string)
            .field(keys.zip, .string)
            .field(keys.dateOfBirth, .datetime)
            .field(keys.subscribedAt, .datetime)
            .field(keys.userRole, .string)
            .field(keys.username, .string, .required)
            .unique(on: keys.username)
            .unique(on: keys.email)
            .create()
        
    }
    
    func revert(on database: Database) async throws {
        try await database.schema(dbSchema).delete()
    }
}
