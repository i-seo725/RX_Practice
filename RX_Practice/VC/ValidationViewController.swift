//
//  ValidationViewController.swift
//  RX_Practice
//
//  Created by 이은서 on 11/3/23.
//

import UIKit
import RxSwift
import RxCocoa

class ValidationViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var usernameValidLabel: UILabel!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordValidLabel: UILabel!
    
    @IBOutlet weak var doSomethingButton: UIButton!
    
    
    let viewModel = ValidViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameValidLabel.text = viewModel.usernameValidMessage
        passwordValidLabel.text = viewModel.passwordValidMessage
        
        bind()
    }
    
    func bind() {
        
        viewModel.username = usernameTextField.rx.text.orEmpty
        viewModel.password = passwordTextField.rx.text.orEmpty

        
        viewModel.usernameValid
            .bind(to: usernameValidLabel.rx.isEnabled)
            .disposed(by: disposeBag)
        
        viewModel.passwordValid
            .bind(to: passwordValidLabel.rx.isEnabled)
            .disposed(by: disposeBag)
        
        viewModel.everythingValid
            .bind(to: doSomethingButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        doSomethingButton.rx.tap
            .subscribe(with: self) { owner, _ in
                owner.showAlert()
            }
            .disposed(by: disposeBag)
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "RX Study", message: "멋있어요!", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(okButton)
        present(alert, animated: true)
    }
}



