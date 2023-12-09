//
//  ListaPeliculasTableView.swift
//  ProyectoFinal_API
//
//  Created by Bryan Ulises on 30/11/2023.
//

import Foundation
import UIKit

class ListaPeliculasTableView: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: ACTUALIZAR CONTENIDO
       
        Pelicula_GET_ALL()
        refreshControl?.attributedTitle = NSAttributedString(string:"Actualizando...🎬")
        refreshControl?.addTarget(self, action: #selector(ListaPeliculasTableView.Pelicula_GET_ALL),for: UIControl.Event.valueChanged)
        tableView.addSubview(refreshControl!)
        
       
        
    }
    
    //Secciones del table view
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //numero de renglones de table view
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelo.count
    }
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle
    {
        return .none
    }
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
       return false
    }
    //Swipe a la derecha
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let agregar = UIContextualAction(style:.normal, title:"Agregar") { (action,sourceView, completionHandler) in self.AgregarPelicula()
        }
        let acciones = UISwipeActionsConfiguration(actions: [agregar])
        acciones.performsFirstActionWithFullSwipe = false
        return acciones
    }
    //Swipe a la izquierda
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let accion1 = UIContextualAction(style: .destructive, title: "Borrar"){
            (action,sourceView,completitionHandler) in
            
            let alert = UIAlertController(title:"Borrar", message: "Esta seguro de borrar el registro", preferredStyle: .alert)
            let accion = UIAlertAction(title:"Aceptar",style: .default){
                UIAlertAction in
                Pelicula_DELETE(modelo[indexPath.row].titulo)
                modelo.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
               
                tableView.reloadData()
                
                }
            alert.addAction(accion)
            self.present(alert,animated:true,completion: nil)
            
            
        }
        let accion2 = UIContextualAction(style: .normal, title: "Modificar"){
            (action,sourceView,completitionHandler) in
            let modelo = modelo[indexPath.row]
            let vista = self.storyboard?.instantiateViewController(withIdentifier: "ModificarPelicula") as! EditarPeliculaViewController
            vista.titulo = modelo.titulo
            vista.fecha_estreno = modelo.fecha_estreno
            vista.puntuacion = modelo.puntuacion
            vista.categoria = modelo.categoria
            vista.vista_general = modelo.vista_general
            vista.reparto = modelo.reparto
            vista.duracion = modelo.duracion
            vista.imagen = modelo.imagen
            self.navigationController?.pushViewController(vista, animated: true)
           
           
            tableView.reloadData()
        }
        let acciones = UISwipeActionsConfiguration(actions:[accion1,accion2])
        acciones.performsFirstActionWithFullSwipe = false
        
       
        return acciones
    }
    //MARK: LLENADO DE LA TABLE VIEW
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = Bundle.main.loadNibNamed("TableViewCellPelicula", owner: self, options: nil)?.first as! TableViewCellPelicula
        celda.tituloLabel.text = modelo[indexPath.row].titulo
        
        if modelo[indexPath.row].imagen == "imagen"{
            celda.imagenP.image = UIImage(named: "palomitas")
        } else {
            celda.imagenP.image = modelo[indexPath.row].imagen.crearImagen()
        }
        
        return celda
    }
    //MARK: VER DETALLES DE LA PELICULA
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let modelo = modelo[indexPath.row]
        let vista = storyboard?.instantiateViewController(withIdentifier: "PeliculaView") as! DetallePeliculaViewController
        vista.titulo = modelo.titulo
        vista.fecha_estreno = modelo.fecha_estreno
        vista.puntuacion = modelo.puntuacion
        vista.categoria = modelo.categoria
        vista.vista_general = modelo.vista_general
        vista.reparto = modelo.reparto
        vista.duracion = modelo.duracion
        vista.imagen = modelo.imagen
        
        present(vista, animated: true)
    }
    
    func AgregarPelicula(){
        let vista = storyboard?.instantiateViewController(withIdentifier: "AgregarPelicula") as! AgregarPeliculaViewController
        self.navigationController?.pushViewController(vista, animated: true)
    
        
    }
    func ModificarPelicula(){
        
    }
    
    @objc func Pelicula_GET_ALL()
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
                    self.tableView.reloadData()
                    self.refreshControl?.endRefreshing()
            }
            
        }.resume()
    }
}
