//
//  SecondViewController.swift
//  Purchase List
//
//  Created by Kaulitz Guimarães on 03/02/19.
//  Copyright © 2019 Kaulitz Guimarães. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var priceText: UITextField!
    
    @IBOutlet weak var amountText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SecondViewController.dismissKeyboard))

        // Do any additional setup after loading the view.
         view.addGestureRecognizer(tap)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func addItem(_ sender: Any) {
        let price = Double(self.priceText.text!) ?? 0
        let amount = Int(self.amountText.text!) ?? 0
       ViewController.items.addItem(nameText.text!, price, amount)
         NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
    }
    
    

    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}
