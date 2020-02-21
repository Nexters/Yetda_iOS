//
//  ResultViewController.swift
//  Yetda_iOS
//
//  Created by Leon Kong on 2020/01/13.
//  Copyright © 2020 Yetda. All rights reserved.
//

import UIKit
import RealmSwift

class ResultViewController: BaseViewController {
    var backButton =  UIButton()
    var contentView = UIView()
    var cardView = UIView()
    var imageView = UIImageView(image: UIImage(named: "artboard14X")!)
    var guideText = UILabel()
    var presentText = UILabel()
    var subText = UILabel()
    var otherPresentText = UILabel()
    var answer: Answer?
    var present: Present?
    var idx = 0
    
    static func instance(viewModel: HomeViewModel) -> ResultViewController? {
        let resultViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "ResultViewController") as? ResultViewController
        resultViewController?.homeViewModel = viewModel
        return resultViewController
    }
    
    fileprivate var homeViewModel: HomeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("result")
        selectRandomizedPresent()

        // Do any additional setup after loading the view.
        navigationController?.setNavigationBarHidden(false, animated: true)
        presentText.text = present?.present ?? "마카롱 등 디저트"
    }
    
    override func setup() {
        super.setup()
        answer = homeViewModel?.answer
        
        setupUI()
        backButton.addTarget(self, action: #selector(nextBtnTapped), for: .touchUpInside)
    }

        
}

extension ResultViewController: HomeViewControllerable {
    func next() {
//        homeViewModel?.startBtnTapped()
        homeViewModel?.backToStartBtnTapped()
        print("처음으로 돌아가기")
    }
    
    func prev() {
        
    }
    
    func storeData() {
        // store data to realm history
        print("store to realm")
        do {
            let realm = try Realm()
            try realm.write {
                // let myOtherDog = Dog(value: ["name" : "Pluto", "age": 3])
                /*
                 class History: Object {
                     @objc dynamic var date = ""
                     @objc dynamic var birthday = ""
                     @objc dynamic var name = ""
                     @objc dynamic var price = ""
                     let presents = List<Present>()
                 }
                 */
                if let unwrappedAnswer = answer {
                    let dateFormatter = DateFormatter()
                    let date = Date()
                    let dateString = dateFormatter.string(from: date)
                    let history = History(value: ["date": dateString, "birthday": unwrappedAnswer.birthday, "name": unwrappedAnswer.name, "price": present?.price, "presents": unwrappedAnswer.presents])
                    realm.add(history)
                }
                
            }
            
            let outcome = realm.objects(History.self)
            print("History: \(outcome)")
        } catch let error as NSError {
            print(error)
        }
    }
    
    
}

extension ResultViewController {
    func selectRandomizedPresent() {
        if let ans = answer {
//            print(ans.presents![0])
            present = ans.presents![idx]
            print(present)
        }
    }
}

private extension ResultViewController {
    @objc
    func nextBtnTapped() {
//        print("next button in start tapped")
        storeData()
        next()
//        storeData()
    }
}
