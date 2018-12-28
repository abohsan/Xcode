//
//  ViewController.swift
//  WeatherApp
//
//  Created by Angela Yu on 23/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import CoreLocation // Step 1: adding this
import Alamofire
import SwiftyJSON      // End Step 1

// Step 2: adding CLLocationManagerDelegate
class WeatherViewController: UIViewController, CLLocationManagerDelegate {
    
    //Constants
    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather"
    //    let APP_ID = "e72ca729af228beabd5d20e3b7749713"
    let APP_ID = "3f35a2b9a13c0bf779e0c82db620c5f2"
   
    /***Get your own App ID at https://openweathermap.org/appid ****/
    

    //TODO: Declare instance variables here
    // Step 3:
    let locationManager = CLLocationManager()
    let weatherDataModel = WeatherDataModel()
    //End step 3.
    
    //Pre-linked IBOutlets
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //TODO:Set up the location manager here.
        // Step 4:
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        //End step 4.
        
        //        step 5:
        //        1. Go to Supporting Files. it is in Project Navigation on the left of the screen
        //        2. Open "Info.plist"
        //        3. Add "Privacy - Location Usage Description"
        //        4. Add Description to it
        //        5. Add "Privacy - Location When In Use Usage Description"
        //        6. Add Description to it
        //        End step 5.
        //
        
    }
    
    
    
    //MARK: - Networking
    /***************************************************************/
    
    //Write the getWeatherData method here:
    func getWeatherData(url : String, parameters: [String: String]){
        Alamofire.request(url, method: .get,parameters :parameters).responseJSON{
            response in
            if response.result.isSuccess{
                print("Success! Got the weather data")
                let weatherJSON : JSON = JSON(response.result.value!)
               self.updateWeatherData(json : weatherJSON)
                
            }else{
                print("Error \(response.result.error!)")
                self.cityLabel.text = "Connection Issues"
            }
        }
        
    }

    
    
    
    
    
    //MARK: - JSON Parsing
    /***************************************************************/
   
    
    //Write the updateWeatherData method here:
    
    func updateWeatherData(json : JSON){
        if let tempResult = json["main"]["temp"].double {
        weatherDataModel.temperature = Int(tempResult - 273.15)
        weatherDataModel.city = json["name"].stringValue
        weatherDataModel.condition = json["weather"][0]["id"].intValue
        weatherDataModel.weatherIconName = weatherDataModel.updateWeatherIcon(condition: weatherDataModel.condition)
        updateUIWithWeatherData()
        }else{
            cityLabel.text = "Weather Unavailable"
        }
    
    }

    
    
    
    //MARK: - UI Updates
    /***************************************************************/
    
    
    //Write the updateUIWithWeatherData method here:
    
    func updateUIWithWeatherData(){
        cityLabel.text = weatherDataModel.city
        temperatureLabel.text = "\(weatherDataModel.temperature)"
        weatherIcon.image = UIImage(named: weatherDataModel.weatherIconName)
    }
    
    
    
    
    //MARK: - Location Manager Delegate Methods
    /***************************************************************/
    
    
    //Write the didUpdateLocations method here:
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       let location = locations[locations.count - 1]
  
        if location.horizontalAccuracy > 0{
            locationManager.stopUpdatingLocation()
            locationManager.delegate = nil
            print("lonitude = \(location.coordinate.longitude), latitude = \(location.coordinate.latitude)")
            let latitude = String(location.coordinate.latitude)
            let lonitude = String(location.coordinate.longitude)
            let params : [String : String ] = ["lat" : latitude, "lon" : lonitude,"appid" : APP_ID]
        
            getWeatherData(url: WEATHER_URL, parameters: params)
        }
    }


    //Write the didFailWithError method here:

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        cityLabel.text = "location Unavailable "
    }
    

    
    //MARK: - Change City Delegate methods
    /***************************************************************/
    
    
    //Write the userEnteredANewCityName Delegate method here:
    

    
    //Write the PrepareForSegue Method here
    
    
    
}


