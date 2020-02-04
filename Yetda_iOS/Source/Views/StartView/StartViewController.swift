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
        
        let presents = Presents()
        presents.name = "향수"
        presents.tags.append("뷰티")
        presents.tags.append("실용")
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(presents)
            }
            let outcome = realm.objects(Presents.self)
            print(outcome)
        } catch let error as NSError {
            // handle error
            print(error)
        }
        
//        try! realm.write{
//            realm.add(presents)
//        }
        
        
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

class Presents: Object {
        @objc dynamic var name = ""
        let tags = List<String>()
}
