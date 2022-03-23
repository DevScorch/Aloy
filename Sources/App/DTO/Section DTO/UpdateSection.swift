//
//  File.swift
//  
//
//  Created by Johan Sas on 20/03/2022.
//


import Foundation
import Fluent
import Vapor

struct UpdateSection: Content {
    let title: String
    let sectionRole: SectionRole.RawValue
    let contentState: ContentState.RawValue
    let publishDate: Date?
    let course: CourseModel
}
