//
//  NumbersViewModel.swift
//  RX_Practice
//
//  Created by 이은서 on 11/4/23.
//

import Foundation
import RxSwift
import RxCocoa

class NumbersViewModel {
    
    var firstNum: ControlProperty<String>!
    var secondNum: ControlProperty<String>!
    var thirdNum: ControlProperty<String>!
    
    lazy var combine = Observable.combineLatest(firstNum, secondNum, thirdNum) { first, second, third
        in
        return (Int(first) ?? 0) + (Int(second) ?? 0) + (Int(third) ?? 0)
    }
    .map { $0.description } // == "\($0)"
    
}
