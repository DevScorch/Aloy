//
//  File.swift
//  
//
//  Created by Johan Sas on 23/03/2022.
//

import Foundation
import Vapor
import Fluent

struct LectureController {
    
    // MARK: Create new Lecture
    
    func createNewLecture(_ req: Request) throws -> EventLoopFuture<LectureModel> {
        let newLecture = try req.content.decode(NewLecture.self)
        return try CreateLectureService.createNewLecture(newLecture, req)
    }
    
    // MARK: Get Selected Lecture
    
    func getSelectedLecture(_ req: Request) throws -> EventLoopFuture<LectureModel> {
        let lectureID = try req.parameters.get("lectureID")
        return try GetSelectedLectureService.getSelectedLecture(lectureID, req )
    }
    
    // MARK: Delete Selected Lecture
    
    func deleteLecture(_ req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let lectureID = try req.parameters.get("lectureID")
        return try DeleteLectureService.deleteLecture(lectureID, req)
    }
    
    // MARK: Update seected lecture
    
    func updateLecture(_ req: Request) throws -> EventLoopFuture<LectureModel> {
        let lectureID = try req.parameters.get("lectureID")
        let updatedLecture = try req.content.decode(UpdateLecture.self)
        return try UpdateLectureService.updateLecture(lectureID, updatedLecture, req)
    }
    
}
