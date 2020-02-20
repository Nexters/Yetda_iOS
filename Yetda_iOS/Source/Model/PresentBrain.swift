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
    private var excludedTags: [String] = []
    
    func findPresents() -> [Present] {
        var filteredPresents: [Present] = []
        do {
            let realm = try Realm()
            let realmPresents = realm.objects(Present.self)
            // 가격으로 한번 더 걸러내는 로직 들어가야 함.
                let filtered = Array(realmPresents).filter { (present) -> Bool in
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
    
    func findQuestion() -> Question? {
        // 아직 물어보지 않은 질문 중 tags에 없는 질문을 찾아 리턴한다
        var filteredQuestions: [Question] = []
        
        do {
            let realm = try Realm()
            let realmQuestions = realm.objects(Question.self)
            
            filteredQuestions = Array(realmQuestions).filter { (question) -> Bool in
                if excludedTags.contains(question.tag) || question.isAsked == true {
                    return false
                } else {
                    return true
                }
            }
            
        } catch let error as NSError {
            print(error)
        }
        
        
        return filteredQuestions.randomElement() ?? nil
        
    }
    
    mutating func addExcludedTags(tag: String) {
        excludedTags.append(tag)
    }
}
