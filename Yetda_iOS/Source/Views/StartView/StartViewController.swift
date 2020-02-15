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
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
                        if (updates.isEmpty || updates[0].updated_at != firestoreDate) || firestoreDate == "" {
//                            print("localDB: \(localDB)")
                            let newUpdates = Updates()
                            do {
                                try realm.write {
                                   realm.deleteAll()
                                    
                                }
                                
                                self.dumpNewDataFromFirebase(database: self.database)
                                
                                newUpdates.updated_at = firestoreDate
                                try realm.write {
                                    realm.add(newUpdates)
                                    print("true")
                                }
                                let dbInstance = realm.objects(Presents.self)
                                print("dbInstance: \(dbInstance), firedate: \(realm.objects(Updates.self)[0])")
                            } catch let error as NSError {
                                print("ERROR: \(error)")
                            }
                            
                        } else if updates[0].updated_at == firestoreDate && firestoreDate != "" {
                            do {
//                                    try realm.write {
//                                       realm.deleteAll()
//                                    }
                                print("firestoreData: \(firestoreDate), localDB: \(realm.objects(Presents.self)), Updates: \(realm.objects(Updates.self))")
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
                    schemaVersion: 4,

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
    
    func dumpNewDataFromFirebase(database: Firestore?) {
        let presentsRef = database?.collection("presents")
//        let questionRef = database?.collection("question")
        let newDB = Presents()
        
//        let firestoreDate = fetchRecentUpdateDate(database: database).andThen { (result) in
//            switch result {
//            case .success(let fetchedDate):
//            date = "\(fetchedDate)"
//            case .failure(_):
//            break
//            }
            
//            newDB.updated_at = date
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
        next()
        storeData()
    }
}
