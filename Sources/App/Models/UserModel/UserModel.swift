//
//  UserModel.swift
//  
//
//  Created by Johan Sas on 08/03/2022.
//

import Foundation
import Vapor
import Fluent

final class UserModel: Model {
    
    // MARK: Database Schema
    static let schema = DatabaseSchemas.users.rawValue
    
    // MARK: Variabels
    
    @ID
    var id: UUID?
    
    @Field(key: FieldKeys.name)
    var name: String?
    
    @Field(key: FieldKeys.lastname)
    var lastname: String?
    
    @Field(key: FieldKeys.lastname)
    var dateOfBirth: Date?
    
    @Field(key: FieldKeys.username)
    var username: String
    
    @Field(key: FieldKeys.email)
    var email: String
    
    @Field(key: FieldKeys.password)
    var password: String
    
    @Field(key: FieldKeys.createdAt)
    var createdAt: Date
    
    @Field(key: FieldKeys.updatedAt)
    var updatedAt: Date
    
    @Field(key: FieldKeys.address)
    var address: String?
    
    @Field(key: FieldKeys.zip)
    var zip: String?
    
    @Field(key: FieldKeys.country)
    var country: String?
    
    @Field(key: FieldKeys.subscribedAt)
    var subscribedAt: Date
    
    @Field(key: FieldKeys.subscriptionEnd)
    var subscriptionEnd: Date
    
    @Field(key: FieldKeys.userRole)
    var userRole: UserRole.RawValue
    
  // MARK: Empty init
    
    init() {}
    
  // MARK: Final init
    
    init(id: UUID? = nil, name: String?, lastname: String?, dateOfBirth: Date?, username: String, email: String, password: String, createdAt: Date, updatedAt: Date, address: String?, zip: String?, country: String?, subscribedAt: Date, subscriptionEnd: Date, userRole: UserRole.RawValue) {
        self.id = id
        self.name = name
        self.lastname = lastname
        self.dateOfBirth = dateOfBirth
        self.username = username
        self.email = email
        self.password = password
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.address = address
        self.zip = zip
        self.country = country
        self.subscribedAt = subscribedAt
        self.subscriptionEnd = subscriptionEnd
        self.userRole = userRole
    }
}

extension UserModel: Content {
    
}
