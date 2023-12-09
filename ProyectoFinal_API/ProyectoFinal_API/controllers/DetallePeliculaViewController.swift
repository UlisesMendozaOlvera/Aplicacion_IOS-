//
//  DetallePeliculaViewController.swift
//  ProyectoFinal_API
//
//  Created by Bryan Ulises on 01/12/2023.
//

import Foundation
import UIKit

class DetallePeliculaViewController: UIViewController {
    
    var titulo: String?
    var fecha_estreno: String?
    var puntuacion: String?
    var categoria: String?
    var vista_general: String?
    var reparto: String?
    var duracion: String?
    var imagen: String?
    
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var fecha_estrenoLabel: UILabel!
    @IBOutlet weak var puntuacionLabel: UILabel!
    @IBOutlet weak var categoriaLabel: UILabel!
    @IBOutlet weak var vista_generalLabel: UILabel!
    @IBOutlet weak var repartoLabel: UILabel!
    @IBOutlet weak var duracionLabel: UILabel!
    @IBOutlet weak var imagenView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tituloLabel.text = titulo
        fecha_estrenoLabel.text = fecha_estreno
        puntuacionLabel.text = puntuacion
        categoriaLabel.text = categoria
        vista_generalLabel.text = vista_general
        repartoLabel.text = reparto
        duracionLabel.text = duracion
        if imagen == "imagen" {
            imagenView.image = UIImage(named: "palomitas")
        } else {
            imagenView.image = imagen?.crearImagen()
        }
    }
}
