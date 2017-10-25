//
//  ViewController2.swift
//  Tablas
//
//  Created by Rafael Asencio on 25/9/17.
//  Copyright © 2017 Rafael Asencio. All rights reserved.
//

import UIKit
import WebKit

class ViewController2: UIViewController {
    
    
    
    @IBOutlet var vistaWeb: UIWebView!
    
    var nombrePdfRecibido: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        habilitarZoom ()
        mostrarPdf()
        
    }
    func habilitarZoom(){
        vistaWeb.scalesPageToFit = true
    }
    
    func mostrarPdf(){
        
        //1: Direccion del archivo pdf
        let direccionPdf = URL (fileURLWithPath:Bundle.main.path(forResource: nombrePdfRecibido, ofType: "pdf", inDirectory: "")!)
        //2: Transformar archivo pdf a data
        let datosPdf = try? Data(contentsOf: direccionPdf)
        //3: Mostrar datos en el Vista Web
        
        vistaWeb.load(datosPdf!, mimeType: "application/pdf", textEncodingName: "utf-8", baseURL: direccionPdf)
    }
    
}
