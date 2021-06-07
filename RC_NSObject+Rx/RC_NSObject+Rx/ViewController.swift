//
//  ViewController.swift
//  RC_NSObject+Rx
//
//  Created by 박형석 on 2021/06/07.
//

import UIKit
import RxCocoa
import RxSwift
import NSObject_Rx

class ViewController: UIViewController {
    
    @IBOutlet weak var testLabel: UILabel!
    
    //    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Observable.just("Hello")
            .bind(to: testLabel.rx.text)
            .disposed(by: rx.disposeBag)
        
    }
}
 
class TestClass: HasDisposeBag {
    
//    let bag = DisposeBag()
    
    let myLabel: UILabel = {
       let label = UILabel()
        label.text = "Hello"
        return label
    }()
    
    func testing() {
        Observable.just("Hello")
            .bind(to: myLabel.rx.text)
            .disposed(by: disposeBag)
    }
}

struct TestStruct {
   
    let bag = DisposeBag()
   
   let myLabel: UILabel = {
      let label = UILabel()
       label.text = "Hello"
       return label
   }()
   
   func testing() {
       Observable.just("Hello")
           .bind(to: myLabel.rx.text)
           .disposed(by: bag)
   }
}

