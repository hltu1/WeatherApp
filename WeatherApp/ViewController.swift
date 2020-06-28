//
//  ViewController.swift
//  WeatherApp
//
//  Created by Halit Uğurgelen on 26.06.2020.
//  Copyright © 2020 Halit Uğurgelen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var weatherStorage: WeatherStorage = .init()
        
        // dummy data for test
        for dayCounter in 0...4 {
            for hourCounter in 0...23 {
                let today: Date = .init(timeIntervalSinceNow: .init(86400 * dayCounter))
                let temp : Int = (dayCounter * 24) + hourCounter
                let weatherType: WeatherType = WeatherType(rawValue: UInt.random(in: 1...6))!
                
                let weather = Weather.init(date: today, weather: weatherType, temperature: temp)
                weatherStorage[dayCounter][hourCounter] = weather
            }
        }
    }
}
