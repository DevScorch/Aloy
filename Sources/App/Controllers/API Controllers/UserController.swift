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
        try UserModel.Access.require(.admin, on: req)
        return try GetAllUsersService.retrieveAllUsers(req)
    }
    
    // MARK: This returns a selected User
    
    func retrieveSelectedUser(_ req: Request) throws -> EventLoopFuture<UserModel.Public> {
        let userID = req.parameters.get("userID" )
        return try GetSelectedUserService.getSelectedUser(userID!, req)
    }
    
    // MARK: This function deletes the selected user
    
    func deleteSelectedUser(_ req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let userID = req.parameters.get("userID")!
        return try DeleteUserService.deleteSelectedUser(userID, req)
    }
    
    // MARK: This function updates the selected User
    
    func updateUser(_ req: Request) throws -> EventLoopFuture<UserModel.Public> {
        let userID = req.parameters.get("userID")!
        let updatedUser = try req.content.decode(UpdateUser.self)
        return try UpdateUserService.updateSelectedUser(userID, updatedUser, req)
    }
    
    // MARK: Login the user with a Token
    
    func tokenLogin(_ req: Request) throws -> EventLoopFuture<TokenModel>{
        let user = try req.auth.require(UserModel.self)
        return try UserLoginService.loginUser(user, req)
    }
    
}
