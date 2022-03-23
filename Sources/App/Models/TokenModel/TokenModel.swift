//
//  File.swift
//  
//
//  Created by Johan Sas on 17/03/2022.
//

import Foundation
import Fluent
import Vapor

final class TokenModel: Model, Content {
    static let schema = DatabaseSchemas.tokens.rawValue
    
    @ID
    var id: UUID?
    
    @Field(key: FieldKeys.value)
    var value: String
    
    @Parent(key: FieldKeys.userID)
    var userID: UserModel
    
    init() {
        
    }
    
    init(id: UUID? = nil, value: String, userID: UserModel.IDValue) {
        self.id = id
        self.value = value
        self.$userID.id = userID
    }
}
extension TokenModel {
    static func generate(for user: UserModel) throws -> TokenModel {
        let random = [UInt8].random(count: 16).base64
        return try TokenModel(value: random, userID: user.requireID())
    }
}

extension TokenModel: ModelTokenAuthenticatable {
    static var valueKey = \TokenModel.$value
    static var userKey = \TokenModel.$userID
    
    typealias User = App.UserModel
    
    var isValid: Bool {
        true 
    }
}
