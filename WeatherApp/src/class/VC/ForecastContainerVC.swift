//
//  ForecastContainerVC.swift
//  WeatherApp
//
//  Created by Halit Uğurgelen on 27.06.2020.
//  Copyright © 2020 Halit Uğurgelen. All rights reserved.
//

import UIKit

class ForecastContainerVC: UIViewController {

    @IBOutlet var forecastContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        forecastContainer.layer.cornerRadius = 20
    }
    
    @IBOutlet weak var Forecast1: UIView!
    @IBOutlet weak var Forecast2: UIView!
    @IBOutlet weak var Forecast3: UIView!
    @IBOutlet weak var Forecast4: UIView!
    @IBOutlet weak var Forecast5: UIView!
    
    typealias weatherTuple = (day: Date, weather: String, temp: Int)
    
    var forecastViewArray: [UIView?] = []
    
    init() {
        forecastViewArray.append(Forecast1)
        forecastViewArray.append(Forecast2)
        forecastViewArray.append(Forecast3)
        forecastViewArray.append(Forecast4)
        forecastViewArray.append(Forecast5)
        
        // dummy super.init call
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    subscript(index: Int) -> UIView? {
        get {
            return forecastViewArray[index % 5]
        }
        set(input) {
            forecastViewArray[index % 5] = input
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
