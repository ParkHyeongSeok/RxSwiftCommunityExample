//
//  ViewModelBindable.swift
//  RC_RxFlow
//
//  Created by 박형석 on 2021/06/17.
//

import Foundation
import UIKit

protocol ViewModelBindable {
    associatedtype ViewModelType
    
    var viewModel: ViewModelType! { get set }
    
    func bindViewModel()
    
}

extension ViewModelBindable where Self: UIViewController {
    mutating func bind(viewModel: Self.ViewModelType) {
        
        self.viewModel = viewModel
        
        // 뷰모델을 업데이트하고 난 뒤에 viewController의 view를 storyboard에서 다시 load
        loadViewIfNeeded()
        
        bindViewModel()
    }
}
