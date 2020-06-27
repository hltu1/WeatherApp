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
    
    // methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        hourBackground.layer.cornerRadius = 20
    }
    
    init() {
        
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
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
