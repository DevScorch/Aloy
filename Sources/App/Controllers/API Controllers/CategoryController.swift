//
//  File.swift
//  
//
//  Created by Johan Sas on 23/03/2022.
//

import Foundation
import Vapor
import Fluent

struct CategoryController {
    
    // MARK: Create  a new Category
    
    func createCategory(_ req: Request) throws -> EventLoopFuture<CategoryModel> {
        let newCategory = try req.content.decode(NewCategory.self)
        return try CreateCategoryService.createNewCategory(newCategory, req)
    }
    
    // MARK: Get All Categories
    
    func getAllCategories(_ req: Request) throws -> EventLoopFuture<[CategoryModel]> {
        return try GetAllCategoriesService.getAllCategories(req)
    }
    
    // MARK: Get the selected category
    
    func getSelectedCategory(_ req: Request) throws -> EventLoopFuture<CategoryModel> {
        let categoryID = try req.parameters.get("categoryID")!
        return try GetSelectedCategoryService.getSelectedCategory(categoryID, req)
    }
    
    // MARK: Update selected Category
    
    func updateCategory(_ req :Request) throws -> EventLoopFuture<CategoryModel> {
        let categoryID = try req.parameters.get("categoryID")
        let updatedCategory = try req.content.decode(UpdateCategory.self)
        return try UpdateCategoryService.updateCategory(categoryID, updatedCategory, req)
    }
    
    // MARK: Delete Selected Category
    
    func deleteCategory(_ req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let categoryID = try req.parameters.get("courseID")
        return try DeleteCategoryService.deleteCategory(categoryID, req)
    }
}
