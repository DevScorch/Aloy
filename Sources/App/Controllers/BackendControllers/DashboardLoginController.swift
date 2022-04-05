//
//  File.swift
//  
//
//  Created by Johan Sas on 03/04/2022.
//

import Foundation
import Vapor
import Fluent
import AsyncHTTPClient

struct DashboardLoginController {
    
    func renderAdminLoginView(_ req: Request) async throws -> View {
        let context: LoginContext
        
        if let error = req.query[Bool.self, at: "error"], error {
            context = LoginContext(loginError: true)
            return try await req.view.render("/aloy-admin/login", context)
        } else {
            let context = AdminLoginContext(title: "Devscorch 4.0 | Login", emailField: "email", passwordField: "password", logoURL: "/images/logo.png")
            return try await req.view.render("/aloy-admin/index", context)
        }
    }
    

}
