//
//  File.swift
//  
//
//  Created by Johan Sas on 16/03/2022.
//

import Foundation

enum API: String, Equatable {
    case users = "users"
    case courses = "courses"
    case course = "course"
    case sections = "sections"
    case lectures = "lectures"
    case categories = "categories"
    case login = "login"
}

enum Endpoints: String, Equatable {
    case create = "create"
    case login = "login"
    case update = "update"
    case delete = "delete"
}
