//
//  Acronym.swift
//  
//
//  Created by Igor Kim on 08.02.21.
//

import Vapor
import Fluent

final class Acronym: Model {
    static let schema = ACRONYMS
    
    @ID
    var id: UUID?
    
    @Parent(key: "userID")
    var user: User
    
    @Field(key: "short")
    var short: String
    
    @Field(key: "long")
    var long: String
    
    init() {}
    
    init(id: UUID? = nil, short: String, long: String, userID: User.IDValue) {
        self.id = id
        self.short = short
        self.long = long
        
        self.$user.id = userID
    }
}

extension Acronym: Content {}
