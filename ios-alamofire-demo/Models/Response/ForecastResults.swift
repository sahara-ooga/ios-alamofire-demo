//
//  forecastResults.swift
//  ios-alamofire-demo
//
//  Created by Kentaro on 2017/03/13.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import Foundation
import ObjectMapper

struct ForecastResults: Mappable {

    var forecasts = [Forecast]()

    init?(map: Map) {}

    mutating func mapping(map: Map) {
        forecasts <- map["forecasts"]
    }
}
