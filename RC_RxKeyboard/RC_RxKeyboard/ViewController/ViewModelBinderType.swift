//
//  ViewModelBinderType.swift
//  RC_RxKeyboard
//
//  Created by 박형석 on 2021/06/20.
//

import Foundation
import RxSwift
import RxCocoa

protocol ViewModelBinderType {
    associatedtype ViewModelType
    
    var viewModel: ViewModelType { get set }
    
    func bindViewModel()
}

extension ViewModelBinderType where Self: UIViewController {
    mutating func bind(viewModel: ViewModelType) {
        
        self.viewModel = viewModel
        loadViewIfNeeded()
        bindViewModel()
    }
}
