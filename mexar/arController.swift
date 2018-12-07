//
//  arController.swift
//  mexar
//
//  Created by Enrique Madrigal Gutierrez on 11/06/18.
//  Copyright © 2018 datalabor.com.mx. All rights reserved.
//

import UIKit
import SceneKit
import ARKit
import ObjectMapper


@available(iOS 11.3, *)



class arController: UIViewController, ARSCNViewDelegate {
    
    
    @IBOutlet var sceneView: ARSCNView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var info_button: UIButton!
    
    let fadeDuration: TimeInterval = 0.3
    let rotateDuration: TimeInterval = 3
    let waitDuration: TimeInterval = 0.5
    
    var curProdurId : Int = 0
    var isPlaying: Bool = false
    
    
    /*
    lazy var fadeAndSpinAction: SCNAction = {
        return .sequence([
            .fadeIn(duration: fadeDuration),
            .rotateBy(x: 0, y: 0, z: CGFloat.pi * 360 / 180, duration: rotateDuration),
            .wait(duration: waitDuration),
            .fadeOut(duration: fadeDuration)
            ])
    }()
    */
    
    
    lazy var contact202Node: SCNNode = {
        guard let scene = SCNScene(named: "art.scnassets/lata202/mexar.scn"),
            let node = scene.rootNode.childNode(withName: "lata", recursively: false) else { return SCNNode() }
        let scaleFactor = 0.05
        node.scale = SCNVector3(scaleFactor, scaleFactor, scaleFactor)
        node.eulerAngles.x = 2 * ( -.pi / 2)
        //node.eulerAngles.x += -.pi / 2
        node.opacity = 1
        let CylinderNode = scene.rootNode.childNode(withName: "Cylinder", recursively: true)
        CylinderNode?.runAction(SCNAction.repeat(SCNAction.rotateBy(x: 0, y: 0, z: 1, duration: 1), count: 60))
        
        return node
    }()
   
    
    lazy var contact204Node: SCNNode = {
        guard let scene = SCNScene(named: "art.scnassets/lata204/mexar204.scn"),
            let node = scene.rootNode.childNode(withName: "lata", recursively: false) else { return SCNNode() }
        let scaleFactor = 0.05
        node.scale = SCNVector3(scaleFactor, scaleFactor, scaleFactor)
        node.eulerAngles.x = 2 * ( -.pi / 2)
        let CylinderNode = scene.rootNode.childNode(withName: "Cylinder", recursively: true)
        CylinderNode?.runAction(SCNAction.repeat(SCNAction.rotateBy(x: 0, y: 0, z: 1, duration: 1), count: 60))
        
        return node
    }()
    
 
    lazy var contact205Node: SCNNode = {
        guard let scene = SCNScene(named: "art.scnassets/lata205/mexar5.scn"),
            let node = scene.rootNode.childNode(withName: "lata", recursively: false) else { return SCNNode() }
        let scaleFactor = 0.05
        node.scale = SCNVector3(scaleFactor, scaleFactor, scaleFactor)
        node.eulerAngles.x = 2 * ( -.pi / 2)
        let CylinderNode = scene.rootNode.childNode(withName: "Cylinder", recursively: true)
        CylinderNode?.runAction(SCNAction.repeat(SCNAction.rotateBy(x: 0, y: 0, z: 1, duration: 1), count: 60))
        
        return node
    }()
    
