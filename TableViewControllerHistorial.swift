//
//  TableViewControllerHistorial.swift
//  Tarea2Evaluable
//
//  Created by Daniel Monedero on 6/11/23.
//

import UIKit

class TableViewControllerHistorial: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return historialOperaciones.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "miCelda", for: indexPath) as! miCeldaPersonalizada

        // Configure the cell...
        let diccionario = historialOperaciones[indexPath.row]
        
        cell.valor1.text = diccionario["valor1"]
        cell.operacion.text = diccionario["operador"]
        cell.valor2.text = diccionario["valor2"]
        cell.resultado.text = diccionario["resultado"]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        
        
        let opcionBorrar = UIContextualAction(style: .destructive, title: "Borrar") { (accion, view, completion)in
            
            print("Hemos pulsado borrar")
            completion(true)
            historialOperaciones.remove(at: indexPath.row)
            
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        let config = UISwipeActionsConfiguration(actions: [opcionBorrar])
        return config
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let opcionInvertir = UIContextualAction(style: .normal, title: "Invertir") { (accion, view, completion)in
            
            print("Hemos pulsado invertir")
            completion(true)
            
            var diccionario = historialOperaciones[indexPath.row]

            if let valor1 = diccionario["valor1"], let valor2 = diccionario["valor2"] {
                if var operador = diccionario["operador"]{
                    var resultado: Double = 0.0

                    if operador == "+" {
                        resultado = Double(valor1)! - Double(valor2)!
                        operador = "-"
                    } else if operador == "-" {
                        resultado = Double(valor1)! + Double(valor2)!
                        operador = "+"
                    } else if operador == "*" {
                        resultado = Double(valor1)! / Double(valor2)!
                        operador = "/"
                    } else if operador == "/" {
                        resultado = Double(valor1)! * Double(valor2)!
                        operador = "*"
                    }

                    diccionario["resultado"] = String(resultado)
                    diccionario["operador"] = operador
                }
            }
            historialOperaciones[indexPath.row] = diccionario
            tableView.reloadRows(at: [indexPath], with: .left)
        }
        let config = UISwipeActionsConfiguration(actions: [opcionInvertir])
        return config
    }

    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

class miCeldaPersonalizada: UITableViewCell {
    @IBOutlet weak var operacion: UILabel!
    @IBOutlet weak var valor1: UILabel!
    @IBOutlet weak var valor2: UILabel!
    @IBOutlet weak var resultado: UILabel!
}
