import Fluent
import Vapor

func routes(_ app: Application) throws {
    
    // MARK: AuthGroups
    
    let basicAuth = UserModel.authenticator()
    let basicAuthGroup = app.grouped(basicAuth)
    
    // MARK: Token Auth Groups
    
    let tokenAuth = TokenModel.authenticator()
    let guardMiddleWare = UserModel.guardMiddleware()
    let tokenAuthGroup = app.grouped(tokenAuth, guardMiddleWare)
    
    
    
    
    // MARK: Controllers
    let userController = UserController()
    
    
    // MARK: User Routed
    basicAuthGroup.post("\(API.users.rawValue)", "\(Endpoints.create.rawValue)", use: userController.createUser)
    app.routes.get("\(API.users.rawValue)", use: userController.rerieveAllUsers)
    tokenAuthGroup.get("\(API.users.rawValue)", ":userID", use: userController.retrieveSelectedUser)
    app.routes.delete("\(API.users.rawValue)", "\(Endpoints.delete)", ":userID", use: userController.deleteSelectedUser)
    app.routes.patch("\(API.users.rawValue)", "\(Endpoints.update)", ":userID", use: userController.updateUser)
    
}