    lazy var contact206Node: SCNNode = {
        guard let scene = SCNScene(named: "art.scnassets/lata206/mexar206.scn"),
            let node = scene.rootNode.childNode(withName: "lata", recursively: false) else { return SCNNode() }
        let scaleFactor = 0.05
        node.scale = SCNVector3(scaleFactor, scaleFactor, scaleFactor)
        node.eulerAngles.x = 2 * ( -.pi / 2)
        let CylinderNode = scene.rootNode.childNode(withName: "Cylinder", recursively: true)
        CylinderNode?.runAction(SCNAction.repeat(SCNAction.rotateBy(x: 0, y: 0, z: 1, duration: 1), count: 60))
        
        return node
    }()
    
    
    lazy var contact212Node: SCNNode = {
        guard let scene = SCNScene(named: "art.scnassets/lata212/mexar3.scn"),
            let node = scene.rootNode.childNode(withName: "lata3", recursively: false) else { return SCNNode() }
        let scaleFactor = 0.05
        node.scale = SCNVector3(scaleFactor, scaleFactor, scaleFactor)
        node.eulerAngles.x = 2 * ( -.pi / 2)
        let CylinderNode = scene.rootNode.childNode(withName: "Cylinder", recursively: true)
        CylinderNode?.runAction(SCNAction.repeat(SCNAction.rotateBy(x: 0, y: 0, z: 1, duration: 1), count: 60))
        
        return node
    }()
    
    
    lazy var contact216Node: SCNNode = {
        guard let scene = SCNScene(named: "art.scnassets/lata216/mexar216.scn"),
            let node = scene.rootNode.childNode(withName: "lata", recursively: false) else { return SCNNode() }
        let scaleFactor = 0.05
        node.scale = SCNVector3(scaleFactor, scaleFactor, scaleFactor)
        node.eulerAngles.x = 2 * ( -.pi / 2)
        let CylinderNode = scene.rootNode.childNode(withName: "Cylinder", recursively: true)
        CylinderNode?.runAction(SCNAction.repeat(SCNAction.rotateBy(x: 0, y: 0, z: 1, duration: 1), count: 60))
        
        return node
    }()
    
    
    lazy var contact222Node: SCNNode = {
        guard let scene = SCNScene(named: "art.scnassets/lata222/mexar2.scn"),
            let node = scene.rootNode.childNode(withName: "lata2", recursively: false) else { return SCNNode() }
        let scaleFactor = 0.05
        node.scale = SCNVector3(scaleFactor, scaleFactor, scaleFactor)
        node.eulerAngles.x = 2 * ( -.pi / 2)
        let CylinderNode = scene.rootNode.childNode(withName: "Cylinder", recursively: true)
        CylinderNode?.runAction(SCNAction.repeat(SCNAction.rotateBy(x: 0, y: 0, z: 1, duration: 1), count: 60))
        
        return node
    }()
  
    
    lazy var contact227Node: SCNNode = {
        guard let scene = SCNScene(named: "art.scnassets/lata227/mexar227.scn"),
            let node = scene.rootNode.childNode(withName: "lata", recursively: false) else { return SCNNode() }
        let scaleFactor = 0.05
        node.scale = SCNVector3(scaleFactor, scaleFactor, scaleFactor)
        node.eulerAngles.x = 2 * ( -.pi / 2)
        let CylinderNode = scene.rootNode.childNode(withName: "Cylinder", recursively: true)
        CylinderNode?.runAction(SCNAction.repeat(SCNAction.rotateBy(x: 0, y: 0, z: 1, duration: 1), count: 60))
        
        return node
    }()
    
    
  
    lazy var contact244Node: SCNNode = {
        guard let scene = SCNScene(named: "art.scnassets/lata244/mexar4.scn"),
            let node = scene.rootNode.childNode(withName: "lata4", recursively: false) else { return SCNNode() }
        let scaleFactor = 0.05
        node.scale = SCNVector3(scaleFactor, scaleFactor, scaleFactor)
       node.eulerAngles.x = 2 * ( -.pi / 2)
        let CylinderNode = scene.rootNode.childNode(withName: "Cylinder", recursively: true)
        CylinderNode?.runAction(SCNAction.repeat(SCNAction.rotateBy(x: 0, y: 0, z: 1, duration: 1), count: 60))
        
        return node
    }()
    
    
 
    
    /*
    lazy var fadeAction: SCNAction = {
        return .sequence([
            .fadeOpacity(by: 0.8, duration: fadeDuration),
            .wait(duration: waitDuration),
            .fadeOut(duration: fadeDuration)
            ])
    }()
    */
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLighting()
        
        self.sceneView.antialiasingMode = .multisampling4X
        
        // Set the view's delegate
        self.sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        //self.sceneView.showsStatistics = true
        
        // Create a new scene
    //----    let scene1 = SCNScene(named: "art.scnassets/lata222/lata222.scn")!
        let scene :SCNScene = SCNScene()
        
      // ****  let node = scene1.rootNode.childNode(withName: "lata222", recursively: true)
      // ****  let CylinderNode = scene1.rootNode.childNode(withName: "Cylinder", recursively: true)
        
        /*
        //let material1: SCNMaterial = (CylinderNode?.geometry?.material(named: "Material_002"))!
        //let material: SCNMaterial = (CylinderNode?.geometry?.firstMaterial)!
        //material.diffuse.contents = UIImage(named: "lata222")
         
         */
        
        
        
        
        // **** let scaleFactor  = 0.05
        
        // ****node?.scale = SCNVector3(scaleFactor, scaleFactor, scaleFactor)
        
