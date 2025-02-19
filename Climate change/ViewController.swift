//
//  ViewController.swift
//  Climate change
//
//  Created by Emmanuel Pena on 2/14/25.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    let temperatureLabel = UILabel()
    let conditionLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundImage(named: "background")
        
        temperatureLabel.text = "Temperature: 25°C"  // Set text
        temperatureLabel.textColor = .black  // Text color
        temperatureLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold) // Font size & weight
        temperatureLabel.textAlignment = .center  // Align text
        temperatureLabel.frame = CGRect(x: 50, y: 200, width: 300, height: 50) // Position & size
        
        conditionLabel.text = "Condition Label"  // Set text
        conditionLabel.textColor = UIColor.systemBackground.withAlphaComponent(0.9) // Dynamic Color Change
        conditionLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold) // Font size & weight
        conditionLabel.textAlignment = .center  // Align text
        conditionLabel.frame = CGRect(x: 50, y: 250, width: 300, height: 50) // Position & size
                
        view.addSubview(temperatureLabel)
        view.addSubview(conditionLabel)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setBackgroundImage(named: "backgroundImage")
    }

    //this sets the background based on the assets in the project
    func setBackgroundImage(named imageName: String) {
        let background = UIImageView(frame: view.bounds)
        background.image = UIImage(named: imageName)
        background.contentMode = .scaleAspectFill
        background.clipsToBounds = true
        view.addSubview(background)
        view.sendSubviewToBack(background)
    }
    
    func fetchWeather(for city: String) {
        let apiKey = "746f6ff1abc3fcbbdf967c1e37a58e44"
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric"
        guard let url = URL(string: urlString) else { return }
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


    
    


