//
//  User.swift
//  App
//
//  Created by Mykola Buhaiov on 31.03.2020.
//

import FluentSQLite
import Vapor

/// A single entry of a Todo list.
final class User: SQLiteModel {

    var id: Int?
    
    var name: String
    var age: Int
    
    init(id: Int? = nil, name: String, age: Int) {
        
        self.name = name
        self.age = age
    }
}

/// Allows `Todo` to be used as a dynamic migration.
extension User: Migration { }

/// Allows `Todo` to be encoded to and decoded from HTTP messages.
extension User: Content { }

/// Allows `Todo` to be used as a dynamic parameter in route definitions.
extension User: Parameter { }

