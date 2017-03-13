//
//  Forecast.swift
//  ios-alamofire-demo
//
//  Created by Kentaro on 2017/03/14.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import Foundation
import ObjectMapper

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
