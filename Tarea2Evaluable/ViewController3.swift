//
//  ViewController3.swift
//  Tarea2Evaluable
//
//  Created by Daniel Monedero Cabrera on 24/10/23.
//

import UIKit

class ViewController3: UIViewController {
    @IBOutlet weak var miEtiquetaNombre: UILabel!
    
    @IBOutlet weak var miEtiquetaApellido: UILabel!
    
    @IBOutlet weak var miEtiquetaCorreo: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let vistaAnterior = self.navigationController?.viewControllers[ (self.navigationController?.viewControllers.count)!-2] as? ViewController2
        
        miEtiquetaNombre.text = "Nombre: " + vistaAnterior!.miInputNombre.text!
        miEtiquetaApellido.text = "Apellidos: " + vistaAnterior!.miInputApellido.text!
        miEtiquetaCorreo.text = "Correo: " + vistaAnterior!.miInputCorreo.text!
        
        arrayDeDiccionarios.append(["nombre": vistaAnterior!.miInputNombre.text!, "apellido": vistaAnterior!.miInputApellido.text!, "correo": vistaAnterior!.miInputCorreo.text!])
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
