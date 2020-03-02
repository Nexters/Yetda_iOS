//
//  StartViewController+realm.swift
//  Yetda_iOS
//
//  Created by Leon Kong on 2020/03/02.
//  Copyright © 2020 Yetda. All rights reserved.
//

import UIKit
import RealmSwift
import FirebaseCore
import FirebaseFirestore

extension StartViewController {
    
    func mirgateRealm() {
                let config = Realm.Configuration(
                    // Set the new schema version. This must be greater than the previously used
                    // version (if you've never set a schema version before, the version is 0).
                    schemaVersion: 6,

                    // Set the block which will be called automatically when opening a Realm with
                    // a schema version lower than the one set above
                    migrationBlock: { migration, oldSchemaVersion in
                        // We haven’t migrated anything yet, so oldSchemaVersion == 0
                        if (oldSchemaVersion < 6) {
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
    
    func updateLatestData(realm: Realm, firestoreDate: String) {
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
            }
            let dbInstance = realm.objects(Presents.self)
        } catch let error as NSError {
            print("ERROR: \(error)")
        }
    }
    
    func getHistory() {
        print("Running")
        do {
            let realm = try Realm()
            let history = realm.objects(History.self)
            
            for h in history {
                items.append(h.name)
            }
            
            
            print("history: \(history)")
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
}
