//
//  ValidViewModel.swift
//  RX_Practice
//
//  Created by 이은서 on 11/4/23.
//

import Foundation
import RxSwift
import RxCocoa

class ValidViewModel {
    
    let minimalUsernameLength = 5
    let minimalPasswordLength = 5
    
    lazy var usernameValidMessage = "username은 \(minimalUsernameLength)자 이상이어야 합니다."
    lazy var passwordValidMessage = "password는 \(minimalPasswordLength)자 이상이어야 합니다."
    
    var username: ControlProperty<String>?
    var password: ControlProperty<String>?
    
    lazy var usernameValid = username!
        .map { "\($0)".count >= self.minimalUsernameLength }
//            .share(replay: 1)
    
    lazy var passwordValid = password!
        .map { "\($0)".count >= self.minimalPasswordLength }
//            .share(replay: 1)

    lazy var everythingValid = Observable.combineLatest(usernameValid, passwordValid) { $0 && $1 }
        .share(replay: 1)
    
}
