//
//  Registration.swift
//  Saudi Fisheries
//
//  Created by Sandipan on 18/01/19.
//  Copyright © 2019 SANDIPAN. All rights reserved.
//

import UIKit

class Registration: UIViewController,UITextFieldDelegate
{
    
    @IBOutlet var viewBox: UIView!
    @IBOutlet var txtFirstname: UITextField!
    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var txtLastname: UITextField!
    @IBOutlet var txtMobileNumber: UITextField!
    @IBOutlet var txtConfirmPassword: UITextField!
    
    @IBOutlet var btnRegister: UIButton!
    @IBOutlet var btnHaveAnAccount: UIButton!
    
    
    // MARK: - viewWillAppear Method
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
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
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.setupborder()
        
        btnRegister.layer.borderColor = UIColor.clear.cgColor
        btnRegister.layer.borderWidth = 1.0
        btnRegister.layer.cornerRadius = 2.0
        btnRegister.layer.masksToBounds = true
    }
    
    // MARK: - press Back method
    @IBAction func pressBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Setup Border stye
    func setupborder() -> Void
    {
        let border = CALayer()
        let width = CGFloat(0.5)
        border.borderColor = UIColor(red: 65/255, green: 65/255, blue: 66/255, alpha: 1.0).cgColor
        border.frame = CGRect(x: 0, y: txtEmail.frame.size.height - width, width: txtEmail.frame.size.width, height: txtEmail.frame.size.height)
        border.borderWidth = width
        txtEmail.layer.addSublayer(border)
        txtEmail.layer.masksToBounds = true
        txtEmail.attributedPlaceholder = NSAttributedString(string: "Email",attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        
        let border1 = CALayer()
        let width1 = CGFloat(0.5)
        border1.borderColor = UIColor(red: 65/255, green: 65/255, blue: 66/255, alpha: 1.0).cgColor
        border1.frame = CGRect(x: 0, y: txtPassword.frame.size.height - width1, width: txtPassword.frame.size.width, height: txtPassword.frame.size.height)
        border1.borderWidth = width1
        txtPassword.layer.addSublayer(border1)
        txtPassword.layer.masksToBounds = true
        txtPassword.attributedPlaceholder = NSAttributedString(string: "Password",attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        
        let border2 = CALayer()
        let width2 = CGFloat(0.5)
        border2.borderColor = UIColor(red: 65/255, green: 65/255, blue: 66/255, alpha: 1.0).cgColor
        border2.frame = CGRect(x: 0, y: txtLastname.frame.size.height - width2, width: txtLastname.frame.size.width, height: txtLastname.frame.size.height)
        border2.borderWidth = width2
        txtLastname.layer.addSublayer(border2)
        txtLastname.layer.masksToBounds = true
        txtLastname.attributedPlaceholder = NSAttributedString(string: "Last Name",attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        
        let border3 = CALayer()
        let width3 = CGFloat(0.5)
        border3.borderColor = UIColor(red: 65/255, green: 65/255, blue: 66/255, alpha: 1.0).cgColor
        border3.frame = CGRect(x: 0, y: txtMobileNumber.frame.size.height - width3, width: txtMobileNumber.frame.size.width, height: txtMobileNumber.frame.size.height)
        border3.borderWidth = width3
        txtMobileNumber.layer.addSublayer(border3)
        txtMobileNumber.layer.masksToBounds = true
        txtMobileNumber.attributedPlaceholder = NSAttributedString(string: "Mobile Number",attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        
        let border4 = CALayer()
        let width4 = CGFloat(0.5)
        border4.borderColor = UIColor(red: 65/255, green: 65/255, blue: 66/255, alpha: 1.0).cgColor
        border4.frame = CGRect(x: 0, y: txtFirstname.frame.size.height - width4, width: txtFirstname.frame.size.width, height: txtFirstname.frame.size.height)
        border4.borderWidth = width4
        txtFirstname.layer.addSublayer(border4)
        txtFirstname.layer.masksToBounds = true
        txtFirstname.attributedPlaceholder = NSAttributedString(string: "First Name",attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        
        let border5 = CALayer()
        let width5 = CGFloat(0.5)
        border5.borderColor = UIColor(red: 65/255, green: 65/255, blue: 66/255, alpha: 1.0).cgColor
        border5.frame = CGRect(x: 0, y: txtConfirmPassword.frame.size.height - width5, width: txtConfirmPassword.frame.size.width, height: txtConfirmPassword.frame.size.height)
        border5.borderWidth = width5
        txtConfirmPassword.layer.addSublayer(border5)
        txtConfirmPassword.layer.masksToBounds = true
        txtConfirmPassword.attributedPlaceholder = NSAttributedString(string: "Confirm Password",attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        
    }
    
    //MARK: - pressRegister Method
    @IBAction func pressRegister(_ sender: Any) {
    }
    
    //MARK: - pressHaveanAccount Method
    @IBAction func pressHaveanAccount(_ sender: Any) {
    }
    
    
    
    // MARK: - Textfield Delegate Method
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
    }
    func textFieldDidEndEditing(_ textField: UITextField)
    {
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool
    {
        return true;
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool
    {
        return true;
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool
    {
        return true;
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        return true;
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder();
        return true;
    }
    
    
}
