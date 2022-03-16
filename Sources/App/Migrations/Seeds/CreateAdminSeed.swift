//
//  File.swift
//  
//
//  Created by Johan Sas on 12/03/2022.
//

import Foundation
import Fluent
import Vapor

struct CreateAdminSeed: AsyncMigration {
    
    func prepare(on database: Database) async throws {
        let admin = UserModel(id: nil, name: "Johan", lastname: "Tsas", dateOfBirth: nil, username: "admin", email: "johan@devscorch.com", password: "Test12345", createdAt: Date(), updatedAt: Date(), address: nil, zip: nil, country: nil, subscribedAt: Date(), subscriptionEnd: Date(), userRole: UserRole.admin.rawValue)
            
        try await admin.create(on: database)
    }
    
    func revert(on database: Database) async throws {
        try await UserModel.query(on: database).delete()
    }
    
}
