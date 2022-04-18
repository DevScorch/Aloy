//
//  File.swift
//  
//
//  Created by Johan Sas on 17/03/2022.
//

import Foundation
import Fluent
import Vapor

struct LoginService {
    
    static func loginPost(_ req: Request) throws -> EventLoopFuture<Response> {
        if req.auth.has(UserModel.self) {
            return req.eventLoop.future(req.redirect(to: "/"))
        } else {
            let context = LoginContext(loginError: true)
            return req.view.render("login", context).encodeResponse(for: req)
        }
    }
    
}
