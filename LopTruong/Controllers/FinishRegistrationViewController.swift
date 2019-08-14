//
//  FinisRegistrationViewController.swift
//  LopTruong
//
//  Created by NeilPhung on 8/14/19.
//  Copyright © 2019 NeilPhung. All rights reserved.
//

import UIKit
import ProgressHUD

class FinishRegistrationViewController: UIViewController {
    
    
    var email: String!
    var password: String!
    var avatarImage: UIImage?
    
    //MARK: IBOutlet
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var schoolnameTextField: UITextField!
    @IBOutlet weak var classnameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(email)
        print(password)
        
    }
    
    //MARK: IBAction
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        cleanTextFields()
        dismissKeyboard()
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        dismissKeyboard()
        ProgressHUD.show("Vui Lòng đợi trong giây lát...")
        
        if nameTextField.text != "" && surnameTextField.text  != "" && schoolnameTextField.text != "" && classnameTextField.text != "" && phoneTextField.text != ""{
            dismissKeyboard()
            
            FUser.registerUserWith(email: email, password: password, firstName: nameTextField.text!, lastName: surnameTextField.text!, className: classnameTextField.text!, schoolName: schoolnameTextField.text!) { (err) in
                
                if err != nil {
                    ProgressHUD.dismiss()
                    ProgressHUD.showError(err!.localizedDescription)
                    return
                }
                
                self.registerUser()
                
            }
            registerUser()
        }
            
        else {
            ProgressHUD.showError("Vùi lòng nhập đầy đủ thông tin")
        }
        
        
        
    }
    
    //MARK: - Helper Methods
    
    func dismissKeyboard(){
        view.endEditing(false)
    }
    
    func cleanTextFields() {
        nameTextField.text = ""
        surnameTextField.text = ""
        schoolnameTextField.text = ""
        classnameTextField.text = ""
        phoneTextField.text = ""
        
    }
    
    func registerUser() {
        
        let fullName = nameTextField.text! + " " + surnameTextField.text!
        
        var tempDictionary : Dictionary = [kFIRSTNAME : nameTextField.text!, kLASTNAME : surnameTextField.text!, kFULLNAME : fullName, kCLASSNAME : classnameTextField.text!, kSchoolName : schoolnameTextField.text!, kPHONE : phoneTextField.text!] as [String : Any]
        
        
        if avatarImage == nil {
            
            imageFromInitials(firstName: nameTextField.text!, lastName: surnameTextField.text!) { (avatarInitials) in
                
                let avatarIMG = avatarInitials.jpegData(compressionQuality: 0.7)
                let avatar = avatarIMG!.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
                
                tempDictionary[kAVATAR] = avatar
                
                self.finishRegistration(withValues: tempDictionary)
            }
            
            
            
        } else {
            
            let avatarData = avatarImage?.jpegData(compressionQuality: 0.5)
            let avatar = avatarData!.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
            
            tempDictionary[kAVATAR] = avatar
            
            self.finishRegistration(withValues: tempDictionary)
        }
        
    }
    
    func finishRegistration(withValues: [String : Any]) {
        
        reference(.User).addDocument(data: withValues) { (err) in
            
            if err != nil {
                
                DispatchQueue.main.async {
                    ProgressHUD.showError(err!.localizedDescription)
                    print(err!.localizedDescription)
                }
                return
            }
            else {
                ProgressHUD.dismiss()
                self.goToApp()
            }
            
        }
        
    }
    
    func goToApp() {
        dismissKeyboard()
        let mainView = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainApplication") as! MainApplicationTableViewController
        cleanTextFields()
        
        self.present(mainView, animated: true, completion: nil)
    }
    
    
}
