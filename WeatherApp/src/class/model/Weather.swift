//
//  Weather.swift
//  WeatherApp
//
//  Created by Halit Uğurgelen on 27.06.2020.
//  Copyright © 2020 Halit Uğurgelen. All rights reserved.
//

import Foundation

enum WeatherType: UInt {
    case defaultWeather = 0 // used for initial state, checked for errors
    case sunny
    case cloudy
    case rainy
    case windy
    case rainyWithThunder
    case snowy
}

class Weather {
    var date       : Date
    var weather    : WeatherType
    var temperature: Int
    
    // default init.
    init() {
        date        = .init(timeIntervalSinceNow: .init(0))
        weather     = .defaultWeather // TODO: handle default case for errors
        temperature = 0
    }
    
    // assign-all init.
    init(date: Date, weather: WeatherType, temperature: Int) {
        self.date        = date
        self.weather     = weather
        self.temperature = temperature
    }
}
