//
//  File.swift
//  
//
//  Created by Johan Sas on 20/03/2022.
//

import Foundation
import Vapor
import Fluent

struct UpdateSectionService {
    
    static func updateSection(_ sectionID: String, _ updateSection: UpdateSection, _ req: Request) throws -> EventLoopFuture<SectionModel> {
        let uuid = UUID(uuidString: sectionID)!
        
        return SectionModel.find(uuid, on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { section in
                section.title = updateSection.title ?? section.title
                section.sectionRole = updateSection.sectionRole
                section.updatedAt = Date()
                section.contentState = updateSection.contentState
                section.publishDate = updateSection.publishDate ?? section.publishDate
                section.course = updateSection.course 
                return section.save(on: req.db).map {
                    section
                }
            }
    }
}
