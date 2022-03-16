import Fluent
import Vapor

func routes(_ app: Application) throws {
    
    // MARK: Controllers
    let userController = UserController()
    
    
    // MARK: User Routed
    app.routes.post("\(API.users.rawValue)", "\(Endpoints.create.rawValue)", use: userController.createUser)
    app.routes.get("\(API.users.rawValue)", use: userController.rerieveAllUsers)
    app.routes.get("\(API.users.rawValue)", ":userID", use: userController.retrieveSelectedUser)
    
}
