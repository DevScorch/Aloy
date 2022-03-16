//
//  File.swift
//  
//
//  Created by Johan Sas on 16/03/2022.
//

import Foundation
import Fluent
import Vapor

struct GetSelectedUserService {
    
    static func getSelectedUser(_ userID: String, _ req: Request) throws -> EventLoopFuture<UserModel.Public> {
        let uuid = UUID(uuidString: userID)!
        let user = try UserModel.query(on: req.db)
            .filter(\.$id == uuid)
            .first()
            .unwrap(or: Abort(.notFound))
        
        return user.map { user in
            return user.convertToPublic()
        }
    }
}