        // node?.eulerAngles.x += -.pi / 2
        
        
        /*  Pruebas Bueno
        let node = contact244Node
        node.position = SCNVector3Make(0, 0, -0.5)
          scene.rootNode.addChildNode(node)
        */
        //node?.runAction(fadeAndSpinAction)
        //node?.runAction(SCNAction.repeat(SCNAction.rotateBy(x: 0, y: 1, z: 0, duration: 1), count: 60))
        // ***** CylinderNode?.runAction(SCNAction.repeat(SCNAction.rotateBy(x: 0, y: 0, z: 1, duration: 1), count: 60))
       
        
        
        
        
        // Set the scene to the view
        
        
        
        
      
       
        
        //   sceneView.scene = cubeScene
        sceneView.scene = scene
        
        info_button.layer.cornerRadius = 32
        info_button.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        info_button.layer.shadowOpacity = 1.0
        info_button.layer.masksToBounds = false
        info_button.clipsToBounds = true
        info_button.isHidden = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
      //  let configuration = ARWorldTrackingConfiguration()
        
        //configuration.isLightEstimationEnabled = true
        // Run the view's session
   //     sceneView.session.run(configuration)
        resetTrackingConfiguration()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    
    func configureLighting() {
        sceneView.autoenablesDefaultLighting = true
        sceneView.automaticallyUpdatesLighting = true
    }
    
    // MARK: - ARSCNViewDelegate
    
    /*
     // Override to create and configure nodes for anchors added to the view's session.
     func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
     let node = SCNNode()
     
     return node
     }
     */
    
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        // let estimated_light :ARLightEstimate = (self.sceneView.session.currentFrame?.lightEstimate)!
        
        //  spotLight.intensity = estimated_light.ambientIntensity
        
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
    
    
    @IBAction func button_refresh(_ sender: Any) {
        resetTrackingConfiguration()
        
    }
    
    func resetTrackingConfiguration() {
        guard let referenceImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil) else { return }
        let configuration = ARWorldTrackingConfiguration()
        configuration.detectionImages = referenceImages
        let options: ARSession.RunOptions = [.resetTracking, .removeExistingAnchors]
        sceneView.session.run(configuration, options: options)
        label.text = "Mueve la camara hacia algún producto."
        info_button.isHidden = true
        self.isPlaying = false
        
        self.sceneView.scene.rootNode.enumerateChildNodes({(node, stop) in
            node.removeFromParentNode()
           //node.opacity = 0
            
        })
        
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        guard let imageAnchor = anchor as? ARImageAnchor else { return }
        let referenceImage = imageAnchor.referenceImage
        let imageName = referenceImage.name ?? "no name"
        
        if (self.isPlaying) {return }
        
        let plane = SCNPlane(width: referenceImage.physicalSize.width, height: referenceImage.physicalSize.height)
        let planeNode = SCNNode(geometry: plane)
        planeNode.opacity = 0.20
        planeNode.eulerAngles.x = -.pi / 2
        
        
        
        /*
         lazy var fadeAction: SCNAction = {
         return .sequence([
         .fadeOpacity(by: 0.8, duration: fadeDuration),
         .wait(duration: waitDuration),
         .fadeOut(duration: fadeDuration)
         ])
         }()
         */
        
        let scaleFactor  = 0.04
        let overlayNode = self.getNode(withImageName: imageName)
        
        //overlayNode.position.y = 0.2
        //overlayNode.position = SCNVector3Make(0, -0.8, 0.2)
        overlayNode.position = SCNVector3Make(0, -0.2, 0.0)
        //overlayNode.eulerAngles.x += -.pi / 2
        overlayNode.scale = SCNVector3(scaleFactor, scaleFactor, scaleFactor)
        let newOverlayNode = overlayNode.clone()
        
        
        let fadeAction: SCNAction = SCNAction.sequence([
            .fadeOpacity(by: 0.8, duration: fadeDuration),
            .wait(duration: waitDuration),
            .fadeOut(duration: fadeDuration)
            ])
        
        planeNode.runAction(fadeAction)
        
