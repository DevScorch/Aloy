//
//  File.swift
//  
//
//  Created by Johan Sas on 23/03/2022.
//

import Foundation
import Fluent
import Vapor

struct CreateLectureService {
    
    static func createNewLecture(_ newLecture: NewLecture, _ req: Request) throws -> EventLoopFuture<LectureModel> {
        let lecture = LectureModel(title: newLecture.title, mp4URL: newLecture.mp4URL, createdAt: Date(), updatedAt: Date(), publishDate: newLecture.publishDate, contentState: newLecture.contentState, content: newLecture.content, section: newLecture.section)
        return lecture.save(on: req.db).map {
            lecture
        }
    }
}
