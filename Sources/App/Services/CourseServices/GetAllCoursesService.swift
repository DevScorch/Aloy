//
//  File.swift
//  
//
//  Created by Johan Sas on 17/03/2022.
//

import Foundation
import Fluent
import Vapor

struct GetAllCoursesService {
    
    static func retrieveAllCourses(_ req: Request) throws -> EventLoopFuture<[CourseModel]> {
        let contentState = ContentState.published.rawValue
        let user = try req.auth.require(UserModel.self)
    
        let userRetrievedCourses = CourseModel.query(on: req.db)
            .filter(\.$contentState == contentState)
            .sort(\.$createdAt)
            .all()
        
        let adminRetrievedCourses = CourseModel.query(on: req.db)
            .sort(\.$createdAt)
            .all()
        return user.userRole == UserRole.admin.rawValue ? adminRetrievedCourses : userRetrievedCourses
    }
}
