//
//  WeatherModel.swift
//  MyWeatherLib
//
//  Created by Ajimi Fares on 26/6/2023.
//

import Foundation

public struct WeatherModel: Codable {
    public let id: Int
    public let visibility: Int?
    public let name: String?
    public let coord: LocationModel?
    public let wind: WindModel?
    public let base: String?
    public let dt: Int?
    public let weather: [WeatherDetailsModel]?
    public let sys: SysModel?
    public let clouds: CloudsModel?
    public let main: MainModel?
}
