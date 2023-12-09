//
//  ExtensionesPeliculas.swift
//  ProyectoFinal_API
//
//  Created by Bryan Ulises on 29/11/2023.
//

import Foundation
import UIKit

extension UIImage
{
    func crearCadena() -> String
    {
        let imagenData = self.jpegData(compressionQuality: CGFloat(0.1))
        let imagenCadena = imagenData?.base64EncodedString()
        
        return imagenCadena!
    }
}

extension String
{
    func crearImagen() -> UIImage {
        let imagenData = Data(base64Encoded: self, options: .ignoreUnknownCharacters)
        
        if(imagenData == nil) || (self == "")
        {
            return UIImage()
        }
        else
        {
            guard let img = UIImage(data:imagenData!) else {return UIImage() }
            return img;
        }
    }
}
