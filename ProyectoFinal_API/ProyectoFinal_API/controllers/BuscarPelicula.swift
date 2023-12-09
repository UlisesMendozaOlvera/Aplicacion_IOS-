//
//  BuscarPelicula.swift
//  ProyectoFinal_API
//
//  Created by Bryan Ulises on 01/12/2023.
//

import Foundation
import UIKit

class BuscarPelicula: UIViewController ,UITableViewDelegate, UITableViewDataSource ,UISearchBarDelegate {
    
    
   
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var TableViewPeliclas: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Peliculas_GET_ALL()
        TableViewPeliclas.delegate = self
        TableViewPeliclas.dataSource = self
        searchBar.delegate = self
        
        peliculasFiltradas = modelo
        print(modelo.count)
        print(peliculasFiltradas.count)
    }
  
    var peliculasFiltradas : [modeloAPI] = []
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        peliculasFiltradas = []
        if searchText == "" {
            peliculasFiltradas = modelo
            print(peliculasFiltradas)
        }else
        {
            for peli in modelo {
                if peli.titulo.lowercased().contains(searchText.lowercased()){
                    peliculasFiltradas.append(peli)
                }
            }
        }
        self.TableViewPeliclas.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peliculasFiltradas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = TableViewPeliclas.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        if peliculasFiltradas[indexPath.row].imagen == "imagen"{
            celda.imageView?.image = UIImage(named: "palomitas")
        } else {
            celda.imageView?.image = peliculasFiltradas[indexPath.row].imagen.crearImagen()
        }
        celda.textLabel?.text = peliculasFiltradas[indexPath.row].titulo
        return celda
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let modelo = peliculasFiltradas[indexPath.row]
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
}


