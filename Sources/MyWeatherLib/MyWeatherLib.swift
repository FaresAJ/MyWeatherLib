//
//  MyWeatherLib.swift
//  MyWeatherLib
//
//  Created by Ajimi Fares on 22/6/2023.
//

import Foundation
import MapKit

public enum WeatherError: Error {
    /// invalid data from api call
    case invalidData
}

public enum Result<T> {
    /**
        Success Result
        - Parameter T: T can be WeatherModel
    */
    case success(T)
    /**
        Error case
        - Parameter Error?: error can be nil when error are unknown
    */
    case error(Error?)
}

//:MARK ---- URLSessionProtocol ----


public typealias DataTaskResult = (Data?, URLResponse?, Error?) -> Void

public protocol URLSessionProtocol {
    func dataTask(with url: URL, completionHandler: @escaping DataTaskResult) -> URLSessionDataTask
    func dataTask(with request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTask
}

public struct MyWeatherLib {
    
    private var apiKey: String

    public init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    public func getWeatherForLocation(location: CLLocation, completionHandler: @escaping (Result<WeatherModel>) -> Void){
        
        var components = URLComponents()
        components.scheme = "https"
        components.host   = "api.openweathermap.org"
        components.path   = "/data/2.5/weather"
        components.queryItems = [
            URLQueryItem(name: "appid", value: apiKey),
            URLQueryItem(name: "lat", value: "\(location.coordinate.latitude)"),
            URLQueryItem(name: "lon", value: "\(location.coordinate.longitude)")
        ]
        
        URLSession.shared.dataTask(with: components.url!) { data, response, error in
            guard let data = data else {
                completionHandler(Result.error(WeatherError.invalidData))
                return
            }
            do {
                let decoder = JSONDecoder()
                let weather = try decoder.decode(WeatherModel.self, from: data)
                completionHandler(Result.success(weather))
            } catch let error {
                completionHandler(Result.error(error))
            }
        }.resume()
        
    }
    
    public func getWeatherForCityName(name: String, completionHandler: @escaping (Result<WeatherModel>) -> Void){
        
        var components = URLComponents()
        components.scheme = "https"
        components.host   = "api.openweathermap.org"
        components.path   = "/data/2.5/weather"
        components.queryItems = [
            URLQueryItem(name: "appid", value: apiKey),
            URLQueryItem(name: "q", value: name),
        ]
        
        URLSession.shared.dataTask(with: components.url!) { data, response, error in
            guard let data = data else {
                completionHandler(Result.error(WeatherError.invalidData))
                return
            }
            do {
                let decoder = JSONDecoder()
                let weather = try decoder.decode(WeatherModel.self, from: data)
                completionHandler(Result.success(weather))
            } catch let error {
                completionHandler(Result.error(error))
            }
        }.resume()
        
    }
}

