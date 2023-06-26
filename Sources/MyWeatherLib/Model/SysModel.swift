//
//  SysModel.swift
//  MyWeatherLib
//
//  Created by Ajimi Fares on 26/6/2023.
//

import Foundation

public struct SysModel: Codable {
    public let id: Int?
    public let type: Int?
    public let message: Double?
    public let country: String?
    public let sunrise: Int?
    public let sunset: Int?
}
