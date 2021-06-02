//
//  Teacher.swift
//  RC_RxDataSource
//
//  Created by 박형석 on 2021/06/02.
//

import Foundation
import RxSwift
import RxDataSources

struct Teacher: Equatable, IdentifiableType {
    
    let name: String
    var age: Int
    let identity: String
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
        self.identity = name + "\(age)"
    }
}

struct TeacherSection {
    
    var header: String
    var items: [Item]
    var identity: String
    
    init(header: String, items: [Item]) {
        self.header = header
        self.items = items
        self.identity = UUID().uuidString
    }
}

extension TeacherSection: AnimatableSectionModelType {
    typealias Item = Teacher
    
    init(original: TeacherSection, items: [Teacher]) {
        self = original
        self.items = items
    }
}

