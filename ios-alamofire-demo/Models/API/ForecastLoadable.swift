//
//  ForecastLoadable.swift
//  ios-alamofire-demo
//
//  Created by Kentaro on 2017/03/14.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import Foundation

enum ForecastStatus {
    case none
    case nomal(ForecastResults)
    case noData
    case error(Error)
}

protocol ForecastLoadable {
    func setStatus(status: ForecastStatus)
}
