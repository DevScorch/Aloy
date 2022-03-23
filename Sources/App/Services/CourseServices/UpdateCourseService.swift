//
//  File.swift
//  
//
//  Created by Johan Sas on 17/03/2022.
//

import Foundation
import Vapor
import Fluent

struct UpdateCourseService {
    
    static func updateSelectedCourse(_ courseID: String, updatedCourse: UpdateCourse, _ req: Request) throws -> EventLoopFuture<CourseModel> {
            let uuid = UUID(uuidString: courseID)
        return CourseModel.find(uuid, on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { course in
                course.title = updatedCourse.title ?? course.title
                course.description = updatedCourse.description ?? course.description
                course.shortDescription = updatedCourse.shortDescription ?? course.shortDescription
                course.headerImage = updatedCourse.headerImage ?? course.headerImage
                course.article = updatedCourse.article ?? course.article
                course.sylabus = updatedCourse.sylabus ?? course.sylabus
                course.assetsURL = updatedCourse.assetsURL ?? course.assetsURL
                course.contentState = updatedCourse.contentState ?? course.contentState
                course.publishDate = updatedCourse.publishDate ?? course.publishDate
                course.contentRole = updatedCourse.contentRole ?? course.contentRole
                course.updatedAt = Date()
//                course.category = updatedCourse.category ?? course.category
                
                return course.save(on: req.db).map {
                    course
                }
            }
    }
}
