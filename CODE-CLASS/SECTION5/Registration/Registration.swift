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
    
    var loadingCircle = UIView()
    var circle = UIView()
    
    
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
    @IBAction func pressRegister(_ sender: Any)
    {
        if txtFirstname.text == ""
        {
            let uiAlert = UIAlertController(title: "", message: "Please enter firstname", preferredStyle: UIAlertController.Style.alert)
            self.present(uiAlert, animated: true, completion: nil)
            uiAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                print("Click of default button")
            }))
        }
        else if txtLastname.text == ""
        {
            let uiAlert = UIAlertController(title: "", message: "Please enter lastname", preferredStyle: UIAlertController.Style.alert)
            self.present(uiAlert, animated: true, completion: nil)
            uiAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                print("Click of default button")
            }))
        }
        else if txtEmail.text == ""
        {
            let uiAlert = UIAlertController(title: "", message: "Please enter email", preferredStyle: UIAlertController.Style.alert)
            self.present(uiAlert, animated: true, completion: nil)
            uiAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                print("Click of default button")
            }))
        }
        else if txtPassword.text == ""
        {
            let uiAlert = UIAlertController(title: "", message: "Please enter password", preferredStyle: UIAlertController.Style.alert)
            self.present(uiAlert, animated: true, completion: nil)
            uiAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                print("Click of default button")
            }))
        }
        else if txtConfirmPassword.text == ""
        {
            let uiAlert = UIAlertController(title: "", message: "Please confirm password", preferredStyle: UIAlertController.Style.alert)
            self.present(uiAlert, animated: true, completion: nil)
            uiAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                print("Click of default button")
            }))
        }
        else if txtMobileNumber.text == ""
        {
            let uiAlert = UIAlertController(title: "", message: "Please enter mobilenumber", preferredStyle: UIAlertController.Style.alert)
            self.present(uiAlert, animated: true, completion: nil)
            uiAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                print("Click of default button")
            }))
        }
        else
        {
            self.postRegister()
        }

    }
    func postRegister()
    {
        self.showLoadingMode()
        
        let strSlectedStoreID = String(format: "%@", UserDefaults.standard.string(forKey: "SelectedStoreID")!)
        
        let dicPostRegistration:NSMutableDictionary? = ["first_name" : txtFirstname.text!,
        "last_name" : txtLastname.text!,
        "email" : txtEmail.text!,
        "password" : txtPassword.text!,
        "confirm_password" : txtConfirmPassword.text!,
        "register_mobilenumber" : txtMobileNumber.text!,
        "registered_in_store_id" : strSlectedStoreID
        ];
        print("dicPostRegistration ---->>>>>",dicPostRegistration as Any)
        
        let dicPostOverAll:NSMutableDictionary? = ["customer" : dicPostRegistration as Any];
        print("dicPostOverAll ---->>>>>",dicPostOverAll as Any)
        
        let strapikey = String(format: "%@ %@", UserDefaults.standard.string(forKey: "token_type")!, UserDefaults.standard.string(forKey: "access_token")!)
        let strconnurl = String(format: "%@%@", Constants.conn.ConnUrl, "/api/customer/registration")
        let request = NSMutableURLRequest(url: NSURL(string: strconnurl)! as URL)
        request.httpMethod = "POST"
        request.setValue(strapikey, forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let jsonData : NSData = try! JSONSerialization.data(withJSONObject: dicPostOverAll) as NSData
        let jsonString = NSString(data: jsonData as Data, encoding: String.Encoding.utf8.rawValue)! as String
        print("json string = \(jsonString)")
        request.httpBody = jsonData as Data
        
        let task = URLSession.shared.dataTask(with: request as URLRequest){ data, response, error in
            guard error == nil && data != nil else
            {
                //check for fundamental networking error
                self.hideLoadingMode()
                print("Error=\(String(describing: error))")
                return
            }
            do{
                if let json = try JSONSerialization.jsonObject(with: data!) as? NSDictionary
                {
                    self.hideLoadingMode()
                    
                    let dictemp = json as NSDictionary
                    print("dictemp --->",dictemp)
                    
                    let Status = String(format: "%@", dictemp.value(forKey: "Status") as! CVarArg)
                    let ResponseMessage = String(format: "%@", dictemp.value(forKey: "ResponseMessage") as! CVarArg)
                    
                    let Data = dictemp.value(forKey: "Data") as! NSDictionary
                    UserDefaults.standard.set(Data, forKey: "RegisteredUserDetails")
                    UserDefaults.standard.synchronize()
                    
                    UserDefaults.standard.set(1, forKey: "dataNotSave")
                    UserDefaults.standard.synchronize()
                    
                    OperationQueue.main.addOperation {
                        self.navigationController?.popToRootViewController(animated: true)
                    }
                    
                    
                }
            }
            catch {
                //check for internal server data error
                self.hideLoadingMode()
                print("Error -> \(error)")
            }
        }
        task.resume()
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
    
    // MARK: - showLoadingMode Method
    func showLoadingMode()
    {
        OperationQueue.main.addOperation {
            self.loadingCircle.removeFromSuperview()
        }
        
        loadingCircle = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        loadingCircle.backgroundColor = UIColor.black
        loadingCircle.alpha = 0.6
        
        circle = UIView ()
        circle.backgroundColor = UIColor.white
        circle.alpha = 1.0
        let size = 60
        let size1 = 60
        var frame = circle.frame
        frame.size.width = CGFloat(size)
        frame.size.height = CGFloat(size1)
        frame.origin.x = self.view.frame.size.width / 2 - frame.size.width / 2;
        frame.origin.y = self.view.frame.size.height / 2 - frame.size.height / 2;
        circle.frame = frame
        circle.center = self.view.center
        circle.layer.cornerRadius = 30.0
        circle.layer.borderWidth = 1.0
        circle.layer.borderColor=UIColor.white.cgColor
        circle.layer.masksToBounds = true
        
        /*let imgvLogo = UIImageView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
         imgvLogo.backgroundColor = UIColor.clear
         imgvLogo.image = UIImage(named:"productlogo")
         circle.addSubview(imgvLogo)*/
        
        let  animatedImageView =  UIImageView(frame: circle.bounds)
        animatedImageView.animationImages = NSArray(objects:UIImage(named: "frame-0.png")!,
                                                    UIImage(named: "frame-1.png")!,
                                                    UIImage(named: "frame-2.png")!,
                                                    UIImage(named: "frame-3.png")!,
                                                    UIImage(named: "frame-4.png")!,
                                                    UIImage(named: "frame-5.png")!,
                                                    UIImage(named: "frame-6.png")!,
                                                    UIImage(named: "frame-7.png")!,
                                                    UIImage(named: "frame-8.png")!,
                                                    UIImage(named: "frame-9.png")!,
                                                    UIImage(named: "frame-10.png")!,
                                                    UIImage(named: "frame-11.png")!,
                                                    UIImage(named: "frame-12.png")!,
                                                    UIImage(named: "frame-13.png")!,
                                                    UIImage(named: "frame-14.png")!,
                                                    UIImage(named: "frame-15.png")!,
                                                    UIImage(named: "frame-16.png")!,
                                                    UIImage(named: "frame-17.png")!,
                                                    UIImage(named: "frame-18.png")!,
                                                    UIImage(named: "frame-19.png")!,
                                                    UIImage(named: "frame-20.png")!,
                                                    UIImage(named: "frame-21.png")!,
                                                    UIImage(named: "frame-22.png")!,
                                                    UIImage(named: "frame-23.png")!,
                                                    UIImage(named: "frame-24.png")!,
                                                    UIImage(named: "frame-25.png")!,
                                                    UIImage(named: "frame-26.png")!,
                                                    UIImage(named: "frame-27.png")!,
                                                    UIImage(named: "frame-28.png")!,
                                                    UIImage(named: "frame-29.png")!) as? [UIImage]
        
        animatedImageView.animationDuration = 9
        animatedImageView.animationRepeatCount = 0
        animatedImageView.startAnimating()
        circle.addSubview(animatedImageView)
        circle.center = CGPoint(x: UIScreen.main.bounds.size.width/2, y: UIScreen.main.bounds.size.height/2)
        
        self.view.addSubview(circle)
        self.view.addSubview(loadingCircle)
        self.view.bringSubviewToFront(circle)
        
        
    }
    func hideLoadingMode()
    {
        OperationQueue.main.addOperation {
            self.loadingCircle.removeFromSuperview()
            self.circle.removeFromSuperview()
        }
    }
}
