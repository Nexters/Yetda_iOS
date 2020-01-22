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
    var guideLabel: UILabel!
    var nameTextField: UITextField!
    var verticalStackView: UIStackView!
    var bottomBorderView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    /// custom setup
    override func setup() {
        super.setup()
        setupButton(button: nextButton)
//        setupGuideTextLabel()
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    override func setupUI() {
        super.setupUI()
        setLabelAndTextFieldStack()
        
        nextButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.width.equalTo(240)
            make.height.equalTo(36)
            make.bottom.equalTo(-80)
        }
        

    }
    
    override func setupButton(button: UIButton) {
        super.setupButton(button: nextButton)
        button.setTitle("다음", for: .normal)
    }
    
    func setLabelAndTextFieldStack() {
        
        verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.backgroundColor = .green
        
        nameTextField = UITextField()
        nameTextField.borderStyle = .none
        nameTextField.placeholder = "이름"
//        nameTextField.keyboardType = UIKeyboardType.default
        nameTextField.delegate = self
        
        
        bottomBorderView = UIView()
        if nameTextField.isSelected {
            bottomBorderView.backgroundColor = .darkGray
        } else {
            bottomBorderView.backgroundColor = .lightGray
        }
        
        
        guideLabel = UILabel()
        guideLabel.numberOfLines = 0
        guideLabel.text = """
        선물 줄 분의 이름이
        어떻게 되시나요?
        """
        guideLabel.textColor = .darkGray
        
        view.addSubview(verticalStackView)
        verticalStackView.addSubview(guideLabel)
        verticalStackView.addSubview(nameTextField)
        verticalStackView.addSubview(bottomBorderView)
        
        
        
        verticalStackView.snp.makeConstraints { (make) in
            make.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-20)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(20)
            make.bottom.equalTo(nextButton.snp_topMargin).offset(-20)
            make.top.equalTo(200)
                }
        
        guideLabel.snp.makeConstraints { (make) in
            make.trailing.equalTo(verticalStackView)
            make.leading.equalTo(verticalStackView)
        }
        
        nameTextField.snp.makeConstraints { (make) in
            make.topMargin.equalTo(guideLabel.snp_bottomMargin).offset(20)
            make.trailing.equalTo(verticalStackView)
            make.leading.equalTo(verticalStackView)

        }
        
        bottomBorderView.snp.makeConstraints { (make) in
            make.topMargin.equalTo(nameTextField.snp_bottomMargin).offset(20)
            make.trailing.equalTo(verticalStackView)
            make.leading.equalTo(verticalStackView)
            make.height.equalTo(2)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



}

// MARK: - UITextFieldDelegate Extension
extension NameViewController: UITextFieldDelegate {
//    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//        // return NO to disallow editing.
//        print("TextField should begin editing method called")
//        return true
//    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        // became first responder
        bottomBorderView.backgroundColor = .darkGray
        print("TextField did begin editing method called")
    }

//    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//        // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
//        print("TextField should snd editing method called")
//        return false
//    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
        print("TextField did end editing method called")
        
    }
//
//    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
//        // if implemented, called in place of textFieldDidEndEditing:
//        print("TextField did end editing with reason method called")
//    }

//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        // return NO to not change text
//        print("While entering the characters this method gets called")
//        return true
//    }
//
//    func textFieldShouldClear(_ textField: UITextField) -> Bool {
//        // called when clear button pressed. return NO to ignore (no notifications)
//        print("TextField should clear method called")
//        return true
//    }
//
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        // called when 'return' key pressed. return NO to ignore.
//        print("TextField should return method called")
//        // may be useful: textField.resignFirstResponder()
//        return true
//    }
}
