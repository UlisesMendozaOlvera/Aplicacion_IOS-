//
//  webAPI.swift
//  ProyectoFinal_API
//
//  Created by Bryan Ulises on 28/11/2023.
//

import Foundation

class webAPI {
    
    private var dataTask: URLSessionDataTask?
    
    
    func getMoviesData()  {
        
        let MoviesURL = "https://api-v2-production-6ff2.up.railway.app/pelicula/todas"
        
        guard let url = URL(string: MoviesURL) else {return}
        
        // Create URL Session - work on the background
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            
            
            guard let response = response as? HTTPURLResponse else {
                // Handle Empty Response
                print("Empty Response")
                return
            }
            print("Response status code: \(response.statusCode)")
            
            guard let data = data else {
                // Handle Empty Data
                print("Empty Data")
                return
            }
            // Parse the data
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(modeloAPI.self, from: data)
            
            // Back to the main thread
            DispatchQueue.main.async {
                
            }
            
            
            
            dataTask?.resume()
        }
    }
}
