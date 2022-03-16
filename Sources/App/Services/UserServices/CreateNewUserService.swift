//
//  File.swift
//  
//
//  Created by Johan Sas on 16/03/2022.
//

import Foundation
import Fluent
import Vapor

struct CreateNewUserService {
    
    static func createNewUser(_ newUser: NewUser, _ req: Request) throws -> EventLoopFuture<UserModel.Public> {
        let user = UserModel(username: newUser.username, email: newUser.email, password: try Bcrypt.hash(newUser.password), createdAt: Date(), updatedAt: Date(), userRole: UserRole.user.rawValue)
        
        return user.save(on: req.db).map { new in
            return user.convertToPublic()
        }
    }
    
   
}

