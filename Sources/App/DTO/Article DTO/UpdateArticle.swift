//
//  File.swift
//  
//
//  Created by Johan Sas on 02/04/2022.
//

import Foundation
import Vapor
import Fluent

struct UpdateArticle: Content {
    let title: String?
    let slug: String?
    let intro: String?
    let excerp: String?
    let content: String?
    let category: CategoryModel.IDValue
    let headerImage: URL?
    let contentState: ContentState.RawValue
    let contentRole: ContentRole.RawValue
    let publishDate: Date?
}
