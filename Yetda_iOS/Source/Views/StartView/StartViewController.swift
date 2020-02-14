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
    var updated_at: Timestamp?
    
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
        
        do {
          let realm = try Realm()
            try realm.write {
                realm.deleteAll()
            }
            print(realm.objects(Present.self))
//            let db = realm.objects(Database.self)
            
            if let firestoreDate = getRecentUpdatedDate(database: database) as? String {
                let localDate = realm.objects(Database.self)
//                if localDate[0].updated_at == firestoreDate {
//                    print(true)
//                } else {
////                    print(localDate[0].updated_at)
//                    print(firestoreDate)
//                }
//                print(firestoreDate)
            }
        } catch let error as NSError {
          // handle error
        }
        
//        dumpNewDataFromFirebase(database: database)
            
                    database?.collection("updates").getDocuments() { (querySnapshot, err) in
                                if let err = err {
                                    print("Error getting documents: \(err)")
                                } else {
//                                    for document in querySnapshot!.documents {
//                                        let date = document.get("updated_at")
//                                        print(date)
                                    let date = querySnapshot!.documents[0].get("updated_at")
                                }
                            }
                
        
        

                // Do any additional setup after loading the view.
        

        
    }
    
    func getRecentUpdatedDate(database: Firestore?) -> String {
        var firestoreDate = ""
        database?.collection("updates").getDocuments() { (querySnapshot, err) in
                    if let err = err {
                        print("Error getting documents: \(err)")
                    } else {
                        let date = querySnapshot!.documents[0].get("updated_at")
                        if let unWrappedData = date as? Timestamp {
                            firestoreDate = "\(unWrappedData)"
                        }
                    }
                }
        return firestoreDate
    }
    
    func storePresentInRealm(present: Present) {
        do {
            let realm = try Realm()
            
                // 선물을 realm에 추가
                try realm.write {
                    realm.add(present)
                }
        } catch let error as NSError {
            print(error)
        }
    }
    
    func dumpNewDataFromFirebase(database: Firestore?) {
        let presentsRef = database?.collection("presents")
        presentsRef?.getDocuments(completion: { (querySnapshot, error) in
            if let err = error {
                print(err)
            } else {
                for doc in querySnapshot!.documents {
//                    let docData = doc.data()
//                    let present = Present()
                    
                    if let data = doc.data() as? [String: Any] {
                        let present = Present()
                        if let name = data["name"] as? String {
                            present.present = name
                        }
                        if let price = data["price"] as? Int {
                            present.price = String(price)
                        }
                        if let tags = data["tags"] as? [String] {
                            for tag in tags {
                                present.tags.append(tag)
                            }
                        }
                        
                    }
                    
//                    if let dict = docData["tags"] as? [String], !dict.isEmpty {
//                        print(dict)
//                    }
                }
            }
        })
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
