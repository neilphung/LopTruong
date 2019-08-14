//
//  WelcomeViewController.swift
//  LopTruong
//
//  Created by NeilPhung on 8/14/19.
//  Copyright © 2019 NeilPhung. All rights reserved.
//

import UIKit
import ProgressHUD

class WelcomeViewController: UIViewController {

    
    //MARK: - IBOutlets
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    //MARK: - IBActions
    
    @IBAction func backgroundTap(_ sender: UITapGestureRecognizer) {
        dismissKeyboard()
    }
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        dismissKeyboard()
        cleanTextField()
    }
    

    @IBAction func registerButtonPressed(_ sender: UIButton) {
        
        if emailTextField.text != "" && passwordTextField.text != "" && repeatTextField.text != "" {
            
            if passwordTextField.text == repeatTextField.text {
               
                dismissKeyboard()
                cleanTextField()
            }else {
               ProgressHUD.showError("Mật khẩu không giống nhau")
            }
            

        }
        else {
            ProgressHUD.showError("Vui lòng nhập đẩy đủ thông tin")
        }

    }
    
    
    //MARK: - Helper Methods
    
    func dismissKeyboard(){
        view.endEditing(false)
    }
    
    func cleanTextField() {
        emailTextField.text = ""
        passwordTextField.text = ""
        repeatTextField.text = ""
    }
    
}



