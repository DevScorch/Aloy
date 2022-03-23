//
//  File.swift
//  
//
//  Created by Johan Sas on 23/03/2022.
//

import Foundation
import Fluent
import Vapor

struct UpdateLecture: Content {
    let title: String?
    let mp4URL: URL?
    let publishDate: Date?
    let contentState: ContentState.RawValue?
    let content: String?
    let section: SectionModel?
}
