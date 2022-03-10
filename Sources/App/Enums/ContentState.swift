//
//  File.swift
//  
//
//  Created by Johan Sas on 08/03/2022.
//

import Foundation

enum ContentState: String, Equatable, Content {
    case published
    case draft
    case saved
    case deleted
    case review 
}
