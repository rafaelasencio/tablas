//
//  ViewController2.swift
//  Tablas
//

//

import UIKit

class ViewController2: UIViewController {

    
    @IBOutlet var vistaWeb: UIWebView!
    
   
    var nombrePdfRecibido:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
     habilitarZoom()
     mostrarPdf()
     
    }
    
    func habilitarZoom(){
    
    vistaWeb.scalesPageToFit = true
        
    }
    
    func mostrarPdf(){
    
  //1: Direccion del archivo pdf
   
        let direccionPdf = URL(fileURLWithPath: Bundle.main.path(forResource: nombrePdfRecibido!, ofType: "pdf", inDirectory: "PDF")!)
        
  //2:Transformar archivo pdf a Data
    
        let datosPdf = try? Data(contentsOf: direccionPdf )
        
  //3:Mostrar Datos en el Vista Web
    
    vistaWeb.load(datosPdf!, mimeType: "application/pdf", textEncodingName: "utf-8", baseURL: direccionPdf)
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
