//
//  AgregarPeliculaViewController.swift
//  ProyectoFinal_API
//
//  Created by Bryan Ulises on 02/12/2023.
//

import UIKit

class AgregarPeliculaViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imgPelicula: UIImageView!
    @IBOutlet weak var txtTitulo: UITextField!
    @IBOutlet weak var txtFecha_estreno: UITextField!
    @IBOutlet weak var txtPuntuacion: UITextField!
    @IBOutlet weak var txtCategoria: UITextField!
    @IBOutlet weak var txtVista_general: UITextField!
    @IBOutlet weak var txtReparto: UITextField!
    @IBOutlet weak var txtDuracion: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgPelicula.image=UIImage(named: "palomitas")
      
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
    
    @IBAction func GuardarPelicula(_ sender: Any) {
        let titulo:String = txtTitulo.text!
        let fecha_estreno:String = txtFecha_estreno.text!
        let puntuacion:String = txtPuntuacion.text!
        let categoria:String = txtCategoria.text!
        let vista_general:String = txtVista_general.text!
        let reparto:String = txtReparto.text!
        let duracion:String = txtDuracion.text!
        let imagenBase64:String = imgPelicula.image!.crearCadena()
        var estadoVacio: Bool = true
        var estadoExiste: Bool = true
        
        //Validar campos vacios
        if (titulo.isEmpty && fecha_estreno.isEmpty && puntuacion.isEmpty && categoria.isEmpty && vista_general.isEmpty && reparto.isEmpty && duracion.isEmpty ){
            
            estadoVacio = false
        }
        //valida que no existe la pelicula
        for peli in modelo {
            if (peli.titulo == titulo && peli.fecha_estreno == fecha_estreno){
                estadoExiste = false
            }
        }
        if (estadoExiste == true){
            if (estadoVacio == true && estadoExiste == true) {
                let alert = UIAlertController(title:"Registro Exitoso 👍", message: "Se ha registrado una Pelicula!", preferredStyle: .alert)
                let accion = UIAlertAction(title:"Aceptar",style: .default){
                    UIAlertAction in

                    guardarPelicula(titulo: titulo, fechaEstreno: fecha_estreno, categoria: categoria, puntuacion: puntuacion, vistaGeneral: vista_general, reparto: reparto, duracion: duracion, imagenBase64: imagenBase64) { error in
                        if let error = error {
                            print("Error al guardar la película: \(error.localizedDescription)")
                        } else {
                            print("Película guardada con éxito")
                        }
                    }
                
                    }
                alert.addAction(accion)
                self.present(alert,animated:true,completion: nil)
            } else {
                let alert = UIAlertController(title:"Error 🧐", message: "La Pelicula ya existe 🎬 ",preferredStyle: .alert)
                alert.addAction(UIAlertAction(title:"OK",style:.cancel,handler: nil))
                self.present(alert,animated: true)
            }
        }
    }
    
}
