//
//  File.swift
//  
//
//  Created by Johan Sas on 16/03/2022.
//

import Foundation
import Fluent
import Vapor

struct UserController {
    
    // MARK: This creates a new User
    func createUser(_ req: Request) throws -> EventLoopFuture<UserModel.Public> {
        let newUser = try req.content.decode(NewUser.self)
        return try CreateNewUserService.createNewUser(newUser, req)
    }
    
    // MARK: This returns a list of all users
    
    func rerieveAllUsers(_ req: Request) throws -> EventLoopFuture<[UserModel.Public]> {
        return try GetAllUsersService.retrieveAllUsers(req)
    }
    
    // MARK: This returns a selected User
    
    func retrieveSelectedUser(_ req: Request) throws -> EventLoopFuture<UserModel.Public> {
        let userID = req.parameters.get("userID" )
        return try GetSelectedUserService.getSelectedUser(userID!, req)
    }
    
}
