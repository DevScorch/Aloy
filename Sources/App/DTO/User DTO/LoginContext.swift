//
//  File.swift
//  
//
//  Created by Johan Sas on 17/03/2022.
//

import Foundation
import Vapor
import Fluent

struct LoginContext: Encodable {
    let title = "Log in"
    let loginError: Bool
    
    init(loginError: Bool = false) {
        self.loginError = loginError
    }
}
