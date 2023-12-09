//
//  webApp.swift
//  ProyectoFinal_API
//
//  Created by Bryan Ulises on 30/11/2023.
//

import Foundation
import UIKit
//MARK: TODAS LAS PELICULAS
func Peliculas_GET_ALL()
{
    
    let liga = "https://api-v2-production-6ff2.up.railway.app/pelicula/todas"
    
    guard let url = URL(string: liga) else {return}
    
    var peticion = URLRequest(url: url)
    
    peticion.httpMethod = "GET"
    
    URLSession.shared.dataTask(with: peticion)
    {(data, response, error) in
        DispatchQueue.main.async
            {
                guard let datos = data else {return}
                do
                {
                    modelo = try JSONDecoder().decode([modeloAPI].self, from: datos)
                    
                }
                catch let jsonError
                {
                    print(jsonError)
                }
        }
        
    }.resume()
}

//MARK: GUARDAR
func guardarPelicula(titulo: String, fechaEstreno: String, categoria: String, puntuacion: String, vistaGeneral: String, reparto: String, duracion: String, imagenBase64: String, completion: @escaping (Error?) -> Void) {
    // URL del endpoint
    let url = URL(string: "https://api-v2-production-6ff2.up.railway.app/pelicula/guardar")!

    // Crear la solicitud
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")

    // Crear el cuerpo de la solicitud
    let body: [String: Any] = [
        "titulo": titulo,
        "fecha_estreno": fechaEstreno,
        "categoria": categoria,
        "puntuacion": puntuacion,
        "vista_general": vistaGeneral,
        "reparto": reparto,
        "duracion": duracion,
        "imagen": "imagen"
    ]

    do {
        // Convertir el diccionario a datos JSON
        let jsonData = try JSONSerialization.data(withJSONObject: body)

        // Adjuntar los datos JSON a la solicitud
        request.httpBody = jsonData

        // Crear una sesión de URL
        let session = URLSession.shared

        // Realizar la solicitud
        let task = session.dataTask(with: request) { (data, response, error) in
            // Verificar si hay un error
            if let error = error {
                completion(error)
                return
            }

            // Verificar la respuesta del servidor
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 0
                let error = NSError(domain: "HTTPError", code: statusCode, userInfo: nil)
                completion(error)
                return
            }

            // La solicitud fue exitosa
            completion(nil)
        }

        // Iniciar la tarea
        task.resume()

    } catch {
        // Manejar errores de serialización JSON
        completion(error)
    }
}

//MARK: ACTUALIZAR

func actualizarPelicula(titulo: String, nuevaPelicula: [String: Any], completion: @escaping (Error?) -> Void) {
    // URL del endpoint
    let url = URL(string: "https://api-v2-production-6ff2.up.railway.app/pelicula/\(titulo)")!

    // Crear la solicitud
    var request = URLRequest(url: url)
    request.httpMethod = "PUT"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")

    do {
        // Convertir el diccionario a datos JSON
        let jsonData = try JSONSerialization.data(withJSONObject: nuevaPelicula)

        // Adjuntar los datos JSON a la solicitud
        request.httpBody = jsonData

        // Crear una sesión de URL
        let session = URLSession.shared

        // Realizar la solicitud
        let task = session.dataTask(with: request) { (data, response, error) in
            // Verificar si hay un error
            if let error = error {
                completion(error)
                return
            }

            // Verificar la respuesta del servidor
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 0
                let error = NSError(domain: "HTTPError", code: statusCode, userInfo: nil)
                completion(error)
                return
            }

            // La solicitud fue exitosa
            completion(nil)
        }

        // Iniciar la tarea
        task.resume()

    } catch {
        // Manejar errores de serialización JSON
        completion(error)
    }
}
//MARK: ELIMINACION
func Pelicula_DELETE(_ titulo_Original:String)
{
    let liga = "https://api-v2-production-6ff2.up.railway.app/pelicula/\(titulo_Original)"
    
    guard let url = URL(string: liga) else {return}
    
    var peticion = URLRequest(url: url)
    
    peticion.httpMethod = "DELETE"
   
    
    URLSession.shared.dataTask(with:peticion)
    {
        (data,response,error) in
        DispatchQueue.main.async {
            
            print("Eliminado exitosa")
            
        
        }
    }.resume()
}


