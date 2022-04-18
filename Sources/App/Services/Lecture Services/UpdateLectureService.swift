//
//  File.swift
//  
//
//  Created by Johan Sas on 23/03/2022.
//

import Foundation
import Vapor
import Fluent

struct UpdateLectureService {
    
    static func updateLecture(_ lectureID: String,_ updateLecture: UpdateLecture, _ req: Request) throws -> EventLoopFuture<LectureModel> {
        let uuid = UUID(uuidString: lectureID)
        return LectureModel.find(uuid, on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { lecture in
                
                lecture.title = updateLecture.title ?? lecture.title
                lecture.mp4URL = updateLecture.mp4URL ?? lecture.mp4URL
                lecture.publishDate = updateLecture.publishDate ?? lecture.publishDate
                lecture.contentState = updateLecture.contentState ?? lecture.contentState
                lecture.content = updateLecture.content ?? lecture.content
                lecture.section = updateLecture.section ?? lecture.section
                
                return lecture.save(on: req.db).map {
                    lecture
                }
                
            }
    }
}
