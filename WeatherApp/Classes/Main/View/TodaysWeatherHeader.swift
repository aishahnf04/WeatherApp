//
//  TodaysWeatherHeader.swift
//  WeatherApp
//
//  Created by Aisha on 03/08/2019.
//  Copyright © 2019 Aisha. All rights reserved.
//

import UIKit

class TodaysWeatherHeader: UIView {

    @IBOutlet var view: UIView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    func setup() {
        

        UINib(nibName: "TodaysWeatherHeader", bundle: nil).instantiate(withOwner: self, options: nil)
        addSubview(view)
        view.frame.origin.y = 65
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        view.frame.size.width = screenWidth
    }

}
