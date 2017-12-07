//
//  ViewController.swift
//  First
//
//  Created by David Debre on 12/4/17.
//  Copyright © 2017 David Debre. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: Properties
    @IBOutlet weak var asdasd: UILabel!
    @IBOutlet weak var textField: UITextField!
//    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingBar: RatingControl!
    
    // MARK: Actions
//    @IBAction func goButtonAction(_ sender: UIButton) {
//        asdasd.text = "szia"
//    }
    
    // MARK: UIImagePickerControllerDelegate
    @IBAction func selectImageAction(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion: nil)
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        asdasd.text = textField.text
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            let alertView = UIAlertController(title: "image cannot be picked", message: ":(", preferredStyle: .alert)
            present(alertView, animated: true)
            return
        }
        
        photoImageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        NSLog("imagePickerControllerDidCancel")
        dismiss(animated: true, completion: nil)
        
        let alertView = UIAlertController(title: "why did u cancel? ", message: ":(", preferredStyle: .alert)
        let action = UIAlertAction(title: "cancel", style: .cancel, handler: {(action: UIAlertAction!) in})
        alertView.addAction(action)
        present(alertView, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("szeeevassz viewDidLoad")
        textField.delegate = self
        
        asdasd.text = "Meal name"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

