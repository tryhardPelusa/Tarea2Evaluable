//
//  ViewControllerBaja.swift
//  Tarea2Evaluable
//
//  Created by Daniel Monedero Cabrera on 25/10/23.
//

import UIKit

var arrayDeDiccionarios: [[String: String]] = []

class ViewControllerBaja: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    @IBOutlet weak var miPickerView: UIPickerView!
    
    var seleccionada: Int = 0
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let diccionario1: [String: String] = ["nombre": "Juan", "apellido": "Pérez", "correo": "juan@example.com"]
        arrayDeDiccionarios.append(diccionario1)

        let diccionario2: [String: String] = ["nombre": "María", "apellido": "González", "correo": "maria@example.com"]
        arrayDeDiccionarios.append(diccionario2)
        
        miPickerView.reloadAllComponents()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        miPickerView.reloadAllComponents()
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayDeDiccionarios.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if row < arrayDeDiccionarios.count {
            let diccionario = arrayDeDiccionarios[row]
            return diccionario["nombre"]
        }
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row < arrayDeDiccionarios.count {
            seleccionada = row
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func borrarUsuario(_ sender: Any) {
        arrayDeDiccionarios.remove(at: seleccionada)
        miPickerView.reloadAllComponents()
    }
}
