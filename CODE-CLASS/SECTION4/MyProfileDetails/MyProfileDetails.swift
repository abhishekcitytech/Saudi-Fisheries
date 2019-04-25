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
    @IBOutlet var txtFirstname: UITextField!
    @IBOutlet var txtLastname: UITextField!
    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var txtMobile: UITextField!
    @IBOutlet var imgvProfile: UIImageView!
    @IBOutlet var btnimgvProfile: UIButton!
    
    @IBOutlet var view2: UIView!
    @IBOutlet var btnActiveInactive: UIButton!
    
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
        
        view1.layer.borderColor = UIColor.lightGray.cgColor
        view1.layer.borderWidth = 1.0
        view1.layer.cornerRadius = 2.0
        view1.layer.masksToBounds = true
        
        view2.layer.borderColor = UIColor.lightGray.cgColor
        view2.layer.borderWidth = 1.0
        view2.layer.cornerRadius = 2.0
        view2.layer.masksToBounds = true
        
        btnActiveInactive.layer.borderColor = UIColor.clear.cgColor
        btnActiveInactive.layer.borderWidth = 0.0
        btnActiveInactive.layer.cornerRadius = 2.0
        btnActiveInactive.layer.masksToBounds = true
        
        let border = CALayer()
        let width = CGFloat(0.5)
        border.borderColor = UIColor(red: 65/255, green: 65/255, blue: 66/255, alpha: 1.0).cgColor
        border.frame = CGRect(x: 0, y: txtEmail.frame.size.height - width, width: txtEmail.frame.size.width, height: txtEmail.frame.size.height)
        border.borderWidth = width
        txtEmail.layer.addSublayer(border)
        txtEmail.layer.masksToBounds = true
        txtEmail.attributedPlaceholder = NSAttributedString(string: "Email",attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        
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
        border3.frame = CGRect(x: 0, y: txtMobile.frame.size.height - width3, width: txtMobile.frame.size.width, height: txtMobile.frame.size.height)
        border3.borderWidth = width3
        txtMobile.layer.addSublayer(border3)
        txtMobile.layer.masksToBounds = true
        txtMobile.attributedPlaceholder = NSAttributedString(string: "Mobile Number",attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        
        let border4 = CALayer()
        let width4 = CGFloat(0.5)
        border4.borderColor = UIColor(red: 65/255, green: 65/255, blue: 66/255, alpha: 1.0).cgColor
        border4.frame = CGRect(x: 0, y: txtFirstname.frame.size.height - width4, width: txtFirstname.frame.size.width, height: txtFirstname.frame.size.height)
        border4.borderWidth = width4
        txtFirstname.layer.addSublayer(border4)
        txtFirstname.layer.masksToBounds = true
        txtFirstname.attributedPlaceholder = NSAttributedString(string: "First Name",attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
    }

    // MARK: - pressBack method
    @IBAction func pressBack(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
}
