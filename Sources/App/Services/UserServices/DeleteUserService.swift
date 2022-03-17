//
//  File.swift
//  
//
//  Created by Johan Sas on 16/03/2022.
//

import Fluent
import Vapor
import Foundation

struct DeleteUserService {
    
    static func deleteSelectedUser(_ userID: String, _ req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let uuid = UUID(uuidString: userID)!
        return UserModel.find(uuid, on: req.db)
            .unwrap(or: QueryErrors.notFound(.user(uuid)))
            .flatMap { user in
                user.delete(on: req.db)
                    .transform(to: .noContent)

            }
    }
}
