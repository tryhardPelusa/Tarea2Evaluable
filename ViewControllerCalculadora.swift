//
//  ViewControllerCalculadora.swift
//  Tarea2Evaluable
//
//  Created by Daniel Monedero Cabrera on 26/10/23.
//

import UIKit

class ViewControllerCalculadora: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let operadores = ["+", "-", "*", "/"]
    var seleccionada = "+"
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        operadores.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        operadores[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            seleccionada = operadores[row]
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}
