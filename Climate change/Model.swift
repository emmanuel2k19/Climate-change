//
//  Untitled.swift
//  Climate change
//
//  Created by Kevin Flores on 2/19/25.
//

struct WeatherData: Codable {
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let description: String
}
