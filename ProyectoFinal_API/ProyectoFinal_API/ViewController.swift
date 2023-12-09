//
//  ViewController.swift
//  ProyectoFinal_API
//
//  Created by Bryan Ulises on 27/11/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultadoLabel: UILabel!
    @IBOutlet weak var Imagen: UIImageView!
    // Array para almacenar los resultados de la API
       var posts: [modeloAPI] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      //realizarSolicitud()
   
        
    }
//    func realizarSolicitud() {
//         guard let url = URL(string: "https://api-v2-production-6ff2.up.railway.app/pelicula/todas") else { return }
//        var peticion = URLRequest(url: url)
//        peticion.httpMethod = "GET"
//
//            let tarea = URLSession.shared.dataTask(with: peticion) { (datos, respuesta, error) in
//                if let error = error {
//                    print("Error en la solicitud: \(error.localizedDescription)")
//                    return
//                }
//
//                if let datos = datos {
//                    do {
//                        // Utilizar el modelo de datos para decodificar la respuesta
//                        self.posts = try JSONDecoder().decode([modeloAPI].self, from: datos)
//
//                        // Puedes realizar acciones adicionales con los datos, como actualizar la interfaz gráfica
//                        DispatchQueue.main.async {
//                            // Asegúrate de que la imagen tenga datos
////                            let imageData = Data(self.posts[12].imagen.data)
////                                        // Crea una imagen desde los datos
////                                        if let image = UIImage(data: imageData) {
////                                            // Asigna la imagen al UIImageView
////                                            self.Imagen.image = image
////                                        } else {
////                                            print("No se pudo crear la imagen desde los datos.")
////                                        }
//                            self.Imagen.image = self.posts[14].imagen.crearImagen()
//                                    
//                            
//                            for post in self.posts {
//                                self.resultadoLabel.text = "Número de publicaciones: \(post.titulo)"
//                                print("\(post.titulo)")
//                             
//                            }
//                        }
//                    } catch {
//                        print("Error al decodificar los datos: \(error.localizedDescription)")
//                    }
//                }
//            }
//
//            tarea.resume()
//        }
    
    
    
//    func realizarSolicitud() {
//         // La URL a la que deseas hacer la solicitud
//         let url = URL(string: "https://api-v2-production-6ff2.up.railway.app/pelicula/todas")!
//
//         // Crear una tarea de URLSession
//         let tarea = URLSession.shared.dataTask(with: url) { (datos, respuesta, error) in
//             // Manejar la respuesta de la solicitud aquí
//             if let error = error {
//                 print("Error en la solicitud: \(error.localizedDescription)")
//                 return
//             }
//
//             // Procesar los datos de la respuesta
//             if let datos = datos {
//                 do {
//                     // Analizar los datos (esto puede variar según el formato de datos)
//                     let resultado = try JSONSerialization.jsonObject(with: datos, options: []) as? [String: Any]
//                     DispatchQueue.main.async {
//                         // Actualizar la interfaz gráfica con el resultado
//                         self.resultadoLabel.text = "Resultado: \(resultado)"
//                     }
//                 } catch {
//                     print("Error al analizar los datos: \(error.localizedDescription)")
//                 }
//             }
//         }
//
//         // Iniciar la tarea
//         tarea.resume()
//     }
  
}

