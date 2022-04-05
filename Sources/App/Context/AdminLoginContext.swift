//
//  File.swift
//  
//
//  Created by Johan Sas on 03/04/2022.
//

import Foundation
import Fluent
import Vapor

struct AdminLoginContext: Content {
    let title: String
    let emailField: String
    let passwordField: String
    let logoURL: String
}
