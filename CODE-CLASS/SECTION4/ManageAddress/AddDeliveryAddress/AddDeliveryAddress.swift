//
//  AddDeliveryAddress.swift
//  Saudi Fisheries
//
//  Created by Sandipan on 13/03/19.
//  Copyright © 2019 SANDIPAN. All rights reserved.
//

import UIKit

class AddDeliveryAddress: UIViewController,UITextFieldDelegate
{
    @IBOutlet var btnGps: UIButton!
    @IBOutlet var imgvGps: UIImageView!
    
    @IBOutlet var view1: UIView!
    @IBOutlet var txtPincode: UITextField!
    @IBOutlet var txtAddress1: UITextField!
    @IBOutlet var txtAddress2: UITextField!
    @IBOutlet var txtLandmark: UITextField!
    
    @IBOutlet var view2: UIView!
    @IBOutlet var txtName: UITextField!
    @IBOutlet var txtMobileNumber: UITextField!
    @IBOutlet var txtMobileNumberAlternate: UITextField!
    
    @IBOutlet var view3: UIView!
    @IBOutlet var btnHome: UIButton!
    @IBOutlet var lblHome: UILabel!
    @IBOutlet var btnWork: UIButton!
    @IBOutlet var lblWork: UILabel!

    @IBOutlet var btnSave: UIButton!
    
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
        
        self.setupborder()
        
    }
    
    //MARK: - Setup Border stye
    func setupborder() -> Void
    {
        view1.backgroundColor = UIColor.white
        view1.layer.borderWidth = 1
        view1.layer.borderColor = UIColor(red: 214/255, green: 214/255, blue: 214/255, alpha: 1.0).cgColor
        view1.layer.masksToBounds = true
        
        view2.backgroundColor = UIColor.white
        view2.layer.borderWidth = 1
        view2.layer.borderColor = UIColor(red: 214/255, green: 214/255, blue: 214/255, alpha: 1.0).cgColor
        view2.layer.masksToBounds = true
        
        view3.backgroundColor = UIColor.white
        view3.layer.borderWidth = 1
        view3.layer.borderColor = UIColor(red: 214/255, green: 214/255, blue: 214/255, alpha: 1.0).cgColor
        view3.layer.masksToBounds = true
        
        btnGps.backgroundColor = UIColor.white
        btnGps.layer.borderWidth = 1
        btnGps.layer.borderColor = UIColor(red: 214/255, green: 214/255, blue: 214/255, alpha: 1.0).cgColor
        btnGps.layer.masksToBounds = true
        
        let border = CALayer()
        let width = CGFloat(0.5)
        border.borderColor = UIColor(red: 214/255, green: 214/255, blue: 214/255, alpha: 1.0).cgColor
        border.frame = CGRect(x: 0, y: txtPincode.frame.size.height - width, width: txtPincode.frame.size.width, height: txtPincode.frame.size.height)
        border.borderWidth = width
        txtPincode.layer.addSublayer(border)
        txtPincode.layer.masksToBounds = true
        
        let border1 = CALayer()
        let width1 = CGFloat(0.5)
        border1.borderColor = UIColor(red: 214/255, green: 214/255, blue: 214/255, alpha: 1.0).cgColor
        border1.frame = CGRect(x: 0, y: txtAddress1.frame.size.height - width1, width: txtAddress1.frame.size.width, height: txtAddress1.frame.size.height)
        border1.borderWidth = width1
        txtAddress1.layer.addSublayer(border1)
        txtAddress1.layer.masksToBounds = true
        
        let border2 = CALayer()
        let width2 = CGFloat(0.5)
        border2.borderColor = UIColor(red: 214/255, green: 214/255, blue: 214/255, alpha: 1.0).cgColor
        border2.frame = CGRect(x: 0, y: txtAddress2.frame.size.height - width2, width: txtAddress2.frame.size.width, height: txtAddress2.frame.size.height)
        border2.borderWidth = width2
        txtAddress2.layer.addSublayer(border2)
        txtAddress2.layer.masksToBounds = true
        
        let border3 = CALayer()
        let width3 = CGFloat(0.5)
        border3.borderColor = UIColor(red: 214/255, green: 214/255, blue: 214/255, alpha: 1.0).cgColor
        border3.frame = CGRect(x: 0, y: txtLandmark.frame.size.height - width3, width: txtLandmark.frame.size.width, height: txtLandmark.frame.size.height)
        border3.borderWidth = width3
        txtLandmark.layer.addSublayer(border3)
        txtLandmark.layer.masksToBounds = true
        
        let border4 = CALayer()
        let width4 = CGFloat(0.5)
        border4.borderColor = UIColor(red: 214/255, green: 214/255, blue: 214/255, alpha: 1.0).cgColor
        border4.frame = CGRect(x: 0, y: txtName.frame.size.height - width4, width: txtName.frame.size.width, height: txtName.frame.size.height)
        border4.borderWidth = width4
        txtName.layer.addSublayer(border4)
        txtName.layer.masksToBounds = true
        
        let border5 = CALayer()
        let width5 = CGFloat(0.5)
        border5.borderColor = UIColor(red: 214/255, green: 214/255, blue: 214/255, alpha: 1.0).cgColor
        border5.frame = CGRect(x: 0, y: txtMobileNumber.frame.size.height - width5, width: txtMobileNumber.frame.size.width, height: txtMobileNumber.frame.size.height)
        border5.borderWidth = width5
        txtMobileNumber.layer.addSublayer(border5)
        txtMobileNumber.layer.masksToBounds = true
        
        let border6 = CALayer()
        let width6 = CGFloat(0.5)
        border6.borderColor = UIColor(red: 214/255, green: 214/255, blue: 214/255, alpha: 1.0).cgColor
        border6.frame = CGRect(x: 0, y: txtMobileNumberAlternate.frame.size.height - width6, width: txtMobileNumberAlternate.frame.size.width, height: txtMobileNumberAlternate.frame.size.height)
        border6.borderWidth = width6
        txtMobileNumberAlternate.layer.addSublayer(border6)
        txtMobileNumberAlternate.layer.masksToBounds = true
        
    }
    
    // MARK: - pressBack method
    @IBAction func pressBack(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - pressHome && pressWork method
    @IBAction func pressHome(_ sender: Any)
    {
    }
    @IBAction func pressWork(_ sender: Any)
    {
    }

    // MARK: - pressSave method
    @IBAction func pressSave(_ sender: Any)
    {
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
