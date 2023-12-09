//
//  PreferenciasViewController.swift
//  ProyectoFinal_API
//
//  Created by Bryan Ulises on 02/12/2023.
//

import UIKit
import AVFoundation

class PreferenciasViewController: UIViewController {
    
    @IBOutlet weak var viewModoDark: UIView!
    @IBOutlet weak var textLabelD: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var viewModo: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tema = UserDefaults.standard.bool(forKey: "TemaModeEnable")
        

        if tema == true {
            viewModoDark.backgroundColor = UIColor.systemGreen
            viewModo.backgroundColor = UIColor.systemGray5
        } else {
            viewModo.backgroundColor = UIColor.systemGreen
            viewModoDark.backgroundColor = UIColor.systemGray5
        }
        
        let gesto = UILongPressGestureRecognizer()
        self.viewModo.addGestureRecognizer(gesto)
        gesto.addTarget(self, action: #selector(gestoAccion))
        
        let gestoD = UILongPressGestureRecognizer()
        self.viewModoDark.addGestureRecognizer(gestoD)
        gestoD.addTarget(self, action: #selector(gestoDarkAccion))
    }
    @objc func gestoAccion(){
        UserDefaults.standard.setValue(false, forKey: "TemaModeEnable")
        
            if let appDelegate = UIApplication.shared.windows.first {
            reproducir()
            appDelegate.overrideUserInterfaceStyle = .light
                viewModo.backgroundColor = UIColor.systemGreen
                viewModoDark.backgroundColor = UIColor.systemGray5
            }
        }
    
    @objc func gestoDarkAccion(){
       
       UserDefaults.standard.setValue(true, forKey: "TemaModeEnable")
          
        if let appDelegate = UIApplication.shared.windows.first {
            reproducir()
            appDelegate.overrideUserInterfaceStyle = .dark
            viewModoDark.backgroundColor = UIColor.systemGreen
            viewModo.backgroundColor = UIColor.systemGray5
            }
        }
    
    var audioplay: AVAudioPlayer?
    //reproductor de sonido
    func reproducir(){
        let pathtosound = Bundle.main.path(forResource: "hero", ofType: "wav")!
        let url = URL(fileURLWithPath: pathtosound)
        do{
            audioplay = try AVAudioPlayer(contentsOf: url)
            audioplay?.play()
        }
        catch{
            
        }
    }

}
