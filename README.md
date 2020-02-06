# 🎁Yetda_iOS💌

![platform:iOS](https://img.shields.io/badge/Platform-iOS-blue) ![language:iOS](https://img.shields.io/badge/Language-Swift-yellow)

## Dependencies

| Depencency | Version |
| ---------- | ------- |
| lottie-ios | 3.1.5   |
| SwiftLint  | 0.38.1  |
| SnapKit    | 5.0.0   |

## Installation

```shell

$ git clone https://github.com/Nexters/Yetda_iOS.git
$ cd Yetda_iOS
$ pod install
```

## Todo

- [x] Adding Dependencies
- [x] Setting empty screens
- [x] Connecting Github repo to Slack
- [x] Complete base functionalities
- [x] Introduce Realm
- [ ] Create Swipe Gesture
- [ ] Connect API
- [ ] Add animations

## How to Use Realm

### Models

**Results Class**
결과를 저장하는 모델. 선물 받을 사람별로 선물 리스트를 저장함.

```swift
class Results: Object {
    let receivers = List<Receiver>()
}
```

**Receiver Class**
선물을 받을 사람에 대한 데이터 모델.
각 선물받을 사람(receiver)은 이름 및 태그 리스트와 선물 리스트를 보유.

```swift
class Receiver: Object {
    @objc dynamic var name = ""
    let tags = List<String>()
    let gifts = List<Gift>()
}

```

**Gift Class**
선물을 정의하는 모델.
각 선물은 이름과 태그 리스트를 보유.

```swift
class Gift: Object {
    @objc dynamic var name = ""
    let tags = List<String>()
}
```

### Usage

**Retrieving Data**

```swift
do {
    let realm = try Realm()
    let retreivedData = realm.objects(Results.self)
    print(retreivedData[0].receivers) // 가져온 데이터의 depth가 5 이상이면 Maximum depth를 초과했다며 print가 안됨.
} catch let error as NSError {
    print(error)
}

```

**Writing Data**

```swift

let results = Results()
// results의 receivers에 생성된 receiver를 append한 후 Realm에 write하면 됨.
do {
    let realm = try Realm()
    try realm.write {
        realm.add(results)
    }

} catch let error as NSError {
    // handle error
    print(error)
}
```

### TODO

- Update/Delete를 위한 id 도입
- Realm 관련 연산은 여러 ViewController에서 공통적으로 필요할 가능성이 높으므로 BaseViewController 등으로 분리 필요.
