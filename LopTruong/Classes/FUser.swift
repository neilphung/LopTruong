//
//  FUser.swift
//  LopTruong
//
//  Created by NeilPhung on 8/14/19.
//  Copyright © 2019 NeilPhung. All rights reserved.
//

import Foundation
import Firebase


class FUser {
    
    let UserID: String
    
    
    let createdAt: Date
    var updateAt: Date
    
    var email: String
    var fistname: String
    var lastname: String
    var fullname : String
    var avatar: String
    var isOnline : Bool
    var phoneNumber: String
    var schoolName : String
    var loginMethod: String
    
    var className: String


    //MARK: Initializers
    
    init(_UserID: String, _createAt: Date, _updateAt: Date, _email: String, _fistname: String, _lastname: String, _avatar: String = "", _loginMethod: String,_phoneNumber: String,_className: String,_schoolName: String ) {
        
        UserID = _UserID
        
        createdAt = _createAt
        updateAt = _updateAt
        
        email = _email
        fistname = _fistname
        lastname = _lastname
        fullname = _fistname + " " + _lastname
        avatar = _avatar
        phoneNumber = _phoneNumber
        isOnline = true
        loginMethod = _loginMethod
        
        className = _className
        schoolName = _schoolName
        
    }
    
    //MARK: Register Method
    
    class func registerUserWith(email: String, password: String, firstName: String, lastName: String, avatar: String = "", className: String, schoolName: String ,completion: @escaping (_ error: Error?) -> Void ) {
        
        Auth.auth().createUser(withEmail: email, password: password, completion: { (firuser, err) in
            
            if err != nil {
                
                completion(err)
                return
            }
            
//            let fUser = FUser(_UserID: firuser!.user.uid, _createAt: Date(), _updateAt: Date(), _email: firuser!.user.email!, _fistname: firstName, _lastname: lastName, _avatar: avatar, _loginMethod: kEMAIL, _phoneNumber: "", _className: className, _schoolName: schoolName)
            
            
//            saveUserLocally(fUser: fUser)
//            saveUserToFirestore(fUser: fUser)
//            completion(error)
            
        })
        
    }
    
    
    
    
}
