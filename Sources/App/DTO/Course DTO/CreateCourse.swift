//
//  File.swift
//  
//
//  Created by Johan Sas on 17/03/2022.
//

import Foundation
import Fluent
import Vapor

struct NewCourse: Content {
    let title: String?
    let description: String?
    let shortDescription: String?
    let headerImage: URL?
    let article: String?
    let sylabus: URL?
    let assetsURL: URL?
    let contentState: ContentState.RawValue
    let publishDate: Date?
    let contentRole: ContentRole.RawValue
    let category: CategoryModel.IDValue
}
