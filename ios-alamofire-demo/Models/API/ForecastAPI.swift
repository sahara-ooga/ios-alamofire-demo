//
//  ForecastAPI.swift
//  ios-alamofire-demo
//
//  Created by Kentaro on 2017/03/14.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import Foundation
import ObjectMapper

final class ForecastAPI {

    var loadable: ForecastLoadable?

    func fetch() {

        APIClient().request { [weak self] (response) in

            switch response {

            case .success(let result):

                if let forecastResult = Mapper<ForecastResults>().map(JSONObject: result) {

                    if let status = self?.setResult(result: forecastResult) {
                        self?.loadable?.setStatus(status: status)
                    }
                }

            case .failure(let error):
                self?.loadable?.setStatus(status: .error(error))
            }
        }
    }

    private func setResult(result: ForecastResults) -> ForecastStatus {
        return result.forecasts.count > 0 ? .nomal(result) : .noData
    }
}
