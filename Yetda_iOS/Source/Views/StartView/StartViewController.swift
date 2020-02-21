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
import BrightFutures

class StartViewController: BaseViewController {
    //    var database: Firestore!
//    @IBOutlet weak var startButton: UIButton!
    var startButton = UIImageView(image: UIImage(named: "floating_button")!)
    var database: Firestore?
    var updated_at: Timestamp?
    var contentView = UIView()
    var guideLabelView = UIView()
    var imageView = UIImageView(image: UIImage(named: "artboard14X")!)
    var guideText = UILabel()
    var cardView = UIView()
    var subText = UILabel()
    var scrollView = UIScrollView()
    
    static func instance(viewModel: HomeViewModel) -> StartViewController? {
        let startViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "StartViewController") as? StartViewController
        startViewController?.homeViewModel = viewModel
        return startViewController
    }
    
    fileprivate var homeViewModel: HomeViewModel?
    
    
    /// custom setup
    override func setup() {
        super.setup()
        startButton.isUserInteractionEnabled = true
        startButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(startBtnTapped)))
        
        
        
//        setScrollView()
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setScrollView()
        
        // Realm Migrationx
        mirgateRealm()
        
        
        // MARK: - firebase firestore
        
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        database = Firestore.firestore()
        
        do {
          let realm = try Realm()
//            try realm.write {
//                realm.deleteAll()
//            }
//            print(realm.objects(Present.self))
            
            fetchRecentUpdateDate(database: database).andThen { (result) in
                switch result {
                case .success(let firestoreDate):
                    
                        let updates = realm.objects(Updates.self)
//                        var newLocalDB = Database()
                        print("firestore: \(firestoreDate)")
                        // 앱 내 데이터 없음 혹은 firestore 데이터 업데이트 발견
                        if (updates.isEmpty || updates[0].updated_at != firestoreDate) || firestoreDate == "" {
//                            print("localDB: \(localDB)")
                            let newUpdates = Updates()
                            do {
                                try realm.write {
                                   realm.deleteAll()
                                    
                                }
                                
                                self.dumpPresentsFromFirebase(database: self.database)
                                self.dumpQuestionFromFirebase(database: self.database)
                                
                                newUpdates.updated_at = firestoreDate
                                try realm.write {
                                    realm.add(newUpdates)
//                                    print("true")
                                }
                                let dbInstance = realm.objects(Presents.self)
//                                print("dbInstance: \(dbInstance), firedate: \(realm.objects(Updates.self)[0])")
                            } catch let error as NSError {
                                print("ERROR: \(error)")
                            }
                            // 업데이트 불필요
                        } else if updates[0].updated_at == firestoreDate && firestoreDate != "" {
                            self.clearUserModifiedDataFromRealm()
                            do {
//                                    try realm.write {
//                                       realm.deleteAll()
//                                    }
//                                print("firestoreData: \(firestoreDate), localDB: \(realm.objects(Presents.self)), Updates: \(realm.objects(Updates.self)), Question: \(realm.objects(Question.self))")
                            } catch let error as NSError {
                                print("ERROR: \(error)")
                            }
                            
                        } else {
                            print("ERROR: UNDEFINED")
                        }
                    case .failure(_):
                    break
                    }
                    
                }
//            print(realm.objects(Presents.self))
        } catch let error as NSError {
            print("ERROR: \(error)")
        }
    }
    

    
    func fetchRecentUpdateDate(database: Firestore?) -> Future<String, Never> {
        return Future {complete in
            database?.collection("updates").getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    let date = querySnapshot!.documents[0].get("updated_at")
//                    print("date: \(date)")
                    if let unWrappedData = date as? Timestamp {
                        complete(.success("\(unWrappedData)"))
                    }
                }
            }
        }
    }
//
    func mirgateRealm() {
                let config = Realm.Configuration(
                    // Set the new schema version. This must be greater than the previously used
                    // version (if you've never set a schema version before, the version is 0).
                    schemaVersion: 5,

                    // Set the block which will be called automatically when opening a Realm with
                    // a schema version lower than the one set above
                    migrationBlock: { migration, oldSchemaVersion in
                        // We haven’t migrated anything yet, so oldSchemaVersion == 0
                        if (oldSchemaVersion < 2) {
                            // Nothing to do!
                            // Realm will automatically detect new properties and removed properties
                            // And will update the schema on disk automatically
                        }
                    })

                // Tell Realm to use this new configuration object for the default Realm
                Realm.Configuration.defaultConfiguration = config

                // Now that we've told Realm how to handle the schema change, opening the file
                // will automatically perform the migration
        //        let realm = try! Realm()
                do {
                    let realm = try Realm()
                } catch let error as NSError {
                    print("ERROR: \(error)")
                }
                print("migration success")
    }
    
    func clearUserModifiedDataFromRealm() {
        do {
            let realm = try Realm()
            let questions = realm.objects(Question.self)
            
            for question in questions {
                try realm.write {
                    question.isAsked = false
                }
            }
            
        } catch let error as NSError {
            print(error)
        }
    }
    
    func dumpQuestionFromFirebase(database: Firestore?) {
        let questionRef = database?.collection("question")
        let questions = Questions()
        
        print("dumpQuestionFromFirebase")
        
        questionRef?.getDocuments(completion: { (querySnapshot, error) in
            if let err = error {
                    print(err)
                } else {
                    for doc in querySnapshot!.documents {
//                        print("question: \(doc.data())")
                        if let data = doc.data() as? [String: Any] {
                            let qs = Question()
                            
                            if let id = data["id"] as? Int {
                                qs.id = id
                            }
                            if let question = data["question"] as? String {
                                qs.question = question
                            }
                            if let tag = data["tag"] as? String {
                                qs.tag = tag
                            }
                            questions.questions.append(qs)
                            // question 관련 로직 들어갈 필요.

                        }
                    }
                }
                do {
                    let realm = try Realm()
                    try realm.write {
                        realm.add(questions)
                    }
                } catch {
                    print("failed")
                }

        })
    }
    
    func dumpPresentsFromFirebase(database: Firestore?) {
        let presentsRef = database?.collection("presents")
//        let questionRef = database?.collection("question")
        let newDB = Presents()
        
            presentsRef?.getDocuments(completion: { (querySnapshot, error) in
                        if let err = error {
                            print(err)
                        } else {
                            for doc in querySnapshot!.documents {
                                if let data = doc.data() as? [String: Any] {

                                    let present = Present()
                                    if let id = data["id"] as? Int {
                                        present.id = id
                                    }
                                    if let name = data["name"] as? String {
                                        present.present = name
                                    }
                                    if let price = data["price"] as? Int {
                                        present.price = String(price)
                                        print(present.price)
                                    }
                                    if let tags = data["tags"] as? [String] {
                                        for tag in tags {
                                            present.tags.append(tag)
                                        }
                                    }
                                    newDB.presents.append(present)
                                    // question 관련 로직 들어갈 필요.
                            
                                }
                            }
                        }
                        do {
                            let realm = try Realm()
                            try realm.write {
                                realm.add(newDB)
                            }
                        } catch {
                            print("failed")
                        }
                    })
        }
//    }
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
        storeData()
        next()
    }
}
