//
//  MyProfileDetails.swift
//  Saudi Fisheries
//
//  Created by Sandipan on 29/01/19.
//  Copyright © 2019 SANDIPAN. All rights reserved.
//

import UIKit

class MyProfileDetails: UIViewController, UITextFieldDelegate {

    @IBOutlet var view1: UIView!

    @IBOutlet var txtName: UITextField!
    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var txtMobile: UITextField!
    
    @IBOutlet var imgvProfile: UIImageView!
    
    // MARK: - viewWillAppear Method
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - viewDidAppear Method
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    // MARK: - viewDidLoad method
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //Do any additional setup after loading the view.
        //let myAppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let border = CALayer()
        let width = CGFloat(0.5)
        border.borderColor = UIColor(red: 65/255, green: 65/255, blue: 66/255, alpha: 1.0).cgColor
        border.frame = CGRect(x: 0, y: txtName.frame.size.height - width, width: txtName.frame.size.width, height: txtName.frame.size.height)
        border.borderWidth = width
        txtName.layer.addSublayer(border)
        txtName.layer.masksToBounds = true
        txtName.attributedPlaceholder = NSAttributedString(string: "Name",attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        
        let border2 = CALayer()
        let width2 = CGFloat(0.5)
        border2.borderColor = UIColor(red: 65/255, green: 65/255, blue: 66/255, alpha: 1.0).cgColor
        border2.frame = CGRect(x: 0, y: txtEmail.frame.size.height - width2, width: txtEmail.frame.size.width, height: txtEmail.frame.size.height)
        border2.borderWidth = width2
        txtEmail.layer.addSublayer(border2)
        txtEmail.layer.masksToBounds = true
        txtEmail.attributedPlaceholder = NSAttributedString(string: "Email",attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        
        let border3 = CALayer()
        let width3 = CGFloat(0.5)
        border3.borderColor = UIColor(red: 65/255, green: 65/255, blue: 66/255, alpha: 1.0).cgColor
        border3.frame = CGRect(x: 0, y: txtMobile.frame.size.height - width3, width: txtMobile.frame.size.width, height: txtMobile.frame.size.height)
        border3.borderWidth = width3
        txtMobile.layer.addSublayer(border3)
        txtMobile.layer.masksToBounds = true
        txtMobile.attributedPlaceholder = NSAttributedString(string: "Mobile Number",attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        
        
        let dicUser = UserDefaults.standard.value(forKey: "RegisteredUserDetails") as! NSMutableDictionary
        let  strfirst_name = String(format: "%@", dicUser.value(forKey: "first_name") as! CVarArg)
        let  strlast_name = String(format: "%@", dicUser.value(forKey: "last_name") as! CVarArg)
        let  stremail = String(format: "%@", dicUser.value(forKey: "email") as! CVarArg)
        let  strregister_mobilenumber = String(format: "%@", dicUser.value(forKey: "register_mobilenumber") as! CVarArg)
        txtEmail.text = stremail
        txtMobile.text = strregister_mobilenumber
        txtName.text = String(format: "%@ %@", strfirst_name,strlast_name)
        
    }

    // MARK: - pressBack method
    @IBAction func pressBack(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - pressEdit method
    @IBAction func pressEdit(_ sender: Any)
    {
    }
}
