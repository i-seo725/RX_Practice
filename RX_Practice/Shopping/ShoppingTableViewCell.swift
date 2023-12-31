//
//  ShoppingTableViewCell.swift
//  RX_Practice
//
//  Created by 이은서 on 11/5/23.
//

import UIKit
import RxSwift

class ShoppingTableViewCell: UITableViewCell {
    
    static let identifier = "ShoppingCell"
    
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var todoLabel: UILabel!
    
    var disposeBag = DisposeBag()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
    
    
    
}
