//
//  ViewController.swift
//  First
//
//  Created by David Debre on 12/4/17.
//  Copyright © 2017 David Debre. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // MARK: Properties
    @IBOutlet weak var asdasd: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var goButton: UIButton!
    
    // MARK: Actions
    @IBAction func goButtonAction(_ sender: UIButton) {
        asdasd.text = "szia"
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        asdasd.text = textField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("szeeevassz viewDidLoad")
        textField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

