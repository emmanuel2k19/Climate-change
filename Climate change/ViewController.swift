//
//  ViewController.swift
//  Climate change
//
//  Created by Emmanuel Pena on 2/14/25.
//

import UIKit
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



class ViewController: UIViewController {
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var conditionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("✅ ViewController loaded!")
        view.backgroundColor = .white
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func fetchWeatherTapped(_ sender: UIButton) {
        if let city = cityTextField.text, !city.isEmpty {
                fetchWeather(for: city)
            }
        }
    
    func fetchWeather(for city: String) {
        let apiKey = "746f6ff1abc3fcbbdf967c1e37a58e44"
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric"
        
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let weather = try JSONDecoder().decode(WeatherData.self, from: data)
                        DispatchQueue.main.async {
                            self.temperatureLabel.text = "\(weather.main.temp)°C"
                            self.conditionLabel.text = weather.weather.first?.description.capitalized
                        }
                    } catch {
                        print("Error decoding: \(error)")
                    }
                }
                } .resume()
            }
        }
    }
    
    


