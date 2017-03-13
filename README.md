# ios-alamofire-demo
iOS Alamofire・ObjectMapper・KingFisherを利用したデモ(Swift3)

# Alamofire

HTTP通信を行うライブラリ

## 1. PodFile

```
pod 'Alamofire'
```

## 2. import する

```
import Alamofire
```

## 3. 使い方(Usage)

```
Alamofire.request(APIClient.ulrString, method: .get).responseJSON { response in

    switch response.result {

    case .success(let value):
        completionHandler(Result.success(value))

    case .failure:
        if let error = response.result.error {
            completionHandler(Result.failure(error))
        } else {
            fatalError("errorインスタンスがnil")
        }
    }
}
```

# ObjectMapper

JSONなどをオブジェクトへマッピングするライブラリ

## 1. PodFile

```
pod 'ObjectMapper'
```

## 2. import する

```
import ObjectMapper
```

## 3. 使い方(Usage)

```
struct Forecast: Mappable {

    var dateLabel = ""
    var telop = ""
    var image: ForecastImage?

    init?(map: Map) {}

    mutating func mapping(map: Map) {

        dateLabel <- map["dateLabel"]
        telop <- map["telop"]
        image <- map["image"]
    }
}
```

# Kingfisher

非同期に画像を取得することができるライブラリ

## 1. PodFile

```
pod 'Kingfisher'
```

## 2. import する

```
import Kingfisher
```

## 3. 使い方(Usage)

```
imageView.kf.setImage(with: url,
                      placeholder: nil,
                      options: [.transition(ImageTransition.fade(1)), .keepCurrentImageWhileLoading],
                      progressBlock: { (receivedSize, totalSize) in
                        print("receivedSize: \(receivedSize) \ntotalSize: \(totalSize)")
},
                      completionHandler: { image, error, cacheType, imageURL in
                        print("Finished\nimage: \(image), erroe: \(error), cacheType: \(cacheType), imageURL: \(imageURL)")
})
```
