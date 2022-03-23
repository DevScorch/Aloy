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
    let courseController = CourseController()
    let lectureController = LectureController()
    let sectionController = SectionController()
    let categoryController = CategoryController()
    
    
    // MARK: User endpoints
    basicAuthGroup.post("\(API.users.rawValue)", "\(Endpoints.create.rawValue)", use: userController.createUser)
    basicAuthGroup.get("\(API.users.rawValue)", use: userController.rerieveAllUsers)
    basicAuthGroup.post("\(API.login.rawValue)", use: userController.tokenLogin)
    
    tokenAuthGroup.get("\(API.users.rawValue)", ":userID", use: userController.retrieveSelectedUser)
    tokenAuthGroup.delete("\(API.users.rawValue)", "\(Endpoints.delete)", ":userID", use: userController.deleteSelectedUser)
    tokenAuthGroup.patch("\(API.users.rawValue)", "\(Endpoints.update)", ":userID", use: userController.updateUser)
    
    // MARK: Course endpoints
    
    tokenAuthGroup.post("\(API.courses.rawValue)", "\(Endpoints.create.rawValue)", use: courseController.createCourse)
    basicAuthGroup.get("\(API.courses.rawValue)", use: courseController.getAllCourses)
    basicAuthGroup.get("\(API.course.rawValue)", ":courseID", use: courseController.getSelectedCourse)
    tokenAuthGroup.patch("\(API.course.rawValue)", "\(Endpoints.update)", ":courseID", use: courseController.updateCourse)
    tokenAuthGroup.delete("\(API.course.rawValue)", "\(Endpoints.delete)", ":courseID",use: courseController.deleteCourse)
    
    // MARK: Section endpoints
    
    tokenAuthGroup.post("\(API.sections.rawValue)", use: sectionController.createNewSection)
    tokenAuthGroup.patch("\(API.sections.rawValue)", "\(Endpoints.update)", ":sectionID", use: sectionController.updateSection)
    tokenAuthGroup.delete("\(API.sections.rawValue)", "\(Endpoints.delete)", ":sectionID", use: sectionController.deleteSection)
    
    // MARK: Lectures endpoints
    
    tokenAuthGroup.post("\(API.lectures.rawValue)", use: lectureController.createNewLecture)
    tokenAuthGroup.get("\(API.lectures.rawValue)", ":lectureID", use: lectureController.getSelectedLecture)
    tokenAuthGroup.patch("\(API.lectures.rawValue)", "\(Endpoints.update)", ":lectureID", use: lectureController.updateLecture)
    tokenAuthGroup.delete("\(API.lectures.rawValue)", "\(Endpoints.delete)", ":lectureID", use: lectureController.deleteLecture)
    
}
