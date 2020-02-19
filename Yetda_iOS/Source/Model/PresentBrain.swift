//
//  PresentBrain.swift
//  Yetda_iOS
//
//  Created by Leon Kong on 2020/02/20.
//  Copyright © 2020 Yetda. All rights reserved.
//

import UIKit

protocol PresentBrainable {
    func findPresents()
    func findQuestion()
}

struct PresentBrain {
    var presents: [Present]
    var questions: [Question]
    var excludedTags: [String]
    
    func findPresents() {
        
    }
    
    func findQuestion() {
        
    }
}
