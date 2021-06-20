//
//  ChatRoom.swift
//  RC_RxKeyboard
//
//  Created by 박형석 on 2021/06/20.
//

import Foundation
import RxDataSources

struct ChatRoom: Equatable, IdentifiableType {
    var identity: String
    var title: String
    var date: Date = Date()
    var summaryContent: String
    var participants: [User]
    var chatList: [Chat]
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.identity == rhs.identity
    }
}
