//
//  ThreeFieldVerticalContainerVC.swift
//  WeatherApp
//
//  Created by Halit Uğurgelen on 27.06.2020.
//  Copyright © 2020 Halit Uğurgelen. All rights reserved.
//

import UIKit

class ThreeFieldVerticalContainerVC: UIViewController {

    @IBOutlet weak var timeLabel       : UILabel!
    @IBOutlet weak var weatherIcon     : UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var hourBackground: UIView!
    @IBOutlet      var selectedHourWeatherContainerView: UIView!
    
    // methods
    
    enum ContainerType {
        case defaultType
        case selectedHour
        case adjacentHour
        case forecastDay
    }
    
    var containerType: ContainerType = .defaultType
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch self.title {
            case "selectedHour":
                self.containerType = .selectedHour
            case "adjacentHour":
                self.containerType = .adjacentHour
            case "forecastDay":
                self.containerType = .forecastDay
            default:
                break
        }
        
        // no need for default since all cases are handled
        switch containerType {
            case .defaultType:
                break
            case .selectedHour: do {
                timeLabel.text = "09:00" // TODO: parameterize/handle
                temperatureLabel.text = "19°"
            }
            case .adjacentHour: do {
                timeLabel.text = "19:00" // TODO: parameterize/handle
                temperatureLabel.text = "17°"
            }
            case .forecastDay: do {
                timeLabel.text = "sun" // TODO: parameterize/handle
                temperatureLabel.text = "15°"
            }
        }
        
        // decide if the view being handled is for current hour or adjacent hours
        let isViewOfCurrentHour: Bool = hourBackground != nil

        // Do any additional setup after loading the view.
        if isViewOfCurrentHour {
            hourBackground.layer.cornerRadius = 20
            selectedHourWeatherContainerView.layer.cornerRadius = 40
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
