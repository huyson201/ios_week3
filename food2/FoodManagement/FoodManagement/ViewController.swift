//
//  ViewController.swift
//  FoodManagement
//
//  Created by CNTT on 4/16/21.
//  Copyright © 2021 fit.tdc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    //MARK: properties
    @IBOutlet weak var edtMealName: UITextField!
    
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        edtMealName.delegate = self
       
    }
    
    //MARK: text field's delegated func
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let mealName = textField.text{
            print("meal name \(mealName)")
        }
    }
    
    //MARK: img processing
    
    
    @IBAction func imgProcessing(_ sender: UITapGestureRecognizer) {
        edtMealName.resignFirstResponder()
        
        //
        let imgPicker = UIImagePickerController()
        
        // config img source
        imgPicker.sourceType = .photoLibrary
        imgPicker.delegate = self
        
        // show imgpicker
        present(imgPicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let img = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imgView.image = img
            dismiss(animated: true, completion: nil)
        }
    }
}


