//
//  RegistrationViewController.swift
//  RC_RxKeyboard
//
//  Created by 박형석 on 2021/06/20.
//

import UIKit
import RxCocoa
import RxSwift
import NSObject_Rx
import Action

class RegistrationViewController: UIViewController, Storyboarded, ViewModelBinderType {
    
    // viewModel injection
    
    var viewModel: RegistrationViewModel
    
    typealias ViewModelType = RegistrationViewModel
    
    init(viewModel: RegistrationViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // outlet
    
    
    
    // view life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func bindViewModel() {
        <#code#>
    }
    
    
}
