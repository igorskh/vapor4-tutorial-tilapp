//
//  CreateAcronym.swift
//  
//
//  Created by Igor Kim on 08.02.21.
//

import Fluent

let ACRONYMS = "acronyms"

struct CreateAcronym: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema(ACRONYMS)
            .id()
            .field("short", .string, .required)
            .field("long", .string, .required)
            .field("userID", .uuid, .required)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema(ACRONYMS).delete()
    }
}
