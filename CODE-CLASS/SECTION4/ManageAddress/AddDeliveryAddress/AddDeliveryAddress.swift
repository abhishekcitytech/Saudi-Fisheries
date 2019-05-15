//
//  AddDeliveryAddress.swift
//  Saudi Fisheries
//
//  Created by Sandipan on 13/03/19.
//  Copyright © 2019 SANDIPAN. All rights reserved.
//

import UIKit

class AddDeliveryAddress: UIViewController,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource
{
    var loadingCircle = UIView()
    var circle = UIView()
    
    @IBOutlet var view1: UIView!
    
    @IBOutlet var txtFirstname: UITextField!
    @IBOutlet var txtLastname: UITextField!
    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var txtAddress1: UITextField!
    @IBOutlet var txtAddress2: UITextField!
    @IBOutlet var txtCountry: UITextField!
    @IBOutlet var txtStateProvience: UITextField!
    @IBOutlet var txtCity: UITextField!
    @IBOutlet var txtZipcode: UITextField!
    @IBOutlet var txtMobileno: UITextField!
    @IBOutlet var txtFaxno: UITextField!
   
    @IBOutlet var btnSave: UIButton!
    
    var arrMCountries = NSMutableArray()
    var arrMStateProvinece = NSMutableArray()
    
    var strcountryValue = String()
    var strstateprovienceValue = String()
    
    var strcountryText = String()
    var strstateprovienceText = String()
    
    var vwCountry = UIView()
    var PickerCountry: UIPickerView!
    
    var vwSateProvience = UIView()
    var PickerSateProvience: UIPickerView!
    
    
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
        
        var  strCustomerid = String()
        var  strCustomeremail = String()
        var  strCustomermobileno = String()
        if UserDefaults.standard.value(forKey: "RegisteredUserDetails") == nil{
            print("emplty")
            strCustomerid = String(format: "%@", "")
        }
        else{
            let dicUser = UserDefaults.standard.value(forKey: "RegisteredUserDetails") as! NSMutableDictionary
            //print(dicUser)
            strCustomerid = String(format: "%@", dicUser.value(forKey: "id") as! CVarArg)
            strCustomeremail = String(format: "%@", dicUser.value(forKey: "email") as! CVarArg)
            strCustomermobileno = String(format: "%@", dicUser.value(forKey: "register_mobilenumber") as! CVarArg)
        }
        
