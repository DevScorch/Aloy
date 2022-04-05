//
//  File.swift
//  
//
//  Created by Johan Sas on 03/04/2022.
//

import Foundation
import Fluent
import Vapor

struct DashboardContext: Content {
    let title: String
    let logoURL: String 
    let users: [UserModel.Public]
    let courses: [CourseModel]
    let lectures: [LectureModel]
    let activeSubscriptions: Int
    let totalUsers: Int
    
}
