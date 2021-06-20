//
//  User.swift
//  RC_RxKeyboard
//
//  Created by 박형석 on 2021/06/19.
//

import Foundation

struct User: Equatable {
    let id: String
    var password: String
    let name: String
    var friendsList: [User] = []
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
    
}

