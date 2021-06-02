//
//  Student.swift
//  RC_RxDataSource
//
//  Created by 박형석 on 2021/06/02.
//

import Foundation
import RxSwift
import RxDataSources

struct Student {
    
    let name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

struct StudentSection {
    var header: String
    var items: [Student]
    
    init(header: String, items: [Student]) {
        self.header = header
        self.items = items
    }
}

extension StudentSection: SectionModelType {
    
    init(original: StudentSection, items: [Student]) {
        self = original
        self.items = items
    }
}

