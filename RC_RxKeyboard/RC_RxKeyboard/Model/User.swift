//
//  User.swift
//  RC_RxKeyboard
//
//  Created by 박형석 on 2021/06/19.
//

import Foundation

struct User {
    let name: String
    let userType: UserType
    var friendsList: [User]
}

enum UserType {
    case me
    case other
}
