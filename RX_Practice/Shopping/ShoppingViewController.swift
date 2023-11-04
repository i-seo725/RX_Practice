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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "쇼핑"
    }
    
    
}
