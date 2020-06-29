//
//  Requester.swift
//  WeatherApp
//
//  Created by Halit Uğurgelen on 27.06.2020.
//  Copyright © 2020 Halit Uğurgelen. All rights reserved.
//

import Foundation

class Requester {
    /*
     * inputs:
     * - URL     : source of data from related API
     * - location: to ask weather of given location
     *             (current location- to be obtained via phone GPS)
     *
     * variables:
     * - date: by today; will also be used for including next 5 days
     * - data: to be obtained from the service;
     *         expected to be contained in a structure,
     *         e.g. in JSON format
     *
     * outputs:
     * - an hourly (for 24 hours) and a daily (for 5 days) array of:
     *   - temperatures
     *   - weather
     *   (these will be extracted from obtained data
     *    using location and date)
     */
    
    static let weatherStorage: WeatherStorage = .init()
    
    init() {
        
        // dummy data for test
        for dayCounter in 0...4 {
            for hourCounter in 0...23 {
                let today: Date = .init(timeIntervalSinceNow: .init(86400 * dayCounter))
                let temp : Int = (dayCounter * 24) + hourCounter
                let weatherType: WeatherType = WeatherType(rawValue: UInt.random(in: 1...6))!
                
                let weather = Weather.init(date: today, weather: weatherType, temperature: temp)
                Requester.weatherStorage[dayCounter, hourCounter] = weather
            }
        }
    }
}
