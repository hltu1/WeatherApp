//
//  Weather.swift
//  WeatherApp
//
//  Created by Halit Uğurgelen on 27.06.2020.
//  Copyright © 2020 Halit Uğurgelen. All rights reserved.
//

import Foundation

class Weather {
    enum Weathers {
        case sunny
        case cloudy
        case rainy
        case windy
        case rainyWithThunder
        case snowy
    }
    
    var date       : Date
    var weather    : Weathers
    var temperature: UnitTemperature
    
    // default init.
    init() {
        date        = .init(timeIntervalSinceNow: .init(0))
        weather     = .sunny // considering sunny weather as default
        temperature = .init(symbol: "˚C") // Celsius degrees
    }
    
    // assign-all init.
    init(date: Date, weather: Weathers, temperature: UnitTemperature) {
        self.date        = date
        self.weather     = weather
        self.temperature = temperature
    }
}
