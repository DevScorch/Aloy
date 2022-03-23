//
//  File.swift
//
//
//  Created by Johan Sas on 20/03/2022.
//

import Foundation
import Fluent
import Vapor

struct DeleteSectionService {
    
    static func deleteSection(_ sectionID: String, _ req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let uuid = UUID(uuidString: sectionID)
        return SectionModel.find(uuid, on: req.db)
        .unwrap(or: Abort(.notFound))
        .flatMap { section in
            section.delete(on: req.db)
                .transform(to: .noContent)
        }
    }
}
