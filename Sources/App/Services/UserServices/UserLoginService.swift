//
//  File.swift
//  
//
//  Created by Johan Sas on 17/03/2022.
//

import Foundation
import Fluent
import Vapor

struct UserLoginService {
    
    static func loginUser(_ user: UserModel, _ req: Request) throws -> EventLoopFuture<TokenModel> {
        let token = try TokenModel.generate(for: user)
        return token.save(on: req.db).map {
            token
        }
    }
}
