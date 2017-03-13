//
//  ViewController.swift
//  ios-alamofire-demo
//
//  Created by Kentaro on 2017/03/13.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import UIKit
import SVProgressHUD
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var telopLabel: UILabel!

    let forecastAPI = ForecastAPI()
    var forevastStatusType = ForecastStatus.none

    @IBAction private func didTapFetchButton(_ sender: UIButton) {
        SVProgressHUD.show()
        forecastAPI.loadable = self
        forecastAPI.fetch()
    }
}

extension ViewController: ForecastLoadable {

    func setStatus(status: ForecastStatus) {

        SVProgressHUD.dismiss()

        forevastStatusType = status

        switch status {

        case .none:
            SVProgressHUD.showInfo(withStatus: "none!")

        case .nomal(let result):
            updateForecast(result: result)

        case .noData:
            SVProgressHUD.showInfo(withStatus: "NoData!")

        case .error(let error):
            SVProgressHUD.showError(withStatus: "Erroo!")
            print("error: \(error)")
        }
    }

    private func updateForecast(result: ForecastResults?) {

        guard let results = result?.forecasts else { return }

        let forecast = results[0]

        guard
            let image = forecast.image,
            let url = URL(string: image.url) else { return }

        dateLabel.text = forecast.dateLabel
        telopLabel.text = forecast.telop

        imageView.kf.setImage(with: url,
                              placeholder: nil,
                              options: [.transition(ImageTransition.fade(1)), .keepCurrentImageWhileLoading],
                              progressBlock: { (receivedSize, totalSize) in
                                print("receivedSize: \(receivedSize) \ntotalSize: \(totalSize)")
        },
                              completionHandler: { image, error, cacheType, imageURL in
                                print("Finished\nimage: \(image), erroe: \(error), cacheType: \(cacheType), imageURL: \(imageURL)")
        })
    }
}

