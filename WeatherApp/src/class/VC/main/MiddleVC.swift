//
//  MiddleVC.swift
//  WeatherApp
//
//  Created by Halit Uğurgelen on 27.06.2020.
//  Copyright © 2020 Halit Uğurgelen. All rights reserved.
//

import UIKit

class MiddleVC: UIViewController, TFVCDelegate {
    
    var previousAdjacentHourContainerReference: ThreeFieldVerticalContainerVC = .init()
    var         selectedHourContainerReference: ThreeFieldVerticalContainerVC = .init()
    var     nextAdjacentHourContainerReference: ThreeFieldVerticalContainerVC = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let vc: ThreeFieldVerticalContainerVC = segue.destination as? ThreeFieldVerticalContainerVC else { return }
        
        // give name of side hours based on name of the connected segue
        switch segue.identifier {
            case "previousAdjacentHourContainer": do {
                vc.adjacentHourSide = .previous
                
                // TODO: gather common functionality (as below) at common locations
                previousAdjacentHourContainerReference = vc
                vc.delegate = self
            }
            case "selectedHourContainer": do {
                
                // TODO: gather common functionality (as below) at common locations
                selectedHourContainerReference = vc
            }
            case "nextAdjacentHourContainer": do {
                vc.adjacentHourSide = .next
                
                // TODO: gather common functionality (as below) at common locations
                nextAdjacentHourContainerReference = vc
                vc.delegate = self
            }
            default:
                break
        }
    }
    
    func tapSignalHandling(side: AdjacentHourSide) {
        /* here, view updates will be done.
         * in order for that, references to:
         * - hourly weather views,
         * - hourly weather information
         * must be possessed to transfer the data.
         */
        
        rollHours(to: side)
        
        // switch (pressedSide) {
        //     case .previous: do {
        //         if previous hour is not pointing to first hour of the day (0) {
        //             move data contained in middle column into next one (from "selected hour" into "next hour")
        //             move data contained in left (this) column into next one (from "previous hour" into "selected hour")
        //             calculate time as: (prev-1)
        //             obtain [prev-1]th hour's temperature
        //             obtain [prev-1]th hour's weather
        //             place into ThreeColumnContainer format
        //             move data obtained from array using (prev-1)th hour into left (this) column (into "previous hour")
        //         }
        //     }
        //     case .next: do {
        //         if next hour is not pointing to last hour of the day (23) {
        //             move data contained in middle column into previous one (from "selected hour" into "previous hour")
        //             move data contained in right (this) column into previous one (from "next hour" into "selected hour")
        //             calculate time as: (next+1)
        //             obtain [next+1]th hour's temperature
        //             obtain [next+1]th hour's weather
        //             place into ThreeColumnContainer format
        //             move data obtained from array using (next+1)th hour into right (this) column (into "next hour")
        //         }
        //     }
        // <#do stuff#>
    }
    
    func rollHours(to side: AdjacentHourSide) {
        
        let   leftView: UIView = previousAdjacentHourContainerReference.view
        let middleView: UIView =         selectedHourContainerReference.view
        let  rightView: UIView =     nextAdjacentHourContainerReference.view
        
        switch side {
            case .previous: do {
                
                // leftView.subviews[0]
                previousAdjacentHourContainerReference.view = middleView
                        selectedHourContainerReference.view =  rightView
                
                nextAdjacentHourContainerReference = .init(weather: Requester.weatherStorage[0, 1])
                
                // nextAdjacentHourContainerReference.view.subviews
                
            }
            case .next: do {
                nextAdjacentHourContainerReference.view = middleView
                    selectedHourContainerReference.view =   leftView
                // previousAdjacentHourContainerReference.view =
            }
            default:
                break
        }
    }
}
