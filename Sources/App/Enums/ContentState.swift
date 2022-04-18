//
//  File.swift
//  
//
//  Created by Johan Sas on 08/03/2022.
//

import Foundation
import Fluent
import Vapor


enum ContentState: String, Equatable {
    case published
    case draft
    case saved
    case deleted
    case review 
}
