//
//  login.swift
//  Saudi Fisheries
//
//  Created by Sandipan on 18/01/19.
//  Copyright © 2019 SANDIPAN. All rights reserved.
//

import UIKit

class login: UIViewController,UITextFieldDelegate
{
    var loadingCircle = UIView()
    var circle = UIView()
    
    
    @IBOutlet var imgvCompanyLogo: UIImageView!
    
    @IBOutlet var viewBox: UIView!
    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var txtPassword: UITextField!
    
    @IBOutlet var btnSignIn: UIButton!
    @IBOutlet var btnForgotPassword: UIButton!
    @IBOutlet var btnRegister: UIButton!
    
    
    var viewFPControlPop = UIControl()
    var viewFPPop = UIView()
    var txtFP1Pop = UITextField()
    var btnFPCancelPop = UIButton()
    var btnFPSavePop = UIButton()
    
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
        
        viewBox.layer.borderColor = UIColor.lightGray.cgColor
        viewBox.layer.borderWidth = 1.0
        viewBox.layer.cornerRadius = 0.0
        viewBox.layer.masksToBounds = true
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
    }
    
    //MARK: - press Back Method
    @IBAction func pressBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - press SignIn Method
    @IBAction func pressSignIn(_ sender: Any)
    {
        //let myAppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        
        if txtEmail.text == ""
        {
            let uiAlert = UIAlertController(title: "", message: "Please enter firstname", preferredStyle: UIAlertController.Style.alert)
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
        else
        {
            self.postLogin()
        }
    }
    func postLogin()
    {
        self.showLoadingMode()
        
        let dicPostRegistration:NSMutableDictionary? = ["email" : txtEmail.text!,
                                                        "password" : txtPassword.text!,
                                                        ];
        print("dicPostRegistration ---->>>>>",dicPostRegistration as Any)
        
        let dicPostOverAll:NSMutableDictionary? = ["login" : dicPostRegistration as Any];
        print("dicPostOverAll ---->>>>>",dicPostOverAll as Any)
        
        let strapikey = String(format: "%@ %@", UserDefaults.standard.string(forKey: "token_type")!, UserDefaults.standard.string(forKey: "access_token")!)
        let strconnurl = String(format: "%@%@", Constants.conn.ConnUrl, "/api/customer/login")
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
    
    //MARK: - press ForgotPassword Method
    @IBAction func pressForgotPassword(_ sender: Any)
    {
        self.createForgotPasswordPopUp()
    }
    
    //MARK: - press Register Method
    @IBAction func pressRegister(_ sender: Any)
    {
        let screenSize = UIScreen.main.bounds
        if (screenSize.height == 568.0){
        }
        else if (screenSize.height == 480.0){
        }
        else if(screenSize.height == 667.0){
            let storyBoard = UIStoryboard(name: "SectionFive6S", bundle: nil)
            let Registration = storyBoard.instantiateViewController(withIdentifier: "Registration") as! Registration
            Registration.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(Registration, animated: true)
        }
        else if(screenSize.height == 736.0){
            let storyBoard = UIStoryboard(name: "SectionFive6SPlus", bundle: nil)
            let Registration = storyBoard.instantiateViewController(withIdentifier: "Registration") as! Registration
            Registration.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(Registration, animated: true)
        }
        else if(screenSize.height == 812.0){
            let storyBoard = UIStoryboard(name: "SectionFiveXS", bundle: nil)
            let Registration = storyBoard.instantiateViewController(withIdentifier: "Registration") as! Registration
            Registration.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(Registration, animated: true)
        }
        else{
            let storyBoard = UIStoryboard(name: "SectionFiveXSMAX", bundle: nil)
            let Registration = storyBoard.instantiateViewController(withIdentifier: "Registration") as! Registration
            Registration.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(Registration, animated: true)
        }
    }
    
    // MARK: - ForgotPassword PopUp View method
    func createForgotPasswordPopUp() -> Void
    {
        self.viewFPControlPop = UIControl(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height:UIScreen.main.bounds.height))
        self.viewFPControlPop.backgroundColor=UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.7)
        
        viewFPPop = UIView(frame: CGRect(x: 15, y: 0, width: self.viewFPControlPop.frame.size.width - 30 , height:164))
        viewFPPop.center = self.viewFPControlPop.center
        viewFPPop.backgroundColor = UIColor.white
        viewFPPop.layer.cornerRadius = 4.0
        viewFPPop.layer.masksToBounds = true
        self.viewFPControlPop.addSubview(viewFPPop)
        
        //--------- Text Input ----------------
        txtFP1Pop =  UITextField(frame: CGRect(x: 15, y: 15, width: viewFPPop.frame.width-30, height: 44))
        txtFP1Pop.textAlignment = NSTextAlignment.left
        txtFP1Pop.backgroundColor = UIColor.white
        txtFP1Pop.delegate=self
        txtFP1Pop.placeholder="  Email address"
        txtFP1Pop.keyboardType = UIKeyboardType.emailAddress
        txtFP1Pop.textColor=UIColor.darkGray
        txtFP1Pop.isSecureTextEntry=true
        txtFP1Pop.font = UIFont(name: "Dubai-Regular", size: 16.0)!
        txtFP1Pop.backgroundColor = UIColor.white
        txtFP1Pop.layer.cornerRadius = 4.0
        txtFP1Pop.layer.borderWidth = 1
        txtFP1Pop.layer.borderColor = UIColor(red: 214/255, green: 214/255, blue: 214/255, alpha: 1.0).cgColor
        txtFP1Pop.layer.masksToBounds = true
        viewFPPop.addSubview(txtFP1Pop)
        
        //--------- Cancel & Save ----------------
        btnFPCancelPop = UIButton(frame: CGRect(x: 0, y: viewFPPop.frame.size.height-50, width: viewFPPop.frame.size.width / 2, height: 50))
        btnFPCancelPop.setTitle("Cancel", for: .normal)
        btnFPCancelPop.setTitleColor(UIColor.red, for: .normal)
        btnFPCancelPop.titleLabel?.font = UIFont(name: "Dubai-Medium", size: 18.0)!
        btnFPCancelPop.tag=1
        btnFPCancelPop.addTarget(self, action: #selector(pressCancelPop), for: .touchUpInside)
        btnFPCancelPop.layer.borderWidth = 1.0
        btnFPCancelPop.layer.borderColor = UIColor.lightGray.cgColor
        btnFPCancelPop.layer.cornerRadius = 0.0
        btnFPCancelPop.layer.masksToBounds = true
        btnFPCancelPop.backgroundColor = UIColor(red: 239.0/255, green: 239.0/255, blue: 244.0/255, alpha: 1.0)
        viewFPPop.addSubview(btnFPCancelPop)
        
        btnFPSavePop = UIButton(frame: CGRect(x: btnFPCancelPop.frame.maxX, y: viewFPPop.frame.size.height-50, width: viewFPPop.frame.size.width / 2, height: 50))
        btnFPSavePop.setTitle("Submit", for: .normal)
        btnFPSavePop.setTitleColor(UIColor(red: 0/255, green: 183/255, blue: 178/255, alpha: 1.0), for: .normal)
        btnFPSavePop.titleLabel?.font = UIFont(name: "Dubai-Medium", size: 18.0)!
        btnFPSavePop.tag=2
        btnFPSavePop.addTarget(self, action: #selector(pressSavePop), for: .touchUpInside)
        btnFPSavePop.layer.borderWidth = 1.0
        btnFPSavePop.layer.borderColor = UIColor.lightGray.cgColor
        btnFPSavePop.layer.cornerRadius = 0.0
        btnFPSavePop.layer.masksToBounds = true
        btnFPSavePop.backgroundColor = UIColor(red: 239.0/255, green: 239.0/255, blue: 244.0/255, alpha: 1.0)
        viewFPPop.addSubview(btnFPSavePop)
        
        self.view.addSubview(self.viewFPControlPop)
    }
    @objc func pressCancelPop() -> Void
    {
        self.viewFPControlPop.removeFromSuperview()
    }
    @objc func pressSavePop() -> Void
    {
        self.viewFPControlPop.removeFromSuperview()
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
