//
//  ViewController.swift
//  Delegates_and_Protocols
//
//  Created by Deepa Thalikar on 1/5/19.
//  Copyright © 2019 Deepa Thalikar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CanReceive {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    }

    @IBAction func changeColorOnClick(_ sender: Any) {
        view.backgroundColor = UIColor.red
    }
    
    @IBAction func sendButtonPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "sendDataForwards" , sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "sendDataForwards" {
            
            let secondVC = segue.destination as! SecondViewController
            
            secondVC.data = textField.text!
            
            secondVC.delegate = self
           
        }
    
    }
    
    func dataReceived(data: String) {
        label.text = data
    }

}
