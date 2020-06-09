//
//  NewLocationController.swift
//  ios_MD3&4
//
//  Created by Aivis Skangalis on 29.05.2020.
//  Copyright © 2020 Aivis Skangalis. All rights reserved.
//

import UIKit
import MapKit

class NewLocationController: UIViewController {
    
    let firebaseHandler: FirebaseController = FirebaseController()

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var info: UITextField!
    @IBOutlet weak var longitude: UITextField!
    @IBOutlet weak var latitude: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func addNewLocation(_ sender: UIButton) {
        if (latitude.text != "" && longitude.text != ""){
            guard let lat = Double(latitude.text!) else{
                let alert = UIAlertController(title: "error", message: "Ievadiet pareizu latitude", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return
            }
            guard let long = Double(longitude.text!) else{
                let alert = UIAlertController(title: "error", message: "Ievadiet pareizu longitude", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return
            }
            firebaseHandler.sendData(name.text,info.text, lat, long)
            name.text = ""
            info.text = ""
            latitude.text = ""
            longitude.text = ""
            showToast(controller: self, message : "Jauns punkts pievienots!", seconds: 2.0)
        }else{
            let alert = UIAlertController(title: "Warning", message: "Nekas nav ievadītss", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            latitude.text = ""
            longitude.text = ""
        }
    }
    
    func showToast(controller: UIViewController, message : String, seconds: Double) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.view.backgroundColor = UIColor.black
        alert.view.alpha = 0.6
        alert.view.layer.cornerRadius = 15
        controller.present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true)
        }
    }
}
