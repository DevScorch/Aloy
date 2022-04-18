import Fluent
import FluentPostgresDriver
import Leaf
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    
    
    // MARK: Leaf Setup

    // uncomment to serve files from /Public folder
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    app.views.use(.leaf)
    
    // MARK: Sessions
    
    app.sessions.use(.fluent)
    app.migrations.add(SessionRecord.migration)
    app.middleware.use(app.sessions.middleware)
    
    // CORS: CORS Setup
    
    app.middleware.use(CORSMiddleware(configuration: .init(allowedOrigin: .originBased, allowedMethods: [.GET, .POST, .PUT, .OPTIONS, .DELETE, .PATCH], allowedHeaders: [.accept, .authorization, .contentType, .origin, .xRequestedWith])))
    
    // PSQL database setup
    
    app.databases.use(.postgres(hostname: Environment.get("DATABASE_HOST") ?? "localhost", username: Environment.get("DATABASE_USER") ?? "vapor_username", password: Environment.get("DATABASE_PASSWORD") ?? "vapor_password", database: Environment.get("DATABASE_NAME") ?? "vapor_database"), as: .psql)
    
    // MARK: Migrations
    
    app.migrations.add(CategoryMigration())
    app.migrations.add(UserMigration())
    app.migrations.add(ArticleMigration())
    app.migrations.add(CourseMigration())
    app.migrations.add(SectionMigration())
    app.migrations.add(LectureMigration())
    app.migrations.add(TokenMigration())
    
    // MARK: Seeds
    
    app.migrations.add(CreateAdminSeed())
    
    // MARK: Logging
    
    app.logger.logLevel = .debug
    
    try app.autoMigrate().wait()
    
    // register routes
    try routes(app)
    
    
}
