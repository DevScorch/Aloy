//
//  File.swift
//  
//
//  Created by Johan Sas on 23/03/2022.
//

import Foundation
import Vapor
import Fluent


struct SectionController {
    
    // MARK: Create new Section
    
    func createNewSection(_ req: Request) throws -> EventLoopFuture<SectionModel> {
        try UserModel.Access.require(.admin, on: req)
        let newSection = try req.content.decode(NewSection.self)
        return try CreateNewSectionService.createNewSection(newSection, req)
    }
    
   
    
    // MARK: Delete selected Section
    
    func deleteSection(_ req: Request) throws -> EventLoopFuture<HTTPStatus> {
        try UserModel.Access.require(.admin, on: req)
        let sectionID = try req.parameters.get("sectionID")
        return try DeleteSectionService.deleteSection(sectionID!, req)
    }
    
    // MARK: Update selected Section
    
    func updateSection(_ req: Request) throws -> EventLoopFuture<SectionModel> {
        try UserModel.Access.require(.admin, on: req)
        let sectionID = try req.parameters.get("sectionID")
        let updatedSection = try req.content.decode(UpdateSection.self)
        return try UpdateSectionService.updateSection(sectionID!, updatedSection, req)
    }
}
