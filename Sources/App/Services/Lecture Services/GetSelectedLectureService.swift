//
//  File.swift
//  
//
//  Created by Johan Sas on 23/03/2022.
//

import Foundation
import Vapor
import Fluent

struct GetSelectedLectureService {
    
    static func getSelectedLecture(_ lectureID: String, _ req: Request) throws -> EventLoopFuture<LectureModel> {
        let uuid = UUID(uuidString: lectureID)!
        return LectureModel.query(on: req.db)
            .filter(\.$id = uuid)
            .first()
            .unwrap(or: Abort(.notFound))
    }
}
