//
//  ViewControllerBaja.swift
//  Tarea2Evaluable
//
//  Created by Daniel Monedero Cabrera on 25/10/23.
//

import UIKit

var diccionarioUsuarios: [String: [String]] = [:]
var keys: [String] {
    return Array(diccionarioUsuarios.keys)
}

class ViewControllerBaja: UIViewController {
    @IBOutlet weak var miPickerView: UIPickerView!
    
    var seleccionada: String = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        miPickerView.reloadAllComponents()
        // Do any additional setup after loading the view.
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return diccionarioUsuarios.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return keys[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        seleccionada = keys[row]
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
        diccionarioUsuarios.removeValue(forKey: seleccionada)
    }
}
