//
//  ViewController.swift
//  Yetda_iOS
//
//  Created by Leon Kong on 2020/01/07.
//  Copyright © 2020 Yetda. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import SnapKit
import RealmSwift

class StartViewController: BaseViewController {
    //    var database: Firestore!
    @IBOutlet weak var startButton: UIButton!
    var database: Firestore?
    
    static func instance(viewModel: HomeViewModel) -> StartViewController? {
        let startViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "StartViewController") as? StartViewController
        startViewController?.homeViewModel = viewModel
        return startViewController
    }
    
    fileprivate var homeViewModel: HomeViewModel?
    
    
    /// custom setup
    override func setup() {
        super.setup()
        startButton.setNextButton(isEnable: true, title: "시작하기")
        startButton.addTarget(self, action: #selector(startBtnTapped), for: .touchUpInside)
        
        startButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.left.right.equalTo(self.view).inset(24)
            make.bottom.equalTo(self.view).inset(50)
            make.height.equalTo(44)
        }
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
                let settings = FirestoreSettings()
                Firestore.firestore().settings = settings
                database = Firestore.firestore()
                // Do any additional setup after loading the view.
        
        database?.collection("updates").getDocuments() { (querySnapshot, err) in
                    if let err = err {
                        print("Error getting documents: \(err)")
                    } else {
                        for document in querySnapshot!.documents {
                            print("\(document.documentID) => \(document.data())")
                        }
//                        for document in querySnapshot!.documents {
//                            print("\(document.data())")
//                        }
                    }
                }
        
    }
}

extension StartViewController: HomeViewControllerable {
    func next() {
        homeViewModel?.startBtnTapped()
    }
    
    func prev() {
        
    }
    
    func storeData() {
//        homeViewModel?.storeAnswer(name: "123123123")
    }
    
    
}

private extension StartViewController {
    @objc
    func startBtnTapped() {
        next()
        storeData()
    }
}
