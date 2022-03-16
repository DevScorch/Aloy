//
//  File.swift
//  
//
//  Created by Johan Sas on 16/03/2022.
//

import Foundation
import Fluent
import Vapor

struct GetAllUsersService {
    
    static func retrieveAllUsers(_ req: Request) throws -> EventLoopFuture<[UserModel.Public]> {
        let users = UserModel.query(on: req.db)
            .all()
        return users.map { users in
            return users.convertToPublic()
        }
    }
}
