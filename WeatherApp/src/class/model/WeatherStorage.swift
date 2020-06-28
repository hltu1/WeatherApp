//
//  WeatherStorage.swift
//  WeatherApp
//
//  Created by Halit Uğurgelen on 28.06.2020.
//  Copyright © 2020 Halit Uğurgelen. All rights reserved.
//

import Foundation

class WeatherStorage {
    private var weathers: [[Weather]] = [[]]
    
    init() {
        for day in 0...4 {
            weathers.insert([], at: day)
            for hour in 0...23 {
                weathers[day].insert(.init(), at: hour) // initialize with empty Weathers
            }
        }
    }
    
    subscript(index: Int) -> [Weather] {
        get {
            return weathers[index % 5]
        }
        set(input) {
            weathers[index % 5] = input
        }
    }
    
    subscript(index1: Int, index2: Int) -> Weather {
        get {
            return weathers[index1 % 5][index2 % 24]
        }
        set(input) {
            weathers[index1 % 5][index2 % 24] = input
        }
    }
    
}
