//
//  EditarPeliculaViewController.swift
//  ProyectoFinal_API
//
//  Created by Bryan Ulises on 05/12/2023.
//

import UIKit

class EditarPeliculaViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var titulo: String?
    var fecha_estreno: String?
    var puntuacion: String?
    var categoria: String?
    var vista_general: String?
    var reparto: String?
    var duracion: String?
    var imagen: String?
    
    @IBOutlet weak var imgPelicula: UIImageView!
    
    @IBOutlet weak var txtTitulo: UITextField!
    
    @IBOutlet weak var txtFechaEstreno: UITextField!
    @IBOutlet weak var txtPuntuacion: UITextField!
    @IBOutlet weak var txtCategoria: UITextField!
    @IBOutlet weak var txtVistaGeneral: UITextField!
    @IBOutlet weak var txtReparto: UITextField!
    @IBOutlet weak var txtDuracion: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        txtTitulo.text = titulo
        txtFechaEstreno.text = fecha_estreno
        txtPuntuacion.text = puntuacion
        txtCategoria.text = categoria
        txtVistaGeneral.text = vista_general
        txtReparto.text = reparto
        txtDuracion.text = duracion
        if imagen == "imagen" {
            imgPelicula.image = UIImage(named: "palomitas")
        } else {
            imgPelicula.image = imagen?.crearImagen()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
    
    @IBAction func SeleccionarImagen(_ sender: UIButton) {
        let galeria = UIImagePickerController()
                galeria.delegate = self
                galeria.sourceType = UIImagePickerController.SourceType.photoLibrary
                galeria.allowsEditing = false
                self.present(galeria, animated:true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                imgPelicula.image = pickedImage
            }
            dismiss(animated:true, completion:nil)
        }
    @IBAction func GuardarPelicula(_ sender: UIButton) {
        let titulo2:String = txtTitulo.text!
        let fecha_estreno:String = txtFechaEstreno.text!
        let puntuacion:String = txtPuntuacion.text!
        let categoria:String = txtCategoria.text!
        let vista_general:String = txtVistaGeneral.text!
        let reparto:String = txtReparto.text!
        let duracion:String = txtDuracion.text!
        let nuevaPelicula: [String: Any] = [
            "titulo": titulo2,
            "fecha_estreno": fecha_estreno,
            "categoria": categoria,
            "puntuacion": puntuacion,
            "vista_general": vista_general,
            "reparto": reparto,
            "duracion": duracion
        ]

        var estadoVacio: Bool = true
        var estadoExiste: Bool = true
        print(titulo!,titulo2,fecha_estreno,puntuacion)
        //Validar campos vacios
        if (titulo2.isEmpty && fecha_estreno.isEmpty && puntuacion.isEmpty && categoria.isEmpty && vista_general.isEmpty && reparto.isEmpty && duracion.isEmpty ){
            
            estadoVacio = false
        }
//        //valida que no existe la pelicula
//        for peli in modelo {
//            if (peli.titulo == titulo && peli.fecha_estreno == fecha_estreno){
//                estadoExiste = false
//            }
//        }
       
            if (estadoVacio == true) {
                let alert = UIAlertController(title:"Actualizacion Exitosa 👍", message: "Se ha actualizado una Pelicula!", preferredStyle: .alert)
                let accion = UIAlertAction(title:"Aceptar",style: .default){
                    UIAlertAction in
                   
                    
                    actualizarPelicula(titulo: self.titulo!, nuevaPelicula: nuevaPelicula) 
                    { error in
                        if let error = error {
                            print("Error al actualizar la película: \(error.localizedDescription)")
                        } else {
                            print("Película actualizada con éxito")
                        }
                    }
//                let vista = self.storyboard?.instantiateViewController(withIdentifier: "InicioPeliculas")
//                self.navigationController?.pushViewController(vista!, animated: true)
                    }
                alert.addAction(accion)
                self.present(alert,animated:true,completion: nil)
            
        }
    }
    

}
