//
//  ViewControllerCalculadoraNumeros.swift
//  Tarea2Evaluable
//
//  Created by Daniel Monedero Cabrera on 27/10/23.
//

import UIKit

var historialOperaciones: [[String: String]] = []

class ViewControllerCalculadoraNumeros: UIViewController {

    @IBOutlet weak var inputNum1: UITextField!
    @IBOutlet weak var inputNum2: UITextField!
    @IBOutlet weak var labelResultado: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickCalcular(_ sender: Any) {
        
        if let texto = inputNum1.text, let texto2 = inputNum2.text, contieneSoloNumeros(texto) && contieneSoloNumeros(texto2){
            let vistaAnterior = self.navigationController?.viewControllers[ (self.navigationController?.viewControllers.count)!-2] as? ViewControllerCalculadora
            
            let operador = vistaAnterior?.seleccionada
            let expresion = inputNum1.text! + operador! + inputNum2.text!
            if let resultado = NSExpression(format: expresion).expressionValue(with: nil, context: nil) as? NSNumber {
                labelResultado.text = "Resultado: \(resultado.doubleValue)"
                let diccionario: [String:String] = ["valor1":inputNum1.text!, "operador":operador!, "valor2":inputNum2.text!, "resultado":String(resultado.doubleValue)]
                historialOperaciones.append(diccionario)
            }
        } else {
            labelResultado.text = "Introduce solo valores numéricos."
        }

        
    }
    
    func contieneSoloNumeros(_ cadena: String) -> Bool {
        let conjuntoNumerico = CharacterSet.decimalDigits
        return cadena.rangeOfCharacter(from: conjuntoNumerico.inverted) == nil
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
