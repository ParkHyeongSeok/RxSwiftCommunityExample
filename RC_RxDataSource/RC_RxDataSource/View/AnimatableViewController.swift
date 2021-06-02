//
//  AnimatableViewController.swift
//  RC_RxDataSource
//
//  Created by 박형석 on 2021/06/02.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
import NSObject_Rx

class AnimatableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    let viewModel = TeacherViewModel()
    
    let sections = [
        TeacherSection(header: "first", items: [
            Teacher(name: "John", age: 30),
            Teacher(name: "Paul", age: 34),
            Teacher(name: "Rosa", age: 21)
        ]),
        TeacherSection(header: "second", items: [
            Teacher(name: "Marry", age: 30),
            Teacher(name: "Yaso", age: 34),
            Teacher(name: "Jin", age: 21)
        ]),
        TeacherSection(header: "second", items: [
            Teacher(name: "Leesin", age: 30),
            Teacher(name: "MasterLee", age: 34),
            Teacher(name: "Bose", age: 21)
        ])
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        Observable.just(sections)
            .bind(to: tableView.rx.items(dataSource: viewModel.dataSource))
            .disposed(by: rx.disposeBag)
        
    }

}
