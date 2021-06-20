//
//  StorageType.swift
//  RC_RxKeyboard
//
//  Created by 박형석 on 2021/06/20.
//

import Foundation
import RxSwift

protocol StorageType {
    
    // related to USER
    
    @discardableResult
    func createUser(id: String, password: String, name: String) -> Observable<User>
    
    @discardableResult
    func deleteUser(user: User) -> Observable<User>
 
    // related to ChatRoom
    
    @discardableResult
    func createRoom(title: String, host: User, friend: User) -> Observable<ChatRoom>
 
    @discardableResult
    func deleteRoom(room: ChatRoom) -> Observable<ChatRoom>
    
    
}
