//
//  File.swift
//  
//
//  Created by Johan Sas on 16/03/2022.
//

import Foundation
import Fluent
import Vapor

struct NewUser: Content {
    let username: String
    let email: String
    let password: String
}
