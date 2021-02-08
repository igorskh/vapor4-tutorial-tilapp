//
//  CreasteUser.swift
//  
//
//  Created by Igor Kim on 08.02.21.
//

import Fluent

let USERS = "users"

struct CreateUser: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema(USERS)
            .id()
            .field("name", .string, .required)
            .field("username", .string, .required)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema(USERS).delete()
    }
}
