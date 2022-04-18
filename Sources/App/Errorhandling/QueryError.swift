//
//  File.swift
//  
//
//  Created by Johan Sas on 17/03/2022.
//

import Foundation
import Vapor

enum QueryErrors: AbortError {
    case notFound(Model)
    
    enum Model {
        case user(UUID)
    }
    
}

extension QueryErrors {
    var status: HTTPResponseStatus {
        switch self {
        case .notFound:
            return .notFound
        }
    }
    
    var reason: String {
        switch self {
        case .notFound(let model):
            return "Could not find \(model)"
        }
    }
    
    var identifier: String {
        switch self {
        case .notFound:
            return "not_found"
        }
    }
}
