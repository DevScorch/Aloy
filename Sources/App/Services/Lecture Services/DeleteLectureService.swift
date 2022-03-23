//
//  File.swift
//  
//
//  Created by Johan Sas on 23/03/2022.
//

import Foundation
import Fluent
import Vapor

struct DeleteLectureService {
    
    static func deleteLecture(_ lectureID: String, _ req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let uuid = UUID(uuidString: lectureID)
        
        return LectureModel.find(uuid, on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { lecture in
                lecture.delete(on: req.db)
                    .transform(to: .noContent)
                
            }
    }
}
