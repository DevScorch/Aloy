//
//  File.swift
//  
//
//  Created by Johan Sas on 17/03/2022.
//

import Foundation
import Vapor

extension UserModel {
    struct Access {
        static func require(_ userRoles: UserRole..., on req: Request) throws {
            let user = try req.auth.require(UserModel.self)
            if user.userRole == UserRole.admin.rawValue {return} else {

            }
        }
    }
}
