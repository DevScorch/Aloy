//
//  UserRole.swift
//  
//
//  Created by Johan Sas on 08/03/2022.
//

import Foundation
import Fluent
import Vapor 

enum UserRole: String, Equatable {
    case admin
    case moderator
    case instructor
    case user
    case student
}
