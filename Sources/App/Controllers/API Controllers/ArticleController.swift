//
//  File.swift
//  
//
//  Created by Johan Sas on 02/04/2022.
//

import Foundation
import Fluent
import Vapor

struct ArticleController {
    
    func createNewArticle(_ req: Request) throws -> EventLoopFuture<ArticleModel>{
        try UserModel.Access.require(.admin, on: req)
        let newArticle = try req.content.decode(NewArticle.self)
        return try CreateNewArticleService.createNewArticle(newArticle, req)
    }
    
    func getAllArticles(_ req: Request) throws -> EventLoopFuture<[ArticleModel]> {
        return try GetAllArticleService.getAllArticles(req)
    }
    
    func getSelectedArticle(_ req: Request) throws -> EventLoopFuture<ArticleModel?> {
        let articleID = req.parameters.get("articleID")!
        return try GetSelectedArticleService.getSelectedArticle(articleID, req)
    }
    
    func updateSelectedArticle(_ req: Request) throws -> EventLoopFuture<ArticleModel> {
        try UserModel.Access.require(.admin, on: req)
        let updateArticle = try req.content.decode(UpdateArticle.self)
        let articleID = req.parameters.get("articleID")
        return try UpdateArticleService.updateArticle(articleID!, updateArticle: updateArticle, req)
    }
    
    func deleteSelectedArticle(_ req: Request) throws -> EventLoopFuture<HTTPStatus> {
        try UserModel.Access.require(.admin, on: req)
        let articleID = try req.parameters.get("articleID")
        return try DeleteArticleService.deleteArticle(articleID!, req)
    }
}
