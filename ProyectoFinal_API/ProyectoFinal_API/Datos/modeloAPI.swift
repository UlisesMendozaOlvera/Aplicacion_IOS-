//
//  modeloAPI.swift
//  ProyectoFinal_API
//
//  Created by Bryan Ulises on 27/11/2023.
//

import Foundation
import UIKit


struct modeloAPI: Decodable
{
    
    var id_pelicula: Int
    var titulo: String
    var fecha_estreno: String
    var categoria: String
    var puntuacion: String
    var vista_general: String
    var reparto: String
    var duracion: String
    var imagen: String
    
   
}

    var modelo = [modeloAPI]()
