//
//  ForecastImage.swift
//  ios-alamofire-demo
//
//  Created by Kentaro on 2017/03/14.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import Foundation
import ObjectMapper

struct ForecastImage: Mappable {

    var url = ""

    init?(map: Map) {}

    mutating func mapping(map: Map) {
        url <- map["url"]
    }
}
