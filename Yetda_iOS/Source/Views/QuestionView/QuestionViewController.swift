//
//  QuestionViewController.swift
//  Yetda_iOS
//
//  Created by Leon Kong on 2020/01/13.
//  Copyright © 2020 Yetda. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    var questionNum = 1
    var basePoint = 5
    
    let cardSize = CGSize(width: 266, height: 297)
    
    let frontCardView: UIView = UIView()
    let backCardView: UIView = UIView()
    let frontCardLabel: UILabel = UILabel()
    
    let descriptionLabel: UILabel = UILabel()
    let yesButton: UIButton = UIButton()
    let noButton: UIButton = UIButton()
    let midButton: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupButtonAction()
    }
}
