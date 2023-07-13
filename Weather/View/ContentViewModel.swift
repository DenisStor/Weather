//
//  ContentViewModel.swift
//  Weather
//
//  Created by Денис Сторожев on 13.07.2023.
//

import Foundation
import WeatherKit

@MainActor class WeatherKitManager: ObservableObject {
    
    @Published var weather: Weather?
    
    
    func getWeather() async {
        do {
            weather = try await Task.detached(priority: .userInitiated) {
                return try await WeatherService
                    .shared
                    .weather(for: .init(latitude: 54.43, longitude: 20.30))
            }.value
        } catch {
            fatalError("\(error)")
        }
    }
    
    var symbol: String {
        weather?.currentWeather.symbolName ?? "xmark"
    }
    
    var tempNow: Int {
         let temp =
        weather?.currentWeather.temperature
        
        let convert = round((temp?.converted(to: .celsius).value) ?? 0)
        
        return Int(convert)
        
    }
    var tempOne : String {
        let temp = weather?.hourlyForecast[1].condition.description
        return temp ?? "nil"
    }
    var tempTwo : Int {
        let temp = weather?.hourlyForecast[3].temperature.value
        return Int(temp ?? 0)
    }
    var tempOThree : Int {
        let temp = weather?.hourlyForecast[5].temperature.value
        return Int(temp ?? 0)
        
    }
    var isDay : Bool {
        let isday = weather?.currentWeather.isDaylight
        return isday ?? true
    }
    var windNow : Int {
        let windCurrent = weather?.currentWeather.wind.speed.value
        return Int(windCurrent ?? 0)
    }
   
   
    
    
}
