//
//  ViewController.swift
//  Tablas
//
//  Created by Rafael Asencio on 22/9/17.
//  Copyright © 2017 Rafael Asencio. All rights reserved.
//
import UIKit
import WebKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var contenidoCeldas = ["pdf1","pdf2","pdf3",]
    
    //Funciones del ciclo de VIDA del ViewController
    
    @IBOutlet var tabla: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabla.dataSource = self
        tabla.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contenidoCeldas.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print (indexPath.row)
        
        let celda = UITableViewCell (style: UITableViewCellStyle.default,reuseIdentifier:"Cell")
        
        celda.textLabel?.text = contenidoCeldas [indexPath.row]
        
        celda.imageView!.image = UIImage(named:"Libro.jpg")
        return celda
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let idPdfSeleccionado = indexPath.row
        
        self.performSegue(withIdentifier: "pantallaDosSegue", sender: idPdfSeleccionado)
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete
        {
            contenidoCeldas.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    /*
     func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
     {
     }
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    if segue.identifier == "pantallaDosSegue" {
            
            let idPdfSeleccionadoRecibido = sender as! Int
            
            let objPantallaDos:ViewController2 = segue.destination as! ViewController2
            
            objPantallaDos.nombrePdfRecibido = contenidoCeldas [idPdfSeleccionadoRecibido]
}
}





    //Recuerda dejar la de viewDidLoad y didReceiveMemoryWarning



}
