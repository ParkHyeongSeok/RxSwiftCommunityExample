//
//  MemoryStorage.swift
//  RC_RxKeyboard
//
//  Created by 박형석 on 2021/06/20.
//

import Foundation
import RxSwift
import RxCocoa

class MemoryStorage: StorageType {
    
    // Login User
    
    let currentUser = PublishSubject<User>()
    
    // Storage
    
    private var users = [User]()
    private var roomList = [ChatRoom]()
    
    // Subject for Storage
    
    lazy var usersSubject = BehaviorSubject(value: users)
    lazy var roomListSubject = BehaviorSubject(value: roomList)
    
    // CRUD : user, room
    
    @discardableResult
    func createUser(id: String, password: String, name: String) -> Observable<User> {
        let newUser = User(id: id, password: password, name: name)
        users.append(newUser)
        usersSubject.onNext(users)
        currentUser.onNext(newUser)
        return Observable.just(newUser)
    }
    
    @discardableResult
    func deleteUser(user: User) -> Observable<User> {
        return Observable.empty()
    }
    
    @discardableResult
    func createRoom(title: String, host: User, friend: User) -> Observable<ChatRoom> {
        
        // check same room
        let newRoom = ChatRoom(identity: UUID().uuidString, title: title, date: Date(), summaryContent: "새로운 대화를 시작하세요.", participants: [host, friend], chatList: [])
        roomList.insert(newRoom, at: 0)
        roomListSubject.onNext(roomList)
        return Observable.just(newRoom)
    }
    
    // leave the room -> users == 0 ? room.remove : users.remove
    @discardableResult
    func deleteRoom(room: ChatRoom) -> Observable<ChatRoom> {
        return Observable.empty()
    }
    
    
}
