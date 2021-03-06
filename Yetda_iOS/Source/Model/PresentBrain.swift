//
//  PresentBrain.swift
//  Yetda_iOS
//
//  Created by Leon Kong on 2020/02/20.
//  Copyright © 2020 Yetda. All rights reserved.
//

import UIKit
import RealmSwift

//protocol PresentBrainable {
//    func findPresents()
//    func findQuestion()
//}

class PresentBrain {
    
    // excludedTags는 동적으로 받아야 함
    var excludedTags: [String] = []
    var question = Question()
    var questionNum = 0
    var presents = [Present]()
    var isContinue: Bool = true
    var homeViewModel: HomeViewModel?
    var answer: Answer?
    var minPrice = 1
    var maxPrice = 10
    
    init(minPrice: Int, maxPrice: Int) {
        self.minPrice = minPrice
        self.maxPrice = maxPrice
        self.presents = findPresents()
        self.question = findQuestion()
        print("Init called")
    }
    
    // Find presents candidates from constraints
    func findPresents() -> [Present] {
        var filteredPresents: [Present] = []
        do {
            let realm = try Realm()
            let realmPresents = realm.objects(Present.self)
            // 가격으로 한번 더 걸러내는 로직 들어가야 함.
            let priceFiltered = Array(realmPresents).filter { (present) -> Bool in
                if present.price != "" {
//                    print("present: \(present.price) min: \(minPrice), max: \(maxPrice)")
                    if Int(present.price)! <= maxPrice*10000 && Int(present.price)! >= minPrice*10000 {
                        return true
                    } else {
                        return false
                    }
                } else {
                    return false
                }
            }
                let filtered = Array(priceFiltered).filter { (present) -> Bool in
                    
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
    
    // Find randomized question candidate from constraints
    func findQuestion() -> Question {
        // 아직 물어보지 않은 질문 중 tags에 없는 질문을 찾아 리턴한다
        var filteredQuestions: [Question] = []
        
        
        do {
            let realm = try Realm()
            let realmQuestions = realm.objects(Question.self)
            
            try realm.write {
                // 해당 question은 질문했으니 true로 변경
                question.isAsked = true
            }
            
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
        
        let outcome = filteredQuestions.randomElement() ?? question

        return outcome
        
    }
    
    // Gonna be removed
     func addExcludedTags(tag: String) {
        if tag != "" {
            excludedTags.append(String(tag.filter { !" \n\t\r".contains($0) }))
        }
    }
    
    
    // MARK: - Question Handler
     func handleQuestion(answerType: Bool) {
        answer = homeViewModel?.answer
        if questionNum <= 3 {
            if answerType == true {
                question = findQuestion()
            } else {
                addExcludedTags(tag: question.tag)
                presents = findPresents()
                question = findQuestion()
            }
        } else if questionNum == 4 {
            if presents.count < 6 {
                isContinue = false
            } else {
                if answerType == true {
                    question = findQuestion()
                } else {
                    addExcludedTags(tag: question.tag)
                    presents = findPresents()
                    question = findQuestion()
                }
            }
        } else {
            // questionNum >= 5
            if answerType == true {
                isContinue = false
            } else {
                addExcludedTags(tag: question.tag)
                presents = findPresents()
                isContinue = false
            }
        }
    }
    
    /* 추가로 진행할 사항
     
     질문이 모두 완료되었으면 선별된 present 결과를 저장
     
     */
    
    
}
