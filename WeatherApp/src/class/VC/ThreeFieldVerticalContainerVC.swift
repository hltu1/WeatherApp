//
//  ThreeFieldVerticalContainerVC.swift
//  WeatherApp
//
//  Created by Halit Uğurgelen on 27.06.2020.
//  Copyright © 2020 Halit Uğurgelen. All rights reserved.
//

import UIKit

class ThreeFieldVerticalContainerVC: UIViewController {
    
    enum ContainerType {
        case defaultType
        case selectedHour
        case adjacentHour
        case forecastDay
    }
    
    @IBOutlet weak var timeLabel       : UILabel!
    @IBOutlet weak var weatherIcon     : UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var hourBackground: UIView!
    @IBOutlet      var selectedHourWeatherContainerView: UIView!
    
    static var id: Int = 0
    var selfId: Int = 0
    var containerType: ContainerType = .defaultType
    
    // methods
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        selfId = ThreeFieldVerticalContainerVC.id
        ThreeFieldVerticalContainerVC.id += 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch self.title {
            case "SelectedHour":
                self.containerType = .selectedHour
            case "AdjacentHour":
                self.containerType = .adjacentHour
            case "ForecastDay":
                self.containerType = .forecastDay
            default:
                print("title error for " + (self.title ?? "---"))
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
                
                switch self.selfId {
                    case 0: do {
                        temperatureLabel.text = "10°"
                    }
                    case 1: do {
                        temperatureLabel.text = "12°"
                    }
                    default: do {
                        temperatureLabel.text = "17°"
                        print("tag error for tag ", self.selfId)
                    }
                }
                timeLabel.text = "19:00" // TODO: parameterize/handle
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
