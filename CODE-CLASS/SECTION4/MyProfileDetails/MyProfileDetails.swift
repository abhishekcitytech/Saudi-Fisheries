//
//  MyProfileDetails.swift
//  Saudi Fisheries
//
//  Created by Sandipan on 29/01/19.
//  Copyright © 2019 SANDIPAN. All rights reserved.
//

import UIKit

class MyProfileDetails: UIViewController, UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate
{
    var loadingCircle = UIView()
    var circle = UIView()
    

    @IBOutlet var view1: UIView!

    @IBOutlet var imgvProfile: UIImageView!
    @IBOutlet var btnCamera: UIButton!
    @IBOutlet var txtFName: UITextField!
    @IBOutlet var txtLName: UITextField!
    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var txtMobile: UITextField!
    
    @IBOutlet var btnEdit: UIButton!
    @IBOutlet var btnSave: UIButton!
    
    let picker = UIImagePickerController()
    var base64String = String()
    
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
        
        imgvProfile.layer.cornerRadius = 50
        imgvProfile.layer.masksToBounds = true
        
        btnCamera.isUserInteractionEnabled = false
        txtFName.isUserInteractionEnabled = false
        txtLName.isUserInteractionEnabled = false
        txtEmail.isUserInteractionEnabled = false
        txtMobile.isUserInteractionEnabled = false
        btnSave.isHidden = true
        
        let dicUser = UserDefaults.standard.value(forKey: "RegisteredUserDetails") as! NSMutableDictionary
        print("dicUser >>>>> %@",dicUser)
        
        let  strfirst_name = String(format: "%@", dicUser.value(forKey: "first_name") as! CVarArg)
        let  strlast_name = String(format: "%@", dicUser.value(forKey: "last_name") as! CVarArg)
        let  stremail = String(format: "%@", dicUser.value(forKey: "email") as! CVarArg)
        let  strregister_mobilenumber = String(format: "%@", dicUser.value(forKey: "register_mobilenumber") as! CVarArg)
        let  strprofilepicurl = String(format: "%@", dicUser.value(forKey: "profile-pic-url") as! CVarArg)
        if strprofilepicurl == ""
        {
            //Default Image
            imgvProfile.image = UIImage(named: "userProfile")
        }
        else{
            //Uploaded Image
            imgvProfile.imageFromURL(urlString: strprofilepicurl)
            //imgvProfile.image = UIImage(named: "userProfile")
        }
        
