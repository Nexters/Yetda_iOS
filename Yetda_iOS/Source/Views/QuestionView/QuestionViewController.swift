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

    var questionNum = 1
    var basePoint = 5
    
    let cardSize = CGSize(width: 272, height: 280)
    
    let frontCardView: UIView = UIView()
    let backCardView: UIView = UIView()
    let frontCardLabel: UILabel = UILabel()
    
    let descriptionLabel: UILabel = UILabel()
    let yesButton: UIButton = UIButton()
    let noButton: UIButton = UIButton()
    let midButton: UIButton = UIButton()
    var answer:Answer?
    var question: Question?
    var presents: Presents?
    
    
    
    static func instance(viewModel: HomeViewModel) -> QuestionViewController? {
        let questionViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "QuestionViewController") as? QuestionViewController
        questionViewController?.homeViewModel = viewModel
        return questionViewController
    }
    
    fileprivate var homeViewModel: HomeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answer = homeViewModel?.answer
        
        do {
            let realm = try Realm()
            let question = realm.objects(Question.self)
            print("question: \(question)")
        } catch let error as NSError {
            print("ERROR: \(error)")
        }

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

private extension QuestionViewController {
    @objc
    func nextBtnTapped() {
        print("next button in start tapped")
        next()
        storeData()
    }
}
