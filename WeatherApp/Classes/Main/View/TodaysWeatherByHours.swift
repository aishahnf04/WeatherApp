//
//  TodaysWeatherByHours.swift
//  WeatherApp
//
//  Created by Aisha on 03/08/2019.
//  Copyright © 2019 Aisha. All rights reserved.
//

import UIKit

class TodaysWeatherByHours: UIView {

    @IBOutlet var view: UIView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    func setup() {
        
       
        
        UINib(nibName: "TodaysWeatherByHours", bundle: nil).instantiate(withOwner: self, options: nil)
        addSubview(view)
      
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        view.frame.size.width = screenWidth
        view.frame.size.width = screenWidth
    }
}
