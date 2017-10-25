//
//  ViewController.swift
//  Tablas
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
  
    var contenidoCeldas = ["pdf1","pdf2","pdf3"]
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return contenidoCeldas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 
        
        let celda = UITableViewCell(style:UITableViewCellStyle.default,reuseIdentifier:"Cell")
        
        celda.textLabel?.text = contenidoCeldas[indexPath.row]
        
        return celda
    }
    
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        
       
       let idPdfSeleccionado = indexPath.row
        
        self.performSegue(withIdentifier: "pantallaDosSegue", sender: idPdfSeleccionado)
  
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "pantallaDosSegue" {
        
        let idPdfSeleccionadoRecibido = sender as! Int
        
        
    let objPantalla2:ViewController2 = segue.destination as! ViewController2
       
            
       objPantalla2.nombrePdfRecibido = contenidoCeldas[idPdfSeleccionadoRecibido]
            
        }
    
    
    }
    
   
   
}

