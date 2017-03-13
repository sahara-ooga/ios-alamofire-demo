//
//  APIClient.swift
//  ios-alamofire-demo
//
//  Created by Kentaro on 2017/03/13.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import Foundation
import Alamofire

enum Result<Value> {
    case success(Value)
    case failure(Error)
}

final class APIClient {

    // 東京の天気
    static let ulrString = "http://weather.livedoor.com/forecast/webservice/json/v1?city=130010"

    func request(completionHandler: @escaping (Result<Any>) -> () = {_ in}) {

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
    }
}
