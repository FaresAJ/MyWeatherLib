//
//  WeatherDetailsModel.swift
//  MyWeatherLib
//
//  Created by Ajimi Fares on 26/6/2023.
//

import Foundation

public struct WeatherDetailsModel: Codable {
    public let id: Int?
    public let main: String?
    public let description: String?
    public let icon: String?
}
