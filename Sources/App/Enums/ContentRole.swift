//
//  File.swift
//  
//
//  Created by Johan Sas on 08/03/2022.
//

import Foundation
import Fluent
import Vapor

enum ContentRole: String, Equatable, Encodable {
    case article
    case course
    case podcast
    case tutorial
    case ebook
}
