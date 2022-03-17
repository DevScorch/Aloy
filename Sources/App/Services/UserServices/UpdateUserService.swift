//
//  File.swift
//  
//
//  Created by Johan Sas on 16/03/2022.
//

import Foundation
import Fluent
import Vapor

struct UpdateUserService {
    static func updateSelectedUser(_ userID: String, _ updatedUser: UpdateUser, _ req: Request) throws -> EventLoopFuture<UserModel.Public> {
        let uuid = UUID(uuidString: userID)
        return UserModel.find(uuid, on: req.db)
            .unwrap(or: Abort(.ok))
            .flatMap { user in
                user.name = updatedUser.name ?? user.name
                user.lastname = updatedUser.lastname ?? user.lastname
                user.address = updatedUser.address ?? user.address
                user.zip = updatedUser.zip ?? user.zip
                user.username = updatedUser.username ?? user.username
                user.email = updatedUser.email ?? user.email
                user.dateOfBirth = updatedUser.dateOfBirth ?? user.dateOfBirth
                user.updatedAt = Date()
                return user.save(on: req.db).map {
                    user.convertToPublic()
                }
            
                
        }
    }
}
