//
//  AvisoPrivacidadController.swift
//  mexar
//
//  Created by Enrique Madrigal Gutierrez on 30/03/18.
//  Copyright © 2018 datalabor.com.mx. All rights reserved.
//

import UIKit

class AvisoPrivacidadController: UIViewController {

    @IBOutlet weak var texView1: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        self.navigationController!.navigationBar.topItem!.title = "Regresar"
        
        let label1 = """
  Industrias Mexar, S.A. de C.V. con nombre comercial Industrias Mexar, cuenta con los diversos domicilios ubicados el primero de ellos en la calle Boulevard Bosques de San Isidro #2300, colonia Bosques de San Isidro, C.P. 45133, Zapopan, Jalisco; calle Once de Enero de 1861, #2129, colonia Leyes de Reforma, C.P. 09310 dentro de la delegación de Iztapalapa, México DF y por último el ubicado en la calle Sebastián Lerdo de Tejada, #1222, colonia Niño Artillero, C.P. 64280, Nuevo León Monterrey. Razón por la cual declara ser responsable del tratamiento de los datos personales recabados a todos sus clientes, proveedores, etc, motivo por la cual emite el presente aviso de privacidad en cumplimiento a la Ley Federal de Protección de Datos Personales en Posesión de los Particulares.
  Los datos personales que usted nos ha proporcionado directamente o a través de medios electrónicos han sido recabados y serán tratados por la empresa bajo los principios de licitud, consentimiento, información, calidad, finalidad, lealtad, proporcionalidad y responsabilidad de conformidad a lo establecido dentro de la ley en comento; misma que previene el uso o divulgación indebida de los mismos.
  La información que es recabada por la empresa se obtiene a través de las solicitudes de crédito o al dar de alta a algún proveedor, misma información que invariablemente es obtenida de manera directa, sin la intervención de terceras personas.
  Así mismo señalamos que sus datos personales pueden ser utilizados para las siguientes finalidades:
  Dar seguimiento a solicitudes de información sobre servicios y/o productos que nuestra empresa oferta por medio de sitios web y otros medios.
  Dar avisos urgentes o importantes sobre algún tema relacionado con nuestro sitio web, servicios y/o productos.
  Proveer información sobre el estado actual de la empresa.
  Realizar los servicios y/o entregar los productos que usted contrato con nuestra empresa.
  Dar cumplimiento a las obligaciones contraídas por los clientes.
  Evaluar la calidad del servicio y realizar estudios internos sobre hábito de consumo.
  De igual manera, los datos personales podrán ser empleados para realizar cotizaciones, facturación u  órdenes de compra por mencionar de manera enunciativa más no limitativa algunos fines comerciales usados.
  Nos comprometemos a que la información recabada por la empresa será tratada conforme a las más estrictas medidas de seguridad que garanticen su confidencialidad.
  En lo que respecta al consentimiento, se estará  lo dispuesto por el artículo 22 fracción III de la ley en cita, mismo que será tácito.
  En base a los derechos ARCO con los que cuenta el usuario, éste podrá acceder a sus datos personales mismos con los cuáles cuenta la empresa, así como al tratamiento que reciban estos, rectificarlos en caso de ser inexactos o incompletos, cancelarlos por así convenir a sus intereses o porque haya finalizado la relación contractual con la empresa.
  Para poder llevar a cabo la operación descrita, es decir, limitar el uso o divulgación de sus datos personales, tendrá que realizar una petición por escrito a la dirección de correo electrónica que se proporciona posteriormente, en un plazo máximo de 30 días hábiles.
  Nos reservamos el derecho a efectuar en cualquier momento modificaciones o actualizaciones al presente aviso de privacidad, mismo que siempre estará disponible ya sea dentro de nuestras oficinas y/o correo electrónico y/o página web.
  Si usted considera que sus derechos de protección de datos personales han sido lesionados por alguna conducta de nuestros empleados o de nuestras actuaciones, podrá interponer una queja o denuncia ante el IFAI.
  Si tiene alguna duda, pregunta o queja, puede comunicarse con nuestro departamento de privacidad al número telefónico 3656-3637, contando con el horario de atención de 9:00 am a 6:00 pm de lunes a viernes. De igual manera ponemos a su disposición nuestra dirección electrónica ventas.mexar@conquestind.com.mx, medio por el cual serán resueltas todas sus preguntas, dudas o sugerencias.
"""
        
        
        let formatedString = NSMutableAttributedString()
        
        
        
        // let attrs1 = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 16), NSAttributedStringKey.foregroundColor : UIColor.gris1()]
        //let attrs2 = [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 14), NSAttributedStringKey.foregroundColor : UIColor.gris2()]
        
        let style1 = NSMutableParagraphStyle()
        style1.firstLineHeadIndent = 10.0
        style1.paragraphSpacingBefore = 10.0
        style1.alignment = NSTextAlignment.justified
        style1.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        
        let attrs1 = [NSFontAttributeName : UIFont.systemFont(ofSize: 14), NSForegroundColorAttributeName : UIColor.black, NSParagraphStyleAttributeName: style1]
        
        
        let Content1 = NSMutableAttributedString(string: label1, attributes: attrs1)
        
        
        formatedString.append(Content1)
        
        self.texView1.attributedText = formatedString
        // attibutes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 16), NSAttributedStringKey.foregroundColor : UIColor.gris1()]
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
