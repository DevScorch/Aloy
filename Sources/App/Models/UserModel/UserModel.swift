//
//  UserModel.swift
//  
//
//  Created by Johan Sas on 08/03/2022.
//

import Foundation
import Vapor
import Fluent

final class UserModel: Model, Content {
    
    // MARK: Database Schema
    static let schema = DatabaseSchemas.users.rawValue
    
    // MARK: Variabels
    
    @ID
    var id: UUID?

    @OptionalField(key: FieldKeys.name)
    var name: String?
    
    @OptionalField(key: FieldKeys.lastname)
    var lastname: String?
    
    @OptionalField(key: FieldKeys.lastname)
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
    
    @OptionalField(key: FieldKeys.address)
    var address: String?
    
    @OptionalField(key: FieldKeys.zip)
    var zip: String?
    
    @OptionalField(key: FieldKeys.country)
    var country: String?
    
    @OptionalField(key: FieldKeys.subscribedAt)
    var subscribedAt: Date?
    
    @OptionalField(key: FieldKeys.subscriptionEnd)
    var subscriptionEnd: Date?
    
    @Field(key: FieldKeys.userRole)
    var userRole: UserRole.RawValue
    
  // MARK: Empty init
    
    init() {}
    
  // MARK: Final init
    
    init(id: UUID? = nil, name: String?, lastname: String?, dateOfBirth: Date?, username: String, email: String, password: String, createdAt: Date, updatedAt: Date, address: String?, zip: String?, country: String?, subscribedAt: Date?, subscriptionEnd: Date?, userRole: UserRole.RawValue) {
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
    
    init(username: String, email: String, password: String, createdAt: Date, updatedAt: Date, userRole: UserRole.RawValue) {
        self.username = username
        self.password = password
        self.email = email
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.userRole = userRole
    }
    
    final class Public: Content {
        var id: UUID?
        var username: String
        var email: String
        var createdAt: Date
        var name: String?
        var updatedAt: Date
        
        init(id: UUID?, username: String, email: String, createdAt: Date, name: String?, updatedAt: Date) {
            self.id = id
            self.username = username
            self.email = email
            self.createdAt = createdAt
            self.name = name
            self.updatedAt = updatedAt
            
        }
    }
}

extension UserModel: Authenticatable {}

extension UserModel: ModelAuthenticatable {
    
    
    static let usernameKey = \UserModel.$email
    static let passwordHashKey = \UserModel.$password
    
    func verify(password: String) throws -> Bool {
        try Bcrypt.verify(password, created: self.password)
    }
}

extension UserModel: ModelSessionAuthenticatable {}
extension UserModel: ModelCredentialsAuthenticatable {}


extension UserModel {
    func convertToPublic() -> UserModel.Public {
        return UserModel.Public(id: id, username: username, email: email, createdAt: createdAt, name: name, updatedAt: updatedAt)
    }
}

extension EventLoopFuture where Value: UserModel {
    func convertToPublic() -> EventLoopFuture<UserModel.Public> {
        return self.map { user in
            return user.convertToPublic()
            
        }
    }
}

extension Collection where Element: UserModel {
    func convertToPublic() -> [UserModel.Public] {
        return self.map {
            $0.convertToPublic()
        }
    }
}

extension EventLoopFuture where Value == Array<UserModel> {
    func convertToPublic() -> EventLoopFuture<[UserModel.Public]> {
        return self.map {
            $0.convertToPublic()
        }
    }
}

