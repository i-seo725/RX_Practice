//
//  SampleViewController.swift
//  RX_Practice
//
//  Created by 이은서 on 11/5/23.
//

import UIKit

class SampleViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        title = "\(Int.random(in: 1...100))"
    }
}
