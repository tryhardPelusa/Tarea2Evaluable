//
//  ViewControllerCalculadoraNumeros.swift
//  Tarea2Evaluable
//
//  Created by Daniel Monedero Cabrera on 27/10/23.
//

import UIKit

class ViewControllerCalculadoraNumeros: UIViewController {

    @IBOutlet weak var inputNum1: UITextField!
    @IBOutlet weak var inputNum2: UITextField!
    @IBOutlet weak var labelResultado: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickCalcular(_ sender: Any) {
        let vistaAnterior = self.navigationController?.viewControllers[ (self.navigationController?.viewControllers.count)!-2] as? ViewControllerCalculadora
        
        let operador = vistaAnterior?.seleccionada
        let expresion = inputNum1.text! + operador! + inputNum2.text!
        if let resultado = NSExpression(format: expresion).expressionValue(with: nil, context: nil) as? NSNumber {
            labelResultado.text = "Resultado: \(resultado.doubleValue)"
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

}
