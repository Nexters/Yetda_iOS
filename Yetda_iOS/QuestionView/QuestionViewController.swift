//
//  QuestionViewController.swift
//  Yetda_iOS
//
//  Created by Leon Kong on 2020/01/13.
//  Copyright © 2020 Yetda. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {


    let cardSize = CGSize(width: 200, height: 300)
    
    let questionCardView: UIView = UIView()
    let yesButton: UIButton = UIButton()
    let noButton: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
}
