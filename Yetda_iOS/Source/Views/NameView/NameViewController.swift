//
//  NameViewController.swift
//  Yetda_iOS
//
//  Created by Leon Kong on 2020/01/13.
//  Copyright © 2020 Yetda. All rights reserved.
//

import UIKit
import SnapKit

class NameViewController: BaseViewController {

    @IBOutlet weak var nextButton: UIButton!
    var guideLabel: UILabel = UILabel()
    var nameTextField: UITextField = UITextField()
    var bottomBorderView: UIView = UIView()
    
    static func instance(viewModel: HomeViewModel) -> NameViewController? {
        let nameViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "NameViewController") as? NameViewController
        nameViewController?.homeViewModel = viewModel
        return nameViewController
    }
    
    fileprivate var homeViewModel: HomeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        nameTextField.becomeFirstResponder()
    }
    
    // custom setup
    override func setup() {
        super.setup()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: - apply layout from extension
    override func setupUI() {
        super.setupUI()
        
        setButton()
        
        self.view.addSubview(guideLabel)
        self.view.addSubview(nameTextField)
        self.view.addSubview(bottomBorderView)
        
        setGuideLabel()
        setNameTextField()
        
    }
    
    override func setupButton(button: UIButton) {
        super.setupButton(button: nextButton)
        button.setTitle("다음", for: .normal)
        
        nextButton.addTarget(self, action: #selector(nextBtnTapped), for: .touchUpInside)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension NameViewController: HomeViewControllerable {
    func next() {
        homeViewModel?.startBtnTapped()
    }
    
    func prev() {
        
    }
    
    func storeData() {
        homeViewModel?.storeStart(name: "123123123")
    }
    
    
}

private extension NameViewController {
    @objc
    func nextBtnTapped() {
        next()
        storeData()
    }
}

