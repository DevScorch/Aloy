//
//  File.swift
//  
//
//  Created by Johan Sas on 20/03/2022.
//

import Foundation
import Fluent
import Vapor

struct CreateNewSectionService {
    
    static func createNewSection(_ newSection: NewSection, _ req: Request) throws -> EventLoopFuture<SectionModel> {
        let section = SectionModel(id: nil, title: newSection.title, sectionRole: newSection.sectionRole, createdAt: Date(), updatedAt: Date(), contentState: newSection.contentState, publishDate: newSection.publishDate, course: newSection.course)
        return section.save(on: req.db).map {
            section
        }
    }
}
