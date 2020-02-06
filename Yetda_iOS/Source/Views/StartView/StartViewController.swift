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
    
    
    /// custom setup
    override func setup() {
        super.setup()
        setupButton(button: startButton)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func setupButton(button: UIButton) {
        super.setupButton(button: startButton)
        button.setTitle("시작하기", for: .normal)
    }
    
    
    override func setupUI() {
        super.setupUI()
        
        startButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.width.equalTo(240)
            make.height.equalTo(36)
            make.bottom.equalTo(-80)
        }
    }
    
    
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
        
    }
}
