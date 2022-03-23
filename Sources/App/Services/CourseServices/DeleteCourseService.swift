//
//  File.swift
//  
//
//  Created by Johan Sas on 17/03/2022.
//

import Foundation
import Fluent
import Vapor

struct DeleteCourseService {
    
    static func deleteCourse(_ courseID: String, _ req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let uuid = UUID(uuidString: courseID)!
        return CourseModel.find(uuid, on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { course in
                course.delete(on: req.db)
                    .transform(to: .noContent)
            }
    }
}
