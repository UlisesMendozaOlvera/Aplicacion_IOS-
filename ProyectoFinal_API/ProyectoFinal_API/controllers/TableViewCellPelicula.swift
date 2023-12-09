//
//  TableViewCellPelicula.swift
//  ProyectoFinal_API
//
//  Created by Bryan Ulises on 30/11/2023.
//

import UIKit

class TableViewCellPelicula: UITableViewCell {

    @IBOutlet weak var ViewP: UIView!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var imagenP: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Redondear las esquinas
        ViewP.layer.cornerRadius = 15.0
        imagenP.layer.cornerRadius = 15.0
        imagenP.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
