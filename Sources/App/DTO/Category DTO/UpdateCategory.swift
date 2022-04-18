//
//  File.swift
//  
//
//  Created by Johan Sas on 23/03/2022.
//

import Foundation
import Fluent
import Vapor

struct UpdateCategory: Content {
    let title: String
    let slug: String
    let headerImage: URL
}
