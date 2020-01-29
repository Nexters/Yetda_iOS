//
//  GenderViewController.swift
//  Yetda_iOS
//
//  Created by Leon Kong on 2020/01/27.
//  Copyright © 2020 Yetda. All rights reserved.
//

import UIKit
import SnapKit

class GenderViewController: BaseViewController {
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var femaleButton: UIButton!
    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var femaleLabel: UILabel!
    @IBOutlet weak var maleLabel: UILabel!
    
    
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
           
//           setButton()
//           setVerticalStackView()
//           setGuideLabel()
//           setNameTextField()
           
       }
       
       override func setupButton(button: UIButton) {
           super.setupButton(button: nextButton)
           button.setTitle("다음", for: .normal)
       }
    
    @IBAction func femaleButtonPressed(_ sender: UIButton) {
    }
    @IBAction func maleButtonPressed(_ sender: UIButton) {
    }
    
}
