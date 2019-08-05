//
//  MainViewController.swift
//  WeatherApp
//
//  Created by Aisha on 02/08/2019.
//  Copyright © 2019 Aisha. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    
    private let userDefaults = AppUserDefaults()
    private var results = [WeatherResult]()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
       
        return scrollView
    }()
    
    let scrollViewContainer: UIStackView = {
        let view = UIStackView()
        
        view.axis = .vertical
        view.spacing = 5
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let redView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 265).isActive = true
        view.backgroundColor = .clear
        view.addSubview(TodaysWeatherHeader())
        return view
    }()
    
    let blueView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 500).isActive = true
        view.backgroundColor = .clear
        view.addSubview(TodaysWeatherByHours())
        return view
    }()
    
    let greenView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 1200).isActive = true
        view.backgroundColor = .clear
        view.addSubview(ThisWeekWeather())
        return view
    }()
    
    
    let blackView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 500).isActive = true
        view.backgroundColor = .clear
        view.addSubview(WeatherDetails())
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        self.view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)
        scrollViewContainer.addArrangedSubview(redView)
        scrollViewContainer.addArrangedSubview(blueView)
        scrollViewContainer.addArrangedSubview(greenView)
        scrollViewContainer.addArrangedSubview(blackView)
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        scrollViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        scrollViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        // this is important for scrolling
        scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        let appHeader = AppHeader()
        self.view.addSubview(appHeader)
        getWeather()
    }

     func getWeather() {
        let city = "2193734" as String
        if (city != "")
        {
            
        }else{
             return
        }
        WeatherService().weather(forCity: city) { result in
            DispatchQueue.main.async { self.processResult(result: result) }
        }
        userDefaults.saveLastCity(city)
    }
    
    
    private func processResult(result: WeatherResult) {
        if case let .Error(error) = result {
            let alert = UIAlertController(title: "Error", message: "An error occurred while fetching weather information.\n\(error)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        results.append(result)
//        resultsTable.insertRows(at: [IndexPath(row: self.results.count - 1, section: 0)], with: .bottom)
    }
}

