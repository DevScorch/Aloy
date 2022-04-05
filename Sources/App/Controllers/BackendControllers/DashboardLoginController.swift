//
//  File.swift
//  
//
//  Created by Johan Sas on 03/04/2022.
//

import Foundation
import Vapor
import Fluent

struct DashboardLoginController {
    
    func renderAdminLoginView(_ req: Request) async throws -> View {
        let context: LoginContext
        
        if let error = req.query[Bool.self, at: "error"], error {
            context = LoginContext(loginError: false)
        } else {
            context = LoginContext()
        }
        return try await req.view.render("aloy-admin/login", context)
    }
}
