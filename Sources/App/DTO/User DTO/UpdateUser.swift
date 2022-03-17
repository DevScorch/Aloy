//
//  File.swift
//  
//
//  Created by Johan Sas on 16/03/2022.
//

import Foundation
import Fluent
import Vapor

struct UpdateUser: Content {
    let name: String?
    let lastname: String?
    let dateOfBirth: Date?
    let username: String?
    let email: String?
    let address: String?
    let zip: String?
    let country: String?
    
    init(name: String?, lastname: String?, dateOfBirth: Date?, username: String?, email: String?, address: String?, zip: String?, country: String? ) {
        self.name = name
        self.lastname = lastname
        self.dateOfBirth = dateOfBirth
        self.username = username
        self.email = email
        self.address = address
        self.zip = zip
        self.country = country 
    }
}
