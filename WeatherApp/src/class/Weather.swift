//
//  Weather.swift
//  WeatherApp
//
//  Created by Halit Uğurgelen on 27.06.2020.
//  Copyright © 2020 Halit Uğurgelen. All rights reserved.
//

import Foundation

class Weather {
    var date       : Date
    var weather    : String // TODO: enum
    var temperature: UnitTemperature
    
    enum <#name#> {
        case <#case#>
    }
    
    // default init.
    init() {
        date        = Date.init()
        weather     = ""
        temperature = UnitTemperature.init(symbol: "˚")
    }
    
    // assign-all init.
    init(date: Date, weather: String, temperature: UnitTemperature) {
        self.date        = date
        self.weather     = weather
        self.temperature = temperature
    }
}
