//
//  File.swift
//  
//
//  Created by Johan Sas on 17/03/2022.
//

import Foundation
import Fluent
import Vapor

struct GetSelectedCourseService {
    
    static func getSelectedCourse(_ courseID: String, _ req: Request) throws -> EventLoopFuture<CourseModel> {
        let uuid = UUID(uuidString: courseID)!
        let contentState = ContentState.published.rawValue
        let course = CourseModel.query(on: req.db)
            .filter(\.$id == uuid)
            .filter(\.$contentState == contentState)
            .first()
            .unwrap(or: Abort(.notFound))
        return course
    }
}
