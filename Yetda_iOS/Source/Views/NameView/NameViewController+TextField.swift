//
//  NameViewController+TextField.swift
//  Yetda_iOS
//
//  Created by Leon Kong on 2020/01/23.
//  Copyright © 2020 Yetda. All rights reserved.
//

import UIKit

// MARK: - UITextFieldDelegate Extension
extension NameViewController: UITextFieldDelegate {
    /*
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        // return NO to disallow editing.
        print("TextField should begin editing method called")
        return true
    }
     */

    func textFieldDidBeginEditing(_ textField: UITextField) {
        // became first responder
        print("TextField did begin editing method called")
    }

    /*
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
        print("TextField should snd editing method called")
        return false
    }
     */
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
        print("TextField did end editing method called")
        
    }
    
    /*
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        // if implemented, called in place of textFieldDidEndEditing:
        print("TextField did end editing with reason method called")
    }
     */
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // return NO to not change text
        print("While entering the characters this method gets called")
        
        // 최대 글자 수 7
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        return updatedText.count <= 7
    }
    
    /*
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        // called when clear button pressed. return NO to ignore (no notifications)
        print("TextField should clear method called")
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // called when 'return' key pressed. return NO to ignore.
        print("TextField should return method called")
        // may be useful: textField.resignFirstResponder()
        return true
    }
     */
    
    // MARK: - Custom Code
    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        if text.count > 0 {
            nextButton.setNextButton(isEnable: true)
        } else {
            nextButton.setNextButton(isEnable: false)
        }
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        guard let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
            else { return }
        
        let keybaordRectangle = keyboardFrame.cgRectValue
        let keyboardHeight = keybaordRectangle.height
        
        nextButton.transform = CGAffineTransform(translationX: 0, y: -keyboardHeight)
    }
      
    @objc func keyboardWillHide(_ notification: Notification) {
        nextButton.transform = .identity
    }
}
