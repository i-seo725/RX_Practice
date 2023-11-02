//
//  ViewController.swift
//  RX_Practice
//
//  Created by 이은서 on 2023/10/31.
//

import UIKit
import RxSwift
import RxCocoa

class TableViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    let disposeBag = DisposeBag()
    let items = Observable.just(
        (0..<20).map { "\($0)" }
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items
            .bind(to: tableView.rx.items(cellIdentifier: "Cell", cellType: UITableViewCell.self)) { (row, element, cell) in
                cell.textLabel?.text = "\(element) @row \(row)"
            }
            .disposed(by: disposeBag)
            
        tableView.rx
            .modelSelected(String.self)
            .subscribe(onNext: { value in
//                DefaultWireframe.presentAlert("Tapped `\(value)`")
            })
    }
    
    func bind() {
        
    }
}