        txtEmail.text = stremail
        txtMobile.text = strregister_mobilenumber
        txtFName.text = String(format: "%@",strfirst_name)
        txtLName.text = String(format: "%@",strlast_name)
        
    }

    // MARK: - pressBack method
    @IBAction func pressBack(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - pressEdit method
    @IBAction func pressEdit(_ sender: Any)
    {
        btnCamera.isUserInteractionEnabled = true
        txtFName.isUserInteractionEnabled = true
        txtLName.isUserInteractionEnabled = true
        txtEmail.isUserInteractionEnabled = true
        txtMobile.isUserInteractionEnabled = true
        btnSave.isHidden = false
        btnEdit.isHidden = true
    }
    
    // MARK: - pressSave method
    @IBAction func pressSave(_ sender: Any)
    {
        if txtFName.text == ""
        {
            let uiAlert = UIAlertController(title: "", message: "Please enter firstname", preferredStyle: UIAlertController.Style.alert)
            self.present(uiAlert, animated: true, completion: nil)
            uiAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                print("Click of default button")
            }))
        }
        else if txtLName.text == ""
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
        else if txtMobile.text == ""
        {
            let uiAlert = UIAlertController(title: "", message: "Please enter mobilenumber", preferredStyle: UIAlertController.Style.alert)
            self.present(uiAlert, animated: true, completion: nil)
            uiAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                print("Click of default button")
            }))
        }
        else
        {
            self.postUpdateProfile(strFirstname: txtFName.text!, strLastname: txtLName.text!, strEmail: txtEmail.text!, strMobilenumber: txtMobile.text!,strImage: base64String)
        }
    }
    
    // MARK: - pressCamera method
    @IBAction func pressCamera(_ sender: Any)
    {
        let alert:UIAlertController=UIAlertController(title: "Choose Image", message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        let cameraAction = UIAlertAction(title: "Camera", style: UIAlertAction.Style.default){
            UIAlertAction in
            self.openCamera()
        }
        let gallaryAction = UIAlertAction(title: "Gallery", style: UIAlertAction.Style.default){
            UIAlertAction in
            self.openGallary()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel){
            UIAlertAction in
        }
        picker.delegate = self
        alert.addAction(cameraAction)
        alert.addAction(gallaryAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - UIImagePickerController Delegate method
    func openCamera()
    {
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera)){
            picker.sourceType = UIImagePickerController.SourceType.camera
            self .present(picker, animated: true, completion: nil)
        }
        else
        {
            let alertController = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            let action1 = UIAlertAction(title: "Ok", style: .default) { (action:UIAlertAction) in
                print("You've pressed default");
            }
            alertController.addAction(action1)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    func openGallary()
    {
        picker.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(picker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        imgvProfile.layer.cornerRadius = 50
        imgvProfile.layer.masksToBounds = true
        self.imgvProfile.image = image
        
        //let pickedImage = resizeImage(image: image, targetSize: CGSize(width: 200, height: 200)) as UIImage
        let imageData:Data =  image.jpegData(compressionQuality: 0)!
        base64String = (imageData.base64EncodedString() as NSString) as String
        print("base64String >>>%@",base64String)
        
        /*Swift Dictionary named “info”.
         We have to unpack it from there with a key asking for what media information we want.
         We just want the image, so that is what we ask for.  For reference, the available options are:
         UIImagePickerControllerMediaType
         UIImagePickerControllerOriginalImage
         UIImagePickerControllerEditedImage
         UIImagePickerControllerCropRect
         UIImagePickerControllerMediaURL
         UIImagePickerControllerReferenceURL
         UIImagePickerControllerMediaMetadata*/
        
        dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        dismiss(animated: true, completion:nil)
    }
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage
    {
        let size = image.size
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize =  CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize =  CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        // This is the rect that we've calculated out and this is what is actually used below
        let rect =  CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
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
    
    
    //MARK: - post Update Profile method
    func postUpdateProfile(strFirstname:String,strLastname:String,strEmail:String,strMobilenumber:String,strImage:String)
    {
        self.showLoadingMode()
        
        var  strCustomerid = String()
        var  strCustomermobilenumber = String()
        if UserDefaults.standard.value(forKey: "RegisteredUserDetails") == nil{
            print("emplty")
            strCustomerid = String(format: "%@", "")
            strCustomermobilenumber = String(format: "%@", "")
        }
        else{
            let dicUser = UserDefaults.standard.value(forKey: "RegisteredUserDetails") as! NSMutableDictionary
            //print(dicUser)
            strCustomerid = String(format: "%@", dicUser.value(forKey: "id") as! CVarArg)
            strCustomermobilenumber = String(format: "%@", dicUser.value(forKey: "register_mobilenumber") as! CVarArg)
        }
        
        let strSlectedStoreID = String(format: "%@", UserDefaults.standard.string(forKey: "SelectedStoreID")!)
        
        let diccustomer:NSMutableDictionary? = ["first_name" : strFirstname,"last_name" : strLastname,"register_mobilenumber" : strMobilenumber,"email":strEmail,"registered_in_store_id" : strSlectedStoreID,"upload-profile-pic":strImage];
        
        let dicPostOverAll:NSMutableDictionary? = ["customer" : diccustomer as Any];
        
        let strapikey = String(format: "%@ %@", UserDefaults.standard.string(forKey: "token_type")!, UserDefaults.standard.string(forKey: "access_token")!)
        let strconnurl = String(format: "%@%@%@", Constants.conn.ConnUrl, "/api/customers/",strCustomerid)
        let request = NSMutableURLRequest(url: NSURL(string: strconnurl)! as URL)
        request.httpMethod = "PUT"
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
                    
                    print("json >>>>%@",json)
                    let dictemp = NSMutableDictionary(dictionary: json)
                    let Status = String(format: "%@", dictemp.value(forKey: "Status") as! CVarArg)
                    let ResponseMessage = String(format: "%@", dictemp.value(forKey: "ResponseMessage") as! CVarArg)
                    
                    OperationQueue.main.addOperation {
                        
                        if Status == "1"{
                            
                            
                            self.btnCamera.isUserInteractionEnabled = false
                            self.txtFName.isUserInteractionEnabled = false
                            self.txtLName.isUserInteractionEnabled = false
                            self.txtEmail.isUserInteractionEnabled = false
                            self.txtMobile.isUserInteractionEnabled = false
                            self.btnSave.isHidden = true
                            self.btnEdit.isHidden = false
                            
                            let dictemp = UserDefaults.standard.value(forKey: "RegisteredUserDetails") as!NSDictionary
                            print("main  -> \(dictemp)")
                            let myMutableDict: NSMutableDictionary = NSMutableDictionary(dictionary: dictemp)
                            myMutableDict.setValue(self.txtFName.text!, forKey: "first_name")
                            myMutableDict.setValue(self.txtLName.text!, forKey: "last_name")
                            myMutableDict.setValue(self.txtMobile.text!, forKey: "register_mobilenumber")
                            myMutableDict.setValue(self.txtEmail.text!, forKey: "email")
                            
                            UserDefaults.standard.set(myMutableDict, forKey: "RegisteredUserDetails")
                            UserDefaults.standard.synchronize()
                            
                            let dictemp1 = UserDefaults.standard.value(forKey: "RegisteredUserDetails") as!NSDictionary
                            print(" Updated main  -> \(dictemp1)")
                            
                            let uiAlert = UIAlertController(title: "", message: "Profile has been updated succesfully", preferredStyle: UIAlertController.Style.alert)
                            self.present(uiAlert, animated: true, completion: nil)
                            uiAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                                print("Click of default button")
                            }))
                        }
                        else
                        {
                            let uiAlert = UIAlertController(title: "", message: ResponseMessage, preferredStyle: UIAlertController.Style.alert)
                            self.present(uiAlert, animated: true, completion: nil)
                            uiAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                                print("Click of default button")
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
