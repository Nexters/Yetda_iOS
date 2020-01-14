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

class StartViewController: UIViewController {
//    var database: Firestore!
    @IBOutlet weak var startButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let settings = FirestoreSettings()
//        Firestore.firestore().settings = settings
//        database = Firestore.firestore()
//        // Do any additional setup after loading the view.
//
//        database.collection("presents").getDocuments() { (querySnapshot, err) in
//            if let err = err {
//                print("Error getting documents: \(err)")
//            } else {
//                for document in querySnapshot!.documents {
//                    print("\(document.documentID) => \(document.data())")
//                }
//            }
//        }
        setupStartButton()
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: - Add AutoLayout to Button
    func setupStartButton() {
//        view.snp.makeConstraints { (make) in
//            make.topMargin.equalTo(view.safeAreaLayoutGuide.snp.top)
//            make.leftMargin.equalTo(view.safeAreaLayoutGuide.snp.left)
//            make.rightMargin.equalTo(view.safeAreaLayoutGuide.snp.right)
//            make.bottomMargin.equalTo(view.safeAreaLayoutGuide.snp.bottom)
//        }
        startButton.setTitle("시작하기", for: .normal)
        startButton.backgroundColor = .lightGray
        startButton.layer.cornerRadius = 10
        startButton.tintColor = .white
        startButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.width.equalTo(200)
            make.height.equalTo(40)
            make.bottom.equalTo(-80)
        }
    }
}

