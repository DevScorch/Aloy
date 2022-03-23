//
//  File.swift
//  
//
//  Created by Johan Sas on 23/03/2022.
//

import Foundation
import Fluent
import Vapor

struct CourseController {
    
    // MARK: Create a new Course
    
    func createCourse(_ req: Request) throws -> EventLoopFuture<CourseModel> {
        try UserModel.Access.require(.admin, on: req)
        let createCourse = try req.content.decode(NewCourse.self)
        return try CreateNewCourseService.createNewCourse(createCourse, req)
    }
    
    // MARK: Get the selected Course
    
    func getSelectedCourse(_ req: Request) throws -> EventLoopFuture<CourseModel> {
        let courseID = try req.parameters.get("courseID")!
        return try GetSelectedCourseService.getSelectedCourse(courseID, req)
    }
    
    // MARK: Get all courses
    
    func getAllCourses(_ req: Request) throws -> EventLoopFuture<[CourseModel]> {
        return try GetAllCoursesService.retrieveAllCourses(req)
    }
    
    // MARK: Update selected course
    
    func updateCourse(_ req: Request) throws -> EventLoopFuture<CourseModel> {
        try UserModel.Access.require(.admin, on: req)
        let courseID = try req.parameters.get("courseID")!
        let updatedCourse = try req.content.decode(UpdateCourse.self)
        return try UpdateCourseService.updateSelectedCourse(courseID, updatedCourse: updatedCourse, req)
    }
    
    // MARK: Delete selected course
    
    func deleteCourse(_ req: Request) throws -> EventLoopFuture<HTTPStatus> {
        try UserModel.Access.require(.admin, on: req)
        let courseID = try req.parameters.get("courseID")!
        return try DeleteCourseService.deleteCourse(courseID, req)
    }
}
