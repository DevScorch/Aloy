//
//  File.swift
//  
//
//  Created by Johan Sas on 17/03/2022.
//

import Foundation
import Vapor
import Fluent

struct LoginUser: Content {
    let email: String
    let password: String
}


