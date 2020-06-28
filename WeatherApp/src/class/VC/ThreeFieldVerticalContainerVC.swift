//
//  ThreeFieldVerticalContainerVC.swift
//  WeatherApp
//
//  Created by Halit Uğurgelen on 27.06.2020.
//  Copyright © 2020 Halit Uğurgelen. All rights reserved.
//

import UIKit

protocol TFVCDelegate {
    func tapSignalHandling(side: AdjacentHourSide)
}

enum AdjacentHourSide {
    case defaultSide
    case previous
    case next
}

class ThreeFieldVerticalContainerVC: UIViewController {
    
    enum ContainerType {
        case defaultType
        case selectedHour
        case adjacentHour
        case forecastDay
    }
    
    var delegate: TFVCDelegate?
    
    private var _weather: Weather = .init()
    var weather: Weather {
        get {
            return self._weather
        }
        set(input) {
            self._weather = input
            
            // update contents of IBOutlets
            
            timeLabel.text = { () -> String in
                var hourString: String
                let dateFormatter: DateFormatter = .init()
                dateFormatter.dateFormat = "HH:00"
                hourString = dateFormatter.string(from: input.date)
                return hourString
            }()
            
            // weatherIcon = ...
            
            temperatureLabel.text = String(input.temperature) + "°"
        }
    }
    
    @IBOutlet weak var timeLabel       : UILabel!
    @IBOutlet weak var weatherIcon     : UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var hourBackground: UIView!
    @IBOutlet      var selectedHourWeatherContainerView: UIView!
    
    var containerType   : ContainerType    = .defaultType
    var adjacentHourSide: AdjacentHourSide = .defaultSide
    
    // methods
    
    init() { super.init(nibName: nil, bundle: nil) }
    init(weather: Weather) {
        super.init(nibName: nil, bundle: nil)
        self.weather = weather
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
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
                
                switch adjacentHourSide {
                    case .previous:
                        temperatureLabel.text = "10°"
                    case .next:
                        temperatureLabel.text = "12°"
                    default:
                        temperatureLabel.text = "17°"
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
    
    @IBAction func didTap(_ sender: Any) {
        delegate?.tapSignalHandling(side: adjacentHourSide)
    }
}
