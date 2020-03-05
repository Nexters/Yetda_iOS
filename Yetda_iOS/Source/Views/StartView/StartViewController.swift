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
    var historyTableView = UITableView()
    var items: [String] = []
    
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
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setScrollView()
        print("working")
        self.historyTableView.dataSource = self
        self.historyTableView.delegate = self
        self.historyTableView.register(CardTableCell.self,
                                forCellReuseIdentifier: "TableViewCell")

        
        // Realm Migration
        mirgateRealm()
        
        
        // MARK: - firebase-realm integration
        
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        database = Firestore.firestore()
        
        getHistory()
        
        do {
          let realm = try Realm()
            /* Device의 Realm 데이터를 모두 삭제하고 싶을 때 아래 코드를 활성화
             
            try realm.write {
                realm.deleteAll()
            }
            print(realm.objects(Present.self))
             */
            
            fetchRecentUpdateDate(database: database).andThen { (result) in
                switch result {
                case .success(let firestoreDate):
                    
                        let updates = realm.objects(Updates.self)
                        print("firestore: \(firestoreDate)")
                        
                        // 앱 내 데이터 없음 혹은 firestore 데이터 업데이트 발견
                        if (updates.isEmpty || updates[0].updated_at != firestoreDate) || firestoreDate == "" {
                            self.updateLatestData(realm: realm, firestoreDate: firestoreDate)
                            
                        // 업데이트 불필요
                        } else if updates[0].updated_at == firestoreDate && firestoreDate != "" {
                            self.clearUserModifiedDataFromRealm()
                        } else {
                            print("ERROR: UNDEFINED")
                        }
                    case .failure(_):
                    break
                    }
                    
                }
        } catch let error as NSError {
            print("ERROR: \(error)")
        }
    }
    
    // Fetch latest updated date from firebase
    func fetchRecentUpdateDate(database: Firestore?) -> Future<String, Never> {
        return Future {complete in
            database?.collection("updates").getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    let date = querySnapshot!.documents[0].get("updated_at")
                    if let unWrappedData = date as? Timestamp {
                        complete(.success("\(unWrappedData)"))
                    }
                }
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
    }
}

private extension StartViewController {
    @objc
    func startBtnTapped() {
        storeData()
        next()
    }
}

extension StartViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      print(items[indexPath.row])
    }
}

extension StartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell")! as UITableViewCell

      cell.textLabel?.text = items[indexPath.row]

      return cell
    }
}
