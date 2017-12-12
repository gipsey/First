//
//  MealViewController.swift
//  First
//
//  Created by David Debre on 12/4/17.
//  Copyright © 2017 David Debre. All rights reserved.
//

import UIKit
import os.log

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var meal : Meal?
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingBar: RatingControl!

    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBAction func selectImageAction(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("viewDidLoad called")
        textField.delegate = self
        
        updateSaveButtonState()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
                os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        let text = textField.text ?? ""
        let image = photoImageView.image
        let rating = ratingBar.rating
        
        meal = Meal(text, image, rating)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButton.isEnabled = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
        navigationItem.title = textField.text
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
    
    private func updateSaveButtonState() {
        let text = textField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
}

