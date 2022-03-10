//
//  File.swift
//  
//
//  Created by Johan Sas on 08/03/2022.
//

import Foundation
import Fluent
import CloudKit

extension UserModel {
    // MARK: FieldKeys
    struct FieldKeys {
        static var name: FieldKey {"name"}
        static var lastname: FieldKey {"lastname"}
        static var dateOfBirth: FieldKey {"dateOfBirth"}
        static var username: FieldKey {"username"}
        static var email: FieldKey {"email"}
        static var password: FieldKey {"password"}
        static var createdAt: FieldKey {"createdAt"}
        static var updatedAt: FieldKey {"updatedAt"}
        static var address: FieldKey {"address"}
        static var zip: FieldKey {"zip"}
        static var country: FieldKey {"country"}
        static var subscribedAt: FieldKey {"subscribedAt"}
        static var subscriptionEnd: FieldKey {"subscriptionEnd"}
        static var userRole: FieldKey {"userRole"}
    }
}

extension CourseModel {
    // MARK: Course FieldKeys
    
    struct FieldKeys {
        static var title: FieldKey {"title"}
        static var headerImage: FieldKey {"headerImage"}
        static var description: FieldKey {"description"}
        static var shortDescription: FieldKey {"shortDescription"}
        static var article: FieldKey {"article"}
        static var sylabus: FieldKey {"sylabus"}
        static var assetsURL: FieldKey {"assetsURL"}
        static var contentState: FieldKey {"contentState"}
        static var publishDate: FieldKey {"publishDate"}
        static var contentRole: FieldKey {"contentRole"}
        static var createdAt: FieldKey {"createdAt"}
        static var updatedAt: FieldKey {"updatedAt"}
        static var instructor: FieldKey {"instructor"}
        static var category: FieldKey {"category"}
    }
}

extension ArticleModel {
    // MARK: Article FieldKeys
    
    struct FieldKeys {
        static var title: FieldKey {"title"}
        static var slug: FieldKey {"slug"}
        static var intro: FieldKey {"intro"}
        static var excerp: FieldKey {"excerp"}
        static var content: FieldKey {"content"}
        static var category: FieldKey {"category"}
        static var headerImage: FieldKey {"headerImage"}
        static var author: FieldKey {"author"}
        static var contentState: FieldKey {"contentState"}
        static var contentRole: FieldKey {"contentRole"}
        static var createdAt: FieldKey {"createdAt"}
        static var updatedAt: FieldKey {"updatedAt"}
        static var publishDate: FieldKey {"publishDate"}
        static var savedByUsers: FieldKey {"savedByUsers"}
    }
}

extension CategoryModel {
    // MARK: Category FieldKeys
    
    struct FieldKeys {
        static var title: FieldKey {"title"}
        static var slug: FieldKey {"slug"}
        static var headerImage: FieldKey {"headerImage"}
    }
}

extension SectionModel {
    // MARK: SectionModel FieldKeys
    
    struct FieldKeys {
        static var title: FieldKey {"title"}
        static var sectionRole: FieldKey {"sectionRole"}
        static var publishDate: FieldKey {"publishDate"}
        static var contentState: FieldKey {"contentState"}
        static var createdAt: FieldKey {"createdAt"}
        static var updatedAt: FieldKey {"updatedAt"}
        static var course: FieldKey {"course"}
    }
}

extension LectureModel {
    // MARK: LectureModel FieldKeys
    
    struct FieldKeys {
        static var title: FieldKey {"title"}
        static var mp4URL: FieldKey {"mp4URL"}
        static var createdAt: FieldKey {"createdAt"}
        static var updatedAt: FieldKey {"updatedAt"}
        static var contentState: FieldKey {"contentState"}
        static var publishDate: FieldKey {"publishDate"}
        static var content: FieldKey {"content"}
        static var section: FieldKey {"section"}
    }
}
