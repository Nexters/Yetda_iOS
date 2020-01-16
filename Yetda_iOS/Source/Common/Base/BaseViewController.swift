//
//  BaseViewController.swift
//  Yetda_iOS
//
//  Created by Jung seoung Yeo on 2020/01/17.
//  Copyright © 2020 Yetda. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupUI()
        bind()
    }
    
    func setup() { }
    func setupUI() { }
    func bind() { }
}
