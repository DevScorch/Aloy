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
        let courses = CourseModel.query(on: req.db)
            .all()
        
        return courses
    }
}
