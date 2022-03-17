//
//  File.swift
//  
//
//  Created by Johan Sas on 17/03/2022.
//

import Foundation
import Fluent
import Vapor

struct CreateNewCourseService {
    
    static func createNewCourse(_ createCourse: CreateCourse, _ req: Request) throws -> EventLoopFuture<CourseModel> {
        let user = try req.auth.require(UserModel.self)
        let instructorName = user.name
        let instructorLastName = user.lastname
        let fullName = "\(instructorName) \(instructorLastName)"
        
        let course = CourseModel(id: nil, title: createCourse.title, description: createCourse.description, shortDescription: createCourse.shortDescription, headerImage: createCourse.headerImage, article: createCourse.article, sylabus: createCourse.sylabus, assetsURL: createCourse.assetsURL, contentState: createCourse.contentState, publishDate: createCourse.publishDate, contentRole: ContentRole.course.rawValue, createdAt: Date(), updatedAt: Date(), instructor: fullName, category: createCourse.category)
        return course.save(on: req.db).map {
            course
        }
    }
}
