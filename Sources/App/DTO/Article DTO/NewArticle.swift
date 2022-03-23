//
//  File.swift
//  
//
//  Created by Johan Sas on 23/03/2022.
//

import Foundation
import Vapor
import Fluent

struct NewArticle: Content {
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