        txtEmail.text = strCustomeremail
        txtMobileno.text = strCustomermobileno
    }

    // MARK: - pressBack method
    @IBAction func pressBack(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - pressSave method
    @IBAction func pressSave(_ sender: Any)
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
        else if txtAddress1.text == "" || txtAddress2.text == ""
        {
            let uiAlert = UIAlertController(title: "", message: "Please enter address / street", preferredStyle: UIAlertController.Style.alert)
            self.present(uiAlert, animated: true, completion: nil)
            uiAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                print("Click of default button")
            }))
        }
        else if txtCountry.text == ""
        {
            let uiAlert = UIAlertController(title: "", message: "Please choose country", preferredStyle: UIAlertController.Style.alert)
            self.present(uiAlert, animated: true, completion: nil)
            uiAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                print("Click of default button")
            }))
        }
        else if txtStateProvience.text == ""
        {
            let uiAlert = UIAlertController(title: "", message: "Please choose state / provience", preferredStyle: UIAlertController.Style.alert)
            self.present(uiAlert, animated: true, completion: nil)
            uiAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                print("Click of default button")
            }))
        }
        else if txtCity.text == ""
        {
            let uiAlert = UIAlertController(title: "", message: "Please enetr city", preferredStyle: UIAlertController.Style.alert)
            self.present(uiAlert, animated: true, completion: nil)
            uiAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                print("Click of default button")
            }))
        }
        else if txtZipcode.text == ""
        {
            let uiAlert = UIAlertController(title: "", message: "Please enter zipcode", preferredStyle: UIAlertController.Style.alert)
            self.present(uiAlert, animated: true, completion: nil)
            uiAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                print("Click of default button")
            }))
        }
        else if txtMobileno.text == ""
        {
            let uiAlert = UIAlertController(title: "", message: "Please enter mobile no.", preferredStyle: UIAlertController.Style.alert)
            self.present(uiAlert, animated: true, completion: nil)
            uiAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                print("Click of default button")
            }))
        }
        else
        {
            self.postNewShippingAddress(strCountryId: strcountryValue, strStateProvinceId: strstateprovienceValue)
        }
    }
    
    // MARK: - Textfield Delegate Method
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        if textField.isEqual(txtCountry)
        {
            txtCountry.resignFirstResponder()
        }
        else if textField.isEqual(txtStateProvience)
        {
            txtStateProvience.resignFirstResponder()
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField)
    {
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool
    {
        if textField.isEqual(txtCountry)
        {
            txtCountry.resignFirstResponder()
            self.getCountryList()
        }
        else if textField.isEqual(txtStateProvience)
        {
            txtStateProvience.resignFirstResponder()
            if strcountryValue == ""
            {
                let uiAlert = UIAlertController(title: "", message: "Please choose your country", preferredStyle: UIAlertController.Style.alert)
                self.present(uiAlert, animated: true, completion: nil)
                uiAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                    print("Click of default button")
                }))
            }
            else {
                self.getStateProvineceList(strCId: strcountryValue)
            }
            
        }
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
    
    //MARK: - viewPickerCountry method
    func viewPickerCountry()
    {
        self.vwCountry.removeFromSuperview()
        txtCountry.resignFirstResponder()
        
        self.vwCountry = UIView(frame: CGRect(x: 0, y:  UIScreen.main.bounds.size.height - 200, width: UIScreen.main.bounds.size.width, height: 200))
        self.vwCountry.backgroundColor = UIColor(red: 231/255, green: 235/255, blue: 245/255, alpha: 1.0)
        
        let buttonDone = UIButton(frame: CGRect(x: UIScreen.main.bounds.size.width-80, y: 0, width: 80, height: 30))
        buttonDone.backgroundColor = UIColor.clear
        buttonDone.tag=1
        buttonDone.setTitle("Done", for: .normal)
        buttonDone.setTitleColor(UIColor(red: 78/255, green: 129/255, blue: 237/255, alpha: 1.0), for: .normal)
        buttonDone.titleLabel?.font = UIFont(name: "Dubai-Regular", size: 18.0)!
        buttonDone.addTarget(self, action: #selector(pressDoneCountry), for: .touchUpInside)
        self.vwCountry.addSubview(buttonDone)
        
        PickerCountry = UIPickerView (frame: CGRect(x: 0, y:buttonDone.frame.maxY, width: UIScreen.main.bounds.size.width, height:170))
        PickerCountry.dataSource = self
        PickerCountry.delegate = self
        PickerCountry.backgroundColor = UIColor.white
        self.vwCountry.addSubview(PickerCountry)
        self.view.addSubview(self.vwCountry)
        
    }
    @objc func pressDoneCountry()
    {
        txtCountry.text = strcountryText
        self.vwCountry.removeFromSuperview()
    }
    
    //MARK: - viewStateProvience method
    func viewPickerStateProvience()
    {
        self.vwSateProvience.removeFromSuperview()
        txtStateProvience.resignFirstResponder()
        
        self.vwSateProvience = UIView(frame: CGRect(x: 0, y:  UIScreen.main.bounds.size.height - 200, width: UIScreen.main.bounds.size.width, height: 200))
        self.vwSateProvience.backgroundColor = UIColor(red: 231/255, green: 235/255, blue: 245/255, alpha: 1.0)
        
        let buttonDone = UIButton(frame: CGRect(x: UIScreen.main.bounds.size.width-80, y: 0, width: 80, height: 30))
        buttonDone.backgroundColor = UIColor.clear
        buttonDone.tag=1
        buttonDone.setTitle("Done", for: .normal)
        buttonDone.setTitleColor(UIColor(red: 78/255, green: 129/255, blue: 237/255, alpha: 1.0), for: .normal)
        buttonDone.titleLabel?.font = UIFont(name: "Dubai-Regular", size: 18.0)!
        buttonDone.addTarget(self, action: #selector(pressDoneStateProvience), for: .touchUpInside)
        self.vwSateProvience.addSubview(buttonDone)
        
        PickerSateProvience = UIPickerView (frame: CGRect(x: 0, y:buttonDone.frame.maxY, width: UIScreen.main.bounds.size.width, height:170))
        PickerSateProvience.dataSource = self
        PickerSateProvience.delegate = self
        PickerSateProvience.backgroundColor = UIColor.white
        self.vwSateProvience.addSubview(PickerSateProvience)
        self.view.addSubview(self.vwSateProvience)
        
    }
    @objc func pressDoneStateProvience()
    {
        txtStateProvience.text = strstateprovienceText
        self.vwSateProvience.removeFromSuperview()
    }
    
    
    // MARK: - PickerView Delegates Method
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        if pickerView == PickerCountry
        {
            return arrMCountries.count
        }
        else if pickerView == PickerSateProvience
        {
            return arrMStateProvinece.count
        }
        else{
            return 0
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        if pickerView == PickerCountry
        {
            let   dicTemp = arrMCountries.object(at: row) as! NSDictionary
            let str =  String(format: "%@", dicTemp.value(forKey: "Text")as! CVarArg) as NSString
            return str as String
        }
        else if pickerView == PickerSateProvience
        {
            let   dicTemp = arrMStateProvinece.object(at: row) as! NSDictionary
            let str =  String(format: "%@", dicTemp.value(forKey: "Text")as! CVarArg) as NSString
            return str as String
        }
        else{
            return ""
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if pickerView == PickerCountry
        {
            let   dicTemp = arrMCountries.object(at: row) as! NSDictionary
            let str1 =  String(format: "%@", dicTemp.value(forKey: "Text")as! CVarArg) as NSString
            let str2 =  String(format: "%@", dicTemp.value(forKey: "Value")as! CVarArg) as NSString
            strcountryText = str1 as String
            strcountryValue = str2 as String
            print("strcountryText :%@",strcountryText)
            print("strcountryValue :%@",strcountryValue)
        }
        else if pickerView == PickerSateProvience
        {
            let   dicTemp = arrMStateProvinece.object(at: row) as! NSDictionary
            let str1 =  String(format: "%@", dicTemp.value(forKey: "Text")as! CVarArg) as NSString
            let str2 =  String(format: "%@", dicTemp.value(forKey: "Value")as! CVarArg) as NSString
            strstateprovienceText = str1 as String
            strstateprovienceValue = str2 as String
            print("strstateprovienceText :%@",strstateprovienceText)
            print("strstateprovienceValue :%@",strstateprovienceValue)
        }
        else{
        }
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
    
    
    //MARK: - get CountryList method
    func getCountryList()
    {
        self.showLoadingMode()
        let strapikey = String(format: "%@ %@", UserDefaults.standard.string(forKey: "token_type")!, UserDefaults.standard.string(forKey: "access_token")!)
        let strconnurl = String(format: "%@%@", Constants.conn.ConnUrl, "/api/countries")
        let request = NSMutableURLRequest(url: NSURL(string: strconnurl)! as URL)
        request.httpMethod = "GET"
        request.setValue(strapikey, forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
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
                    //print("json --->",json)
                    
                    let dictemp = NSMutableDictionary(dictionary: json)
                    
                    let Status = String(format: "%@", dictemp.value(forKey: "Status") as! CVarArg)
                    let ResponseMessage = String(format: "%@", dictemp.value(forKey: "ResponseMessage") as! CVarArg)
    
                    let arrMc = dictemp.value(forKey: "Data") as! NSArray
                    self.arrMCountries = NSMutableArray(array: arrMc)
                    print("arrMCountries --->",self.arrMCountries)
                    
                    OperationQueue.main.addOperation {
                        self.viewPickerCountry()
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
    
    //MARK: - get StateProvineceList method
    func getStateProvineceList(strCId:String)
    {
        self.showLoadingMode()
        let strapikey = String(format: "%@ %@", UserDefaults.standard.string(forKey: "token_type")!, UserDefaults.standard.string(forKey: "access_token")!)
        let strconnurl = String(format: "%@%@%@", Constants.conn.ConnUrl, "/api/getstatebycountryId/",strCId)
        let request = NSMutableURLRequest(url: NSURL(string: strconnurl)! as URL)
        request.httpMethod = "GET"
        request.setValue(strapikey, forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
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
                    //print("json --->",json)
                    
                    let dictemp = NSMutableDictionary(dictionary: json)
                    
                    let Status = String(format: "%@", dictemp.value(forKey: "Status") as! CVarArg)
                    let ResponseMessage = String(format: "%@", dictemp.value(forKey: "ResponseMessage") as! CVarArg)
                    
                    let arrMs = dictemp.value(forKey: "Data") as! NSArray
                    self.arrMStateProvinece = NSMutableArray(array: arrMs)
                    print("arrMStateProvinece --->",self.arrMStateProvinece)
                    
                    OperationQueue.main.addOperation {
                        self.viewPickerStateProvience()
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
    
    //MARK: - post NewShippingAddress method
    func postNewShippingAddress(strCountryId:String,strStateProvinceId:String)
    {
        self.showLoadingMode()
        
        var  strCustomerid = String()
        if UserDefaults.standard.value(forKey: "RegisteredUserDetails") == nil{
            print("emplty")
            strCustomerid = String(format: "%@", "")
        }
        else{
            let dicUser = UserDefaults.standard.value(forKey: "RegisteredUserDetails") as! NSMutableDictionary
            //print(dicUser)
            strCustomerid = String(format: "%@", dicUser.value(forKey: "id") as! CVarArg)
        }
        
        let strSlectedStoreID = String(format: "%@", UserDefaults.standard.string(forKey: "SelectedStoreID")!)
        
        let dicShippingNewAddress:NSMutableDictionary? = [
            "FirstName": txtFirstname.text as Any,
            "LastName": txtLastname.text as Any,
            "Email": txtEmail.text as Any,
            "Company": "",
            "CountryId": strCountryId,
            "CountryName": txtCountry.text as Any,
            "StateProvinceId": strStateProvinceId,
            "StateProvinceName": txtStateProvience.text as Any,
            "City": txtCity.text as Any,
            "Address1": txtAddress1.text as Any,
            "Address2": txtAddress2.text as Any,
            "ZipPostalCode": txtZipcode.text as Any,
            "PhoneNumber": txtMobileno.text as Any,
            "FaxNumber": txtFaxno.text as Any,
            ];
        
        
        let dicPostOverAll:NSMutableDictionary? = ["ShippingNewAddress" : dicShippingNewAddress as Any];
        
        let strapikey = String(format: "%@ %@", UserDefaults.standard.string(forKey: "token_type")!, UserDefaults.standard.string(forKey: "access_token")!)
        let strconnurl = String(format: "%@%@%@?storeId=%@", Constants.conn.ConnUrl, "/api/newshippingaddress/",strCustomerid,strSlectedStoreID)
        let request = NSMutableURLRequest(url: NSURL(string: strconnurl)! as URL)
        request.httpMethod = "POST"
        request.setValue(strapikey, forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let jsonData : NSData = try! JSONSerialization.data(withJSONObject: dicPostOverAll as Any) as NSData
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
                    
                    print("json %@",json)
                    
                    let dictemp = NSMutableDictionary(dictionary: json)
                    let Status = String(format: "%@", dictemp.value(forKey: "Status") as! CVarArg)
                    let ResponseMessage = String(format: "%@", dictemp.value(forKey: "ResponseMessage") as! CVarArg)
                    
                    OperationQueue.main.addOperation {
                        if Status == "1"{
                            let uiAlert = UIAlertController(title: "", message: "New address saved succesfully.", preferredStyle: UIAlertController.Style.alert)
                            self.present(uiAlert, animated: true, completion: nil)
                            uiAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                                self.navigationController?.popViewController(animated: true)
                            }))
                        }
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
}