        node.addChildNode(planeNode)
        //node.addChildNode(overlayNode)
        node.addChildNode(newOverlayNode)
        DispatchQueue.main.async {
            self.label.text = "Producto encontrado: \"\(imageName)\""
            self.info_button.isHidden = false
        }
        
    }
    func getPlaneNode(withReferenceImage image: ARReferenceImage) -> SCNNode {
        let plane = SCNPlane(width: image.physicalSize.width,
                             height: image.physicalSize.height)
        let node = SCNNode(geometry: plane)
        return node
    }
   
    func getNode(withImageName name: String) -> SCNNode {
        var node = SCNNode()
        switch name {
       
        case "Contact202":
            node = contact202Node
            self.curProdurId = 1
            self.isPlaying = true
            break
       
        case "Contact204":
            node = contact204Node
            self.curProdurId = 5
            self.isPlaying = true
            break
            
        case "Contact205":
            node = contact205Node
            self.curProdurId = 7
            self.isPlaying = true
            break
            
        case "Contact206":
            node = contact206Node
            self.curProdurId = 8
            self.isPlaying = true
            break
        
        case "Contact212":
            node = contact212Node
            self.curProdurId = 4
            self.isPlaying = true
            break
        
        case "Contact216":
            node = contact216Node
            self.curProdurId = 9
            self.isPlaying = true
            break
            
            
        case "Contact222":
            node = contact222Node
            self.curProdurId = 2
            self.isPlaying = true
            break
            
        case "Contact227":
            node = contact227Node
            self.curProdurId = 3
            self.isPlaying = true
            break
            
            
        case "Contact244":
            node = contact244Node
            self.curProdurId = 6
            self.isPlaying = true
            break
            
        //case "Snow Mountain":
        //    node = mountainNode
        //case "Trees In the Dark":
        //    node = treeNode
        default:
            break
        }
        return node
    }

    @IBAction func info_click(_ sender: Any) {
        resetTrackingConfiguration()
        
        let curProduct = getProductsSearch(curId: self.curProdurId)
        
        debugPrint(curProduct.getName())
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        let mainController = sb.instantiateViewController(withIdentifier: "productDetailController") as! productDetailController
        mainController.curProduct = curProduct
        let NavMainController: navMainController = navMainController(rootViewController: mainController)
        NavMainController.setToolbarHidden(false, animated: false)
        
        self.present(NavMainController, animated: true, completion: nil)
        
       // showArProduct
    }
    
    
    ///////
    func getProductsSearch(curId :Int)->Product_Class
    {
        
        var searchedProduct: Product_Class!
        
        if let bundlePath = Bundle.main.url(forResource: "productos", withExtension: "json"){
            do {
                //let data = try Data(contentsOf: bundlePath)
                let text2 = try String(contentsOf: bundlePath, encoding: .utf8)
                
                
                
                //////
                
                let list: Array<Productos> = Mapper<Productos>().mapArray(JSONString: text2)!
                let curProducts: Array<Producto> = (list.first?.productos)!
                
                for curProduct: Producto in curProducts{
                    
                    if let cur_product_data = curProduct.producto{
                        
                        
                        let newProduct = Product_Class()
                        newProduct.setId(dato: cur_product_data.id!)
                        newProduct.setName(dato: cur_product_data.name!)
                        newProduct.setIdSubCategoria(dato: cur_product_data.idsubcategoria!)
                        newProduct.setDesc(dato: cur_product_data.desc!)
                        newProduct.setDesc_Completa(dato: cur_product_data.desc_completa!)
                        newProduct.setPresentaciones(datos: cur_product_data.presentaciones!)
                        newProduct.setImages(datos: cur_product_data.images!)
                        newProduct.setResName(dato: cur_product_data.resname!)
                        newProduct.setFichaTecnica(dato: cur_product_data.ficha_tecnica!)
                        newProduct.setRedes(dato: cur_product_data.redes!)
                        newProduct.setAplicaciones(datos: cur_product_data.aplicaciones!)
                        newProduct.setEspecificaciones(datos: cur_product_data.especificaciones!)
                        newProduct.setCaracteristicas(datos: cur_product_data.caracteristicas!)
                        newProduct.setColors(datos: cur_product_data.colors!)
                        newProduct.setAdhieres(datos: cur_product_data.adhieres!)
                        newProduct.setVentajas(datos: cur_product_data.ventajas!)
                        newProduct.setUsos(datos: cur_product_data.usos!)
                        newProduct.setNota(dato: cur_product_data.nota!)
                        
                        
                        if (newProduct.getId() == curId){
                            searchedProduct = newProduct
                            break
                        }
                        
                        
                        
                    }
                    
                }
                
                ////
                
            }
                
            catch {
                print(error)
                return searchedProduct
            }
            
            
            
        }
        
        return searchedProduct
    }
    
    
    //////
    
    
    
    
}


