//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Aisha Hanif on 11/30/16.
//  Copyright © 2016 Aisha Hanif. All rights reserved.
//

import Foundation
import SwiftyJSON
enum WeatherResult {
    case Success(WelcomeWeather)
    case Error(String)
}

fileprivate let API_KEY = "245c1be40b4aea488ec3958c469699e7"
fileprivate let BASE_URL = "http://api.openweathermap.org/data/2.5/forecast"
fileprivate let NUMBER_OF_DAYS_TO_FORECAST = "5"

class WeatherService {
    
    func weather(forCity city: String, completionHandler: @escaping (WeatherResult) -> Void) {
        let escapedCity = city.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = URL(string: "\(BASE_URL)?id=\(escapedCity)&cnt=\(NUMBER_OF_DAYS_TO_FORECAST)&APPID=\(API_KEY)")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completionHandler(.Error(error.localizedDescription))
                return
            }
            guard let data = data else {
                completionHandler(.Error("No data received"))
                return
            }
            completionHandler(self.weather(forCity: city, fromJsonData: data))
        }
        task.resume()
    }
    func celsiusFromKelvin(kelvin: Double) -> Double {
        return kelvin - 273.15
    }
    func weather(forCity city: String, fromJsonData data: Data) -> WeatherResult {
                print(data.description)
                let str = String(decoding: data, as: UTF8.self)
                   print(str)
       
        
        
        let json = try? JSON(data: data)
        let cod = json!["cod"].stringValue
        let message = json!["message"].intValue
        let cnt = json!["cnt"].intValue
        
        // If not a Dictionary or nil, return [:]
        let city: Dictionary<String, JSON> = (json?["city"].dictionaryValue)!
        let coord: Dictionary<String, JSON> = (city["coord"]!.dictionaryValue)
        let lat = coord["lat"]!.doubleValue
        let long = coord["lon"]!.doubleValue
        let country = city["country"]!.stringValue
        let did = city["id"]!.intValue
        let name = city["name"]!.stringValue
        
        let citym = City(geonameID: did, name: name, lat: lat, lon: long, country: country, iso2: "", type: "", population: 1)
        
        // If not an Array or nil, return []
        let list: Array<JSON> = (json?["list"].arrayValue)!
        let temp = Temp(day: 0.1, min: 0.1, max: 0.1, night: 0.1, eve: 0.1, morn: 0.1)
        let weathers = [Weather(id: 6, main: "22", weatherDescription: "dd", icon: "ss")]
        let list1 = [List(dt: 2, temp: temp, pressure: 0.1, humidity: 1, weather: weathers, speed: 0.1, deg: 1, clouds: 1, snow:1)]
    
                return .Success(WelcomeWeather(cod: cod, message: message, city: citym, cnt: cnt, list: list1))

    }
    
}
