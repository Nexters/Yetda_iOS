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
    var verticalStackView: UIStackView = UIStackView()
    var nameTextField: UITextField = UITextField()
    var bottomBorderView: UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    // custom setup
    override func setup() {
        super.setup()
    }
    
    // MARK: - apply layout from extension
    override func setupUI() {
        super.setupUI()
        
        setButton()
        
        self.view.addSubview(guideLabel)
        self.view.addSubview(nameTextField)
        
        setGuideLabel()
        setVerticalStackView()
        setNameTextField()
    }
    
    override func setupButton(button: UIButton) {
        super.setupButton(button: nextButton)
        button.setTitle("다음", for: .normal)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

