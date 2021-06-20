//
//  RoomListViewModel.swift
//  RC_RxKeyboard
//
//  Created by 박형석 on 2021/06/20.
//

import Foundation
import RxSwift
import RxDataSources
import RxCocoa
import NSObject_Rx
import Action

typealias RoomSection = AnimatableSectionModel<Int, ChatRoom>

class RoomListViewModel: HasDisposeBag {
    
    let storage: MemoryStorage!
    
    init(storage: MemoryStorage) {
        self.storage = storage
    }
    
    var title: Observable<String> {
        return storage.currentUser.map { user in user.name }
    }
    
    let myRoomList = PublishRelay<[ChatRoom]>()
    
    func fetchMyRoomList(user: User) {
        storage.roomListSubject
            .subscribe(onNext: { rooms in
                let newRooms = rooms.filter { room in
                    if room.participants.contains(user) {
                        return true
                    } else {
                        return false
                    }
                }
                self.myRoomList.accept(newRooms)
            })
            .disposed(by: disposeBag)
    }
    
    var dataSource: RxTableViewSectionedAnimatedDataSource<RoomSection> = {
        let ds = RxTableViewSectionedAnimatedDataSource<RoomSection> { dataSource, tableView, IndexPath, room in
            
            // add custom cell after implement
            let cell = tableView.dequeueReusableCell(withIdentifier: "roomCell", for: IndexPath)
            cell.textLabel?.text = room.title
            cell.detailTextLabel?.text = room.summaryContent
            return cell
        }
        
        ds.canEditRowAtIndexPath = { dataSource, indexPath in
            return true
          }
        
        ds.canMoveRowAtIndexPath = { dataSource, indexPath in
            return true
          }
        
        return ds
    }()
    
    // 채팅방 입장
    let detailRoom = Action<ChatRoom, Void> { room in
        
        // open VC
        
        return Observable.empty()
    }
    
    
}
