//
//  File.swift
//  
//
//  Created by Johan Sas on 03/04/2022.
//

import Foundation
import Vapor
import Fluent

struct DashboardController {
    
    func renderAdminIndex(_ req: Request) async throws -> View {
            let users = try await UserModel.query(on: req.db)
                .all()
                .flatMap { user in
                    return user.convertToPublic()
                }
            
            let courses = try await CourseModel.query(on: req.db)
                .count()
            
            let lectures = try await LectureModel.query(on: req.db)
                .count()
        
            let activeSubscriptions = try await UserModel.query(on: req.db)
                .filter(\.$userRole == UserRole.student.rawValue)
                .count()
                
            let totalUsers = try await UserModel.query(on: req.db)
                .count()
                
            let context = DashboardContext(title: totalTitle + dashboard, logoURL: "", users: users, courses: courses, lectures: lectures, activeSubscriptions: activeSubscriptions, totalUsers: totalUsers)
            print(context)
            return try await req.view.render("aloy-admin/index", context)
    } 
}
