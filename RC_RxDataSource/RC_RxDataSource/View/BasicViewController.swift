//
//  BasicViewController.swift
//  RC_RxDataSource
//
//  Created by 박형석 on 2021/06/02.
//
 
import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx

class BasicViewController: UIViewController {
    
    @IBOutlet weak var listTableView: UITableView!
    
    let viewModel = StudentViewModel()
    
    let sections = [
        StudentSection(header: "first", items: [
            Student(name: "John", age: 30),
            Student(name: "Paul", age: 34),
            Student(name: "Rosa", age: 21)
        ]),
        StudentSection(header: "second", items: [
            Student(name: "Marry", age: 30),
            Student(name: "Yaso", age: 34),
            Student(name: "Jin", age: 21)
        ]),
        StudentSection(header: "second", items: [
            Student(name: "Leesin", age: 30),
            Student(name: "MasterLee", age: 34),
            Student(name: "Bose", age: 21)
        ])
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        Observable.just(sections)
            .bind(to: listTableView.rx.items(dataSource: viewModel.dataSource))
            .disposed(by: rx.disposeBag)
        
    }
    
}
