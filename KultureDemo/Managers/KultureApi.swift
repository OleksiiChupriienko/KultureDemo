//
//  KultureApi.swift
//  KultureDemo
//
//  Created by Aleksei Chupriienko on 24.03.2020.
//  Copyright © 2020 Aleksei Chupriienko. All rights reserved.
//

import Foundation



class KultureApi {
    
    func logIn(password: String, phoneNumber: String, completion: @escaping ((String) -> Void)) {
        let urlString = "http://kulture-heroku.herokuapp.com/authorization/login/"
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let parameters = ["password": password,
                          "phone_number": phoneNumber]
        
        do {
            request.httpBody = try JSONEncoder().encode(parameters)
        } catch let error {
            print(error.localizedDescription)
        }
        
        let task = URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                do {
                    let loginResponse = try LoginResponse.decode(fromData: data)
                    let token = loginResponse.key
                    completion(token)
                } catch let error {
                    print(error)
                    completion("err")
                }
            }
        }
        task.resume()
    }
    
    func fetchClasses(token: String, completion: @escaping ((AllDayClasses) -> Void)) {
        let urlString = "http://kulture-heroku.herokuapp.com/classes/all_day_classes"
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.setValue("Token \(token)", forHTTPHeaderField: "Authorization")
        let task = URLSession.shared.dataTask(with: request) { (data, urlResponse, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data, let response = urlResponse as? HTTPURLResponse, response.statusCode == 200 {
                do {
                    let allDayClasses = try AllDayClasses.decode(fromData: data)
                    completion(allDayClasses)
                } catch let error {
                    print(error)
                }
            }
        }
        task.resume()
    }

}
