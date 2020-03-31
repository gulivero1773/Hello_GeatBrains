//
//  UserController.swift
//  App
//
//  Created by Mykola Buhaiov on 31.03.2020.
//

import Vapor

final class UserController {
    
    func web(_ req: Request) throws -> Future<View> {
        return try req.view().render("users", ["users": User.query(on: req).all()])
    }
    
    func index(_ req: Request) throws -> String {
        
        let name = try req.parameters.next(String.self)
        return "Hello \(name)"
        
    }
    func users(_ req: Request) throws -> Future<[User]> {
        return User.query(on: req).all()
    }
    
    func create(_ req: Request) throws -> Future<User> {
        return try req.content.decode(User.self).flatMap { user in
            return user.create(on: req)
            
        }
    }
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(User.self).flatMap { user in
            return user.delete(on: req)
        }.transform(to: .ok)
    }
}
