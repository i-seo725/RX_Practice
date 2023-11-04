//
//  NumbersViewController.swift
//  RX_Practice
//
//  Created by 이은서 on 11/2/23.
//

import UIKit
import RxSwift
import RxCocoa

class NumberViewController: UIViewController {

    @IBOutlet weak var number1: UITextField!
    @IBOutlet weak var number2: UITextField!
    @IBOutlet weak var number3: UITextField!
    
    @IBOutlet weak var result: UILabel!
    
    let viewModel = NumbersViewModel()
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.firstNum = number1.rx.text.orEmpty
        viewModel.secondNum = number2.rx.text.orEmpty
        viewModel.thirdNum = number3.rx.text.orEmpty
        
        viewModel.combine
            .bind(to: result.rx.text)
            .disposed(by: disposeBag)
    }
}
