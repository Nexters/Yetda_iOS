//
//  QuestionViewController.swift
//  Yetda_iOS
//
//  Created by Leon Kong on 2020/01/13.
//  Copyright © 2020 Yetda. All rights reserved.
//

import UIKit
import RealmSwift

class QuestionViewController: BaseViewController {
    var basePoint = 5
    
    let cardSize = CGSize(width: 302, height: 362)
    
    let frontCardView: UIView = UIView()
    let middleCardView: UIView = UIView()
    let backCardView: UIView = UIView()
    let frontCardLabel: UILabel = UILabel()
    
    let descriptionLabel: UILabel = UILabel()
    let yesButton: UIButton = UIButton()
    let noButton: UIButton = UIButton()
    let midButton: UIButton = UIButton()
    var secondCard = UIView()
    
    // Question and Answer related logics
    var answer: Answer?
    var question: Question?
    var presents: Results<Presents>?
    var questionNum = 0
    
    var presentBrain = PresentBrain()
    
    
    static func instance(viewModel: HomeViewModel) -> QuestionViewController? {
        let questionViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "QuestionViewController") as? QuestionViewController
        questionViewController?.homeViewModel = viewModel
        return questionViewController
    }
    
    fileprivate var homeViewModel: HomeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answer = homeViewModel?.answer
        
        // 작성한 PresentBrain을 활용해 question을 동적으로 생성하는 로직 추가 필요.
        
//        do {
//            let realm = try Realm()
//            presents = realm.objects(Presents.self)
//            let qs: Results<Questions>?
//            qs = realm.objects(Questions.self)
//            if let unWrappedQuestions = qs {
//                questionSize = unWrappedQuestions[0].questions.count
////                print("unwrapped: \(unWrappedQuestions[0].questions)")
//                for question in unWrappedQuestions[0].questions {
////                    print("unwrapped: \(question)")
//                    questions.questions.append(question)
//                }
//                print("questions instance: \(questions)")
//            }
//
//        } catch let error as NSError {
//            print("ERROR: \(error)")
//        }

        setupView()
        setupButtonAction()
        
//        print("question: \(answer)")
    }
    
}

extension QuestionViewController: HomeViewControllerable {
    func next() {
        homeViewModel?.startBtnTapped()
    }
    
    func prev() {
        
    }
    
    func storeData() {
        homeViewModel?.storeStringAnswer(actionType: ActionType.tag, payload: "선물")
    }
    
    
}

extension QuestionViewController {
    func goToResult() {
        print("let's GOGO")
        next()
    }
    
    @objc
    func nextBtnTapped() {
        print("next button in start tapped")
        next()
        storeData()
    }
}
