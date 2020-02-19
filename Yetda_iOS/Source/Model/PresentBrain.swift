//
//  PresentBrain.swift
//  Yetda_iOS
//
//  Created by Leon Kong on 2020/02/20.
//  Copyright © 2020 Yetda. All rights reserved.
//

import UIKit
import RealmSwift

protocol PresentBrainable {
    func findPresents()
    func findQuestion()
}

struct PresentBrain {
    
    // excludedTags는 동적으로 받아야 함
    var excludedTags: [String] = ["정성", "인테리어", "문구", "쓸없선", "연인"]
    
    func findPresents() -> [Present] {
        var filteredPresents: [Present] = []
        do {
            let realm = try Realm()
            let realmPresent = realm.objects(Present.self)
            
                let filtered = Array(realmPresent).filter { (present) -> Bool in
                    for tag in excludedTags {
                        if present.tags.contains(tag) {
                            return false
                        }
                    }
                    return true
                }
                filteredPresents = filtered
            
        
            
        } catch let error as NSError {
            print(error)
        }
        
        return filteredPresents
    }
    
    func findQuestion() {
        
    }
}
