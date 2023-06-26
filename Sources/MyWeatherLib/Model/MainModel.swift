//
//  MainModel.swift
//  MyWeatherLib
//
//  Created by Ajimi Fares on 26/6/2023.
//

import Foundation

public struct MainModel: Codable {
    public let temp: Double?
    public let pressure: Double?
    public let humidity: Int?
    public let tempMin: Double?
    public let tempMax: Double?

    enum CodingKeys: String, CodingKey {
        case temp
        case pressure
        case humidity
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
    
}
