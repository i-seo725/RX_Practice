//
//  ShoppingViewController.swift
//  RX_Practice
//
//  Created by 이은서 on 11/5/23.
//

import UIKit
import RxSwift
import RxCocoa

class ShoppingViewController: UIViewController {
    
    @IBOutlet weak var addTextField: UITextField!
    @IBOutlet weak var addButon: UIButton!
    @IBOutlet weak var listTableView: UITableView!
    
    var data: [MyTodo] = [MyTodo(myTodo: "그립톡 구매하기", done: false, like: false), MyTodo(myTodo: "사이다 구매하기", done: false, like: false), MyTodo(myTodo: "아이패드 케이스", done: false, like: false), MyTodo(myTodo: "양말 10켤레", done: false, like: false)]
    
    lazy var items = BehaviorSubject(value: data)
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    func bind() {
        
        items
            .bind(to: listTableView.rx.items(cellIdentifier: ShoppingTableViewCell.identifier, cellType: ShoppingTableViewCell.self)) { (row, element, cell) in
                
                guard let checkbox = element.done ? UIImage(systemName: "checkmark.square.fill") : UIImage(systemName: "checkmark.square"), let like = element.like ? UIImage(systemName: "star.fill") : UIImage(systemName: "star") else { return }
                
                cell.doneButton.setImage(checkbox, for: .normal)
                cell.likeButton.setImage(like, for: .normal)
                cell.todoLabel.text = element.myTodo
                
                cell.likeButton.rx.tap
                    .subscribe(with: self) { owner, _ in
                        owner.data[row].like.toggle()
                        owner.items.onNext(owner.data)
                    }
                    .disposed(by: cell.disposeBag)
                
                cell.doneButton.rx.tap
                    .subscribe(with: self) { owner, _ in
                        owner.data[row].done.toggle()
                        owner.items.onNext(owner.data)
                    }
                    .disposed(by: cell.disposeBag)
            }
            .disposed(by: disposeBag)
        
        addButon.rx.tap
            .withLatestFrom(addTextField.rx.text.orEmpty) { _, text in
                return text
            }
            .subscribe(with: self) { owner, text in
                owner.data.insert(MyTodo(myTodo: text, done: false, like: false), at: 0)
                owner.items.onNext(owner.data)
            }
            .disposed(by: disposeBag)
        
        addTextField.rx.text.orEmpty
            .debounce(RxTimeInterval.seconds(1), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .bind(with: self) { owner, text in
                let result = text == "" ? owner.data : owner.data.filter { $0.myTodo.contains(text) }
                owner.items.onNext(result)
            }
            .disposed(by: disposeBag)
        
        listTableView.rx.itemSelected
            .subscribe(with: self) { owner, indexPath in
                owner.navigationController?.pushViewController(SampleViewController(), animated: true)
            }
            .disposed(by: disposeBag)
        
    }
    
}
