//
//  MoreTab.swift
//  Saudi Fisheries
//
//  Created by Sandipan on 18/01/19.
//  Copyright © 2019 SANDIPAN. All rights reserved.
//

import UIKit

class MoreTab: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate , UITextViewDelegate
{
    var loadingCircle = UIView()
    var circle = UIView()
    
    
    @IBOutlet var btnSlide: UIButton!
    
    /*var viewHELPControlPop = UIControl()
    var viewHELPPop = UIView()
    var txtHELPSubject = UITextField()
    var txtvHELPNote = UITextView()
    var btnHELPCancelPop = UIButton()
    var btnHELPSavePop = UIButton()*/
    
    var viewCPControlPop = UIControl()
    var viewCPPop = UIView()
    var txtCP2Pop = UITextField()
    var txtCP3Pop = UITextField()
    var btnCPCancelPop = UIButton()
    var btnCPSavePop = UIButton()
    
    let cellReuseIdentifier = "cell"
    @IBOutlet var tabvMore: UITableView!
    
    var arrMMore = NSMutableArray()
    

    // MARK: - viewWillAppear Method
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - viewDidAppear Method
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        let dicUser = UserDefaults.standard.value(forKey: "RegisteredUserDetails") as! NSMutableDictionary
        print(dicUser)
    }
    
    // MARK: - viewDidLoad method
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //Do any additional setup after loading the view.
        //let myAppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        arrMMore = ["My Profile","My Orders","My Wishlist","Store Location","Manage Address","Chnage Password","Preferred language","About Us","Contact Us"]
        
        tabvMore.backgroundView=nil
        tabvMore.backgroundColor=UIColor.clear
        tabvMore.separatorColor=UIColor.clear
        tabvMore.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
    }
    
    // MARK: - Slide method
    @IBAction func pressSlide(_ sender: Any)
    {
        var obj = Slidemenu()
        let screenSize = UIScreen.main.bounds
        if (screenSize.height == 568.0){
        }
        else if (screenSize.height == 480.0){
        }
        else if(screenSize.height == 667.0){
            let storyBoard = UIStoryboard(name: "SectionFive6S", bundle: nil)
            obj = storyBoard.instantiateViewController(withIdentifier: "Slidemenu") as! Slidemenu
        }
        else if(screenSize.height == 736.0){
            let storyBoard = UIStoryboard(name: "SectionFive6SPlus", bundle: nil)
            obj = storyBoard.instantiateViewController(withIdentifier: "Slidemenu") as! Slidemenu
        }
        else if(screenSize.height == 812.0){
            let storyBoard = UIStoryboard(name: "SectionFiveXS", bundle: nil)
            obj = storyBoard.instantiateViewController(withIdentifier: "Slidemenu") as! Slidemenu
        }
        else{
            let storyBoard = UIStoryboard(name: "SectionFiveXSMAX", bundle: nil)
            obj = storyBoard.instantiateViewController(withIdentifier: "Slidemenu") as! Slidemenu
        }
        obj.view.frame=CGRect(x: 0, y: 0, width: -UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        self.addChild(obj)
        self.view.addSubview(obj.view)
        obj.didMove(toParent: self)
        UIView.animate(withDuration: 0.4, animations: {
            obj.view.frame=CGRect(x:0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        }, completion: nil)
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
    
    
    // MARK: - tableView delegate & datasource Method
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrMMore.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1.0
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let headerView = UIView()
        headerView.frame=CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 1.0)
        headerView.backgroundColor = UIColor.clear
        return headerView;
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1.0
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView?
    {
        let footerView = UIView()
        footerView.frame=CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 1.0)
        footerView.backgroundColor = UIColor.clear
        return footerView
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier:cellReuseIdentifier)
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.accessoryType = UITableViewCell.AccessoryType.none
        cell.backgroundColor=UIColor.white
        cell.clearsContextBeforeDrawing = true
        cell.contentView.clearsContextBeforeDrawing = true
        
        let label = UILabel(frame: CGRect(x: 15, y: 0, width: tableView.frame.size.width, height: 44))
        label.textAlignment = .left
        label.textColor = UIColor.darkGray
        label.backgroundColor = UIColor.clear
        label.numberOfLines=1
        label.font = UIFont(name: "Dubai-Regular", size: 16.0)!
        label.text = String(format: "  %@", arrMMore[indexPath.row] as! CVarArg)
        cell.contentView.addSubview(label)
        
        /*if indexPath.row == 6
         {
         //Notification Settings
         let onColor  = UIColor(red: 0/255, green: 183/255, blue: 178/255, alpha: 1.0)
         let offColor = UIColor.lightGray
         
         let switchOnOff = UISwitch(frame:CGRect(x: tableView.frame.size.width - 60 , y: 5, width: 0, height: 0))
         switchOnOff.addTarget(self, action: #selector(switchStateDidChange(_:)), for: .valueChanged)
         switchOnOff.setOn(true, animated: false)
         switchOnOff.onTintColor = onColor
         switchOnOff.tintColor = offColor
         switchOnOff.layer.cornerRadius = switchOnOff.frame.height / 2
         switchOnOff.backgroundColor = offColor
         cell.contentView.addSubview(switchOnOff)
         }*/
        
        if indexPath.row == 6
        {
            let items = ["English" , "عربى"]
            let segmentedControl = UISegmentedControl(items : items)
            segmentedControl.frame = CGRect(x: label.frame.maxX - 140, y: 5, width: segmentedControl.frame.size.width, height: 34);
            segmentedControl.selectedSegmentIndex = 0
            segmentedControl.addTarget(self, action: #selector(indexChanged(_:)), for: .valueChanged)
            segmentedControl.layer.cornerRadius = 4.0
            segmentedControl.backgroundColor = .white
            segmentedControl.tintColor = UIColor(red: 0/255, green: 183/255, blue: 178/255, alpha: 1.0)
            cell.contentView.addSubview(segmentedControl)
        }
        
        let labelSeparator = UILabel(frame: CGRect(x: 0, y: 43.5, width: tableView.frame.size.width, height: 0.5))
        labelSeparator.backgroundColor = UIColor.lightGray
        cell.contentView.addSubview(labelSeparator)
        
        return cell;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if indexPath.row == 0
        {
            //My Profile
            let screenSize = UIScreen.main.bounds
            if (screenSize.height == 568.0){
            }
            else if (screenSize.height == 480.0){
            }
            else if(screenSize.height == 667.0){
                let storyBoard = UIStoryboard(name: "SectionFour6S", bundle: nil)
                let MyProfileDetails = storyBoard.instantiateViewController(withIdentifier: "MyProfileDetails") as! MyProfileDetails
                self.navigationController?.pushViewController(MyProfileDetails, animated: true)
            }
            else if(screenSize.height == 736.0){
                let storyBoard = UIStoryboard(name: "SectionFour6SPlus", bundle: nil)
                let MyProfileDetails = storyBoard.instantiateViewController(withIdentifier: "MyProfileDetails") as! MyProfileDetails
                self.navigationController?.pushViewController(MyProfileDetails, animated: true)
            }
            else if(screenSize.height == 812.0){
                let storyBoard = UIStoryboard(name: "SectionFourXS", bundle: nil)
                let MyProfileDetails = storyBoard.instantiateViewController(withIdentifier: "MyProfileDetails") as! MyProfileDetails
                self.navigationController?.pushViewController(MyProfileDetails, animated: true)
            }
            else{
                let storyBoard = UIStoryboard(name: "SectionFourXSMAX", bundle: nil)
                let MyProfileDetails = storyBoard.instantiateViewController(withIdentifier: "MyProfileDetails") as! MyProfileDetails
                self.navigationController?.pushViewController(MyProfileDetails, animated: true)
            }
        }
        else if indexPath.row == 1
        {
            //My Orders
            let screenSize = UIScreen.main.bounds
            if (screenSize.height == 568.0){
            }
            else if (screenSize.height == 480.0){
            }
            else if(screenSize.height == 667.0){
                let storyBoard = UIStoryboard(name: "SectionFour6S", bundle: nil)
                let OrderHistory = storyBoard.instantiateViewController(withIdentifier: "OrderHistory") as! OrderHistory
                self.navigationController?.pushViewController(OrderHistory, animated: true)
            }
            else if(screenSize.height == 736.0){
                let storyBoard = UIStoryboard(name: "SectionFour6SPlus", bundle: nil)
                let OrderHistory = storyBoard.instantiateViewController(withIdentifier: "OrderHistory") as! OrderHistory
                self.navigationController?.pushViewController(OrderHistory, animated: true)
            }
            else if(screenSize.height == 812.0){
                let storyBoard = UIStoryboard(name: "SectionFourXS", bundle: nil)
                let OrderHistory = storyBoard.instantiateViewController(withIdentifier: "OrderHistory") as! OrderHistory
                self.navigationController?.pushViewController(OrderHistory, animated: true)
            }
            else{
                let storyBoard = UIStoryboard(name: "SectionFourXSMAX", bundle: nil)
                let OrderHistory = storyBoard.instantiateViewController(withIdentifier: "OrderHistory") as! OrderHistory
                self.navigationController?.pushViewController(OrderHistory, animated: true)
            }
        }
        else if indexPath.row == 2
        {
            //My Wishlist
            let screenSize = UIScreen.main.bounds
            if (screenSize.height == 568.0){
            }
            else if (screenSize.height == 480.0){
            }
            else if(screenSize.height == 667.0){
                let storyBoard = UIStoryboard(name: "SectionFour6S", bundle: nil)
                let MyWishlist = storyBoard.instantiateViewController(withIdentifier: "MyWishlist") as! MyWishlist
                self.navigationController?.pushViewController(MyWishlist, animated: true)
            }
            else if(screenSize.height == 736.0){
                let storyBoard = UIStoryboard(name: "SectionFour6SPlus", bundle: nil)
                let MyWishlist = storyBoard.instantiateViewController(withIdentifier: "MyWishlist") as! MyWishlist
                self.navigationController?.pushViewController(MyWishlist, animated: true)
            }
            else if(screenSize.height == 812.0){
                let storyBoard = UIStoryboard(name: "SectionFourXS", bundle: nil)
                let MyWishlist = storyBoard.instantiateViewController(withIdentifier: "MyWishlist") as! MyWishlist
                self.navigationController?.pushViewController(MyWishlist, animated: true)
            }
            else{
                let storyBoard = UIStoryboard(name: "SectionFourXSMAX", bundle: nil)
                let MyWishlist = storyBoard.instantiateViewController(withIdentifier: "MyWishlist") as! MyWishlist
                self.navigationController?.pushViewController(MyWishlist, animated: true)
            }
        }
        else if indexPath.row == 3
        {
            //Store Location
            let screenSize = UIScreen.main.bounds
            if (screenSize.height == 568.0){
            }
            else if (screenSize.height == 480.0){
            }
            else if(screenSize.height == 667.0){
                let storyBoard = UIStoryboard(name: "SectionFour6S", bundle: nil)
                let StoreLocator = storyBoard.instantiateViewController(withIdentifier: "StoreLocator") as! StoreLocator
                self.navigationController?.pushViewController(StoreLocator, animated: true)
            }
            else if(screenSize.height == 736.0){
                let storyBoard = UIStoryboard(name: "SectionFour6SPlus", bundle: nil)
                let StoreLocator = storyBoard.instantiateViewController(withIdentifier: "StoreLocator") as! StoreLocator
                self.navigationController?.pushViewController(StoreLocator, animated: true)
            }
            else if(screenSize.height == 812.0){
                let storyBoard = UIStoryboard(name: "SectionFourXS", bundle: nil)
                let StoreLocator = storyBoard.instantiateViewController(withIdentifier: "StoreLocator") as! StoreLocator
                self.navigationController?.pushViewController(StoreLocator, animated: true)
            }
            else{
                let storyBoard = UIStoryboard(name: "SectionFourXSMAX", bundle: nil)
                let StoreLocator = storyBoard.instantiateViewController(withIdentifier: "StoreLocator") as! StoreLocator
                self.navigationController?.pushViewController(StoreLocator, animated: true)
            }
        }
        else if indexPath.row == 4
        {
            //Delivery Address
            let screenSize = UIScreen.main.bounds
            if (screenSize.height == 568.0){
            }
            else if (screenSize.height == 480.0){
            }
            else if(screenSize.height == 667.0){
                let storyBoard = UIStoryboard(name: "SectionFour6S", bundle: nil)
                let DeliveryAddressList = storyBoard.instantiateViewController(withIdentifier: "DeliveryAddressList") as! DeliveryAddressList
                self.navigationController?.pushViewController(DeliveryAddressList, animated: true)
            }
            else if(screenSize.height == 736.0){
                let storyBoard = UIStoryboard(name: "SectionFour6SPlus", bundle: nil)
                let DeliveryAddressList = storyBoard.instantiateViewController(withIdentifier: "DeliveryAddressList") as! DeliveryAddressList
                self.navigationController?.pushViewController(DeliveryAddressList, animated: true)
            }
            else if(screenSize.height == 812.0){
                let storyBoard = UIStoryboard(name: "SectionFourXS", bundle: nil)
                let DeliveryAddressList = storyBoard.instantiateViewController(withIdentifier: "DeliveryAddressList") as! DeliveryAddressList
                self.navigationController?.pushViewController(DeliveryAddressList, animated: true)
            }
            else{
                let storyBoard = UIStoryboard(name: "SectionFourXSMAX", bundle: nil)
                let DeliveryAddressList = storyBoard.instantiateViewController(withIdentifier: "DeliveryAddressList") as! DeliveryAddressList
                self.navigationController?.pushViewController(DeliveryAddressList, animated: true)
            }
        }
        else if indexPath.row == 5
        {
            //Change Password
            self.createChangePasswordPopUp()
        }
        else if indexPath.row == 6
        {
            //Preferred language
        }
        else if indexPath.row == 7
        {
            //About Us
            guard let url = URL(string: "http://www.saudi-fisheries.com/aboutus.html") else { return }
            UIApplication.shared.open(url)
        }
        else if indexPath.row == 8
        {
            //Contact Us
            guard let url = URL(string: "http://www.saudi-fisheries.com/contact.html") else { return }
            UIApplication.shared.open(url)
        }
    }
    
    // MARK: - Notification Switch Case method
    /*@objc func switchStateDidChange(_ sender:UISwitch){
        if (sender.isOn == true){
            print("UISwitch state is now ON")
        }
        else{
            print("UISwitch state is now Off")
        }
    }*/
    
    // MARK: - Language Switch Case method
    @objc func indexChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            print("English");
        case 1:
            print("Arabic")
        default:
            break
        }
    }
    
    // MARK: - ChangePassword PopUp View method
    func createChangePasswordPopUp() -> Void
    {
        self.viewCPControlPop = UIControl(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height:UIScreen.main.bounds.height))
        self.viewCPControlPop.backgroundColor=UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.7)
        
        viewCPPop = UIView(frame: CGRect(x: 15, y: 0, width: self.viewCPControlPop.frame.size.width - 30 , height:180))
        viewCPPop.center = self.viewCPControlPop.center
        viewCPPop.backgroundColor = UIColor.white
        viewCPPop.layer.cornerRadius = 4.0
        viewCPPop.layer.masksToBounds = true
        self.viewCPControlPop.addSubview(viewCPPop)
        
        txtCP2Pop =  UITextField(frame: CGRect(x: 15, y: 15, width: viewCPPop.frame.width-30, height: 44))
        txtCP2Pop.textAlignment = NSTextAlignment.left
        txtCP2Pop.backgroundColor = UIColor.white
        txtCP2Pop.delegate=self
        txtCP2Pop.placeholder="  New Password"
        txtCP2Pop.textColor=UIColor.darkGray
        txtCP2Pop.isSecureTextEntry=true
        txtCP2Pop.font = UIFont(name: "Dubai-Regular", size: 16.0)!
        let border1 = CALayer()
        let width1 = CGFloat(0.5)
        border1.borderColor = UIColor(red: 65/255, green: 65/255, blue: 66/255, alpha: 1.0).cgColor
        border1.frame = CGRect(x: 0, y: txtCP2Pop.frame.size.height - width1, width: txtCP2Pop.frame.size.width, height: txtCP2Pop.frame.size.height)
        border1.borderWidth = width1
        txtCP2Pop.layer.addSublayer(border1)
        txtCP2Pop.layer.masksToBounds = true
        viewCPPop.addSubview(txtCP2Pop)
        
        txtCP3Pop =  UITextField(frame: CGRect(x: 15, y: txtCP2Pop.frame.maxY + 2, width: viewCPPop.frame.width-30, height: 44))
        txtCP3Pop.textAlignment = NSTextAlignment.left
        txtCP3Pop.backgroundColor = UIColor.white
        txtCP3Pop.delegate=self
        txtCP3Pop.placeholder="  Confirm Password"
        txtCP3Pop.textColor=UIColor.darkGray
        txtCP3Pop.isSecureTextEntry=true
        txtCP3Pop.font = UIFont(name: "Dubai-Regular", size: 16.0)!
        let border2 = CALayer()
        let width2 = CGFloat(0.5)
        border2.borderColor = UIColor(red: 65/255, green: 65/255, blue: 66/255, alpha: 1.0).cgColor
        border2.frame = CGRect(x: 0, y: txtCP3Pop.frame.size.height - width2, width: txtCP3Pop.frame.size.width, height: txtCP3Pop.frame.size.height)
        border2.borderWidth = width2
        txtCP3Pop.layer.addSublayer(border2)
        txtCP3Pop.layer.masksToBounds = true
        viewCPPop.addSubview(txtCP3Pop)
        
        //--------- Cancel & Save ----------------
        btnCPCancelPop = UIButton(frame: CGRect(x: 0, y: viewCPPop.frame.size.height-50, width: viewCPPop.frame.size.width / 2, height: 50))
        btnCPCancelPop.setTitle("Cancel", for: .normal)
        btnCPCancelPop.setTitleColor(UIColor.red, for: .normal)
        btnCPCancelPop.titleLabel?.font = UIFont(name: "Dubai-Medium", size: 18.0)!
        btnCPCancelPop.tag=1
        btnCPCancelPop.addTarget(self, action: #selector(pressCancelPop), for: .touchUpInside)
        btnCPCancelPop.layer.borderWidth = 1.0
        btnCPCancelPop.layer.borderColor = UIColor.lightGray.cgColor
        btnCPCancelPop.layer.cornerRadius = 0.0
        btnCPCancelPop.layer.masksToBounds = true
        btnCPCancelPop.backgroundColor = UIColor(red: 239.0/255, green: 239.0/255, blue: 244.0/255, alpha: 1.0)
        viewCPPop.addSubview(btnCPCancelPop)
        
        btnCPSavePop = UIButton(frame: CGRect(x: btnCPCancelPop.frame.maxX, y: viewCPPop.frame.size.height-50, width: viewCPPop.frame.size.width / 2, height: 50))
        btnCPSavePop.setTitle("Submit", for: .normal)
        btnCPSavePop.setTitleColor(UIColor(red: 0/255, green: 183/255, blue: 178/255, alpha: 1.0), for: .normal)
        btnCPSavePop.titleLabel?.font = UIFont(name: "Dubai-Medium", size: 18.0)!
        btnCPSavePop.tag=2
        btnCPSavePop.addTarget(self, action: #selector(pressSavePop), for: .touchUpInside)
        btnCPSavePop.layer.borderWidth = 1.0
        btnCPSavePop.layer.borderColor = UIColor.lightGray.cgColor
        btnCPSavePop.layer.cornerRadius = 0.0
        btnCPSavePop.layer.masksToBounds = true
        btnCPSavePop.backgroundColor = UIColor(red: 239.0/255, green: 239.0/255, blue: 244.0/255, alpha: 1.0)
        viewCPPop.addSubview(btnCPSavePop)
        
        self.view.addSubview(self.viewCPControlPop)
    }
    @objc func pressCancelPop() -> Void
    {
        self.viewCPControlPop.removeFromSuperview()
    }
    @objc func pressSavePop() -> Void
    {
        if txtCP2Pop.text == ""
        {
            let uiAlert = UIAlertController(title: "", message: "Please enter new password", preferredStyle: UIAlertController.Style.alert)
            self.present(uiAlert, animated: true, completion: nil)
            uiAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                print("Click of default button")
            }))
        }
        else if txtCP3Pop.text == ""
        {
            let uiAlert = UIAlertController(title: "", message: "Please enetr confirm password", preferredStyle: UIAlertController.Style.alert)
            self.present(uiAlert, animated: true, completion: nil)
            uiAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                print("Click of default button")
            }))
        }
        else
        {
            self.postChnagePassword(strNewPass: txtCP2Pop.text!, strNewConfirmPass: txtCP3Pop.text!)
        }
    }
    
    
    // MARK: - HELP PopUp View method
    /*func createHELPPopUp() -> Void
    {
        self.viewHELPControlPop = UIControl(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height:UIScreen.main.bounds.height))
        self.viewHELPControlPop.backgroundColor=UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.7)
        
        viewHELPPop = UIView(frame: CGRect(x: 15, y: 0, width: self.viewHELPControlPop.frame.size.width - 30 , height:self.viewHELPControlPop.frame.size.height / 2 + 80))
        viewHELPPop.center = self.viewHELPControlPop.center
        viewHELPPop.backgroundColor=UIColor.white
        viewHELPPop.layer.cornerRadius = 4.0
        viewHELPPop.layer.masksToBounds = true
        self.viewHELPControlPop.addSubview(viewHELPPop)
        
        //--------- Text Input ----------------
        txtHELPSubject =  UITextField(frame: CGRect(x: 15, y: 15, width: viewHELPPop.frame.width-30, height: 44))
        txtHELPSubject.textAlignment = NSTextAlignment.left
        txtHELPSubject.backgroundColor = UIColor.white
        txtHELPSubject.delegate=self
        txtHELPSubject.placeholder="  Subject Line"
        txtHELPSubject.textColor=UIColor.darkGray
        txtHELPSubject.isSecureTextEntry=true
        txtHELPSubject.font = UIFont(name: "Dubai-Regular", size: 16.0)!

        let border = CALayer()
        let width = CGFloat(0.5)
        border.borderColor = UIColor(red: 65/255, green: 65/255, blue: 66/255, alpha: 1.0).cgColor
        border.frame = CGRect(x: 0, y: txtHELPSubject.frame.size.height - width, width: txtHELPSubject.frame.size.width, height: txtHELPSubject.frame.size.height)
        border.borderWidth = width
        txtHELPSubject.layer.addSublayer(border)
        txtHELPSubject.layer.masksToBounds = true
        
        viewHELPPop.addSubview(txtHELPSubject)
        
        txtvHELPNote =  UITextView(frame: CGRect(x: 15, y: txtHELPSubject.frame.maxY + 2, width: viewHELPPop.frame.width-30, height: viewHELPPop.frame.height - 15 - txtHELPSubject.frame.size.height - 60))
        txtvHELPNote.textAlignment = NSTextAlignment.left
        txtvHELPNote.backgroundColor = UIColor.white
        txtvHELPNote.delegate=self
        txtvHELPNote.textColor=UIColor.darkGray
        txtvHELPNote.font = UIFont(name: "Dubai-Regular", size: 16.0)!
        txtvHELPNote.text = "Please give your description"
        
        let border1 = CALayer()
        let width1 = CGFloat(0.5)
        border1.borderColor = UIColor(red: 65/255, green: 65/255, blue: 66/255, alpha: 1.0).cgColor
        border1.frame = CGRect(x: 0, y: txtvHELPNote.frame.size.height - width1, width: txtvHELPNote.frame.size.width, height: txtvHELPNote.frame.size.height)
        border1.borderWidth = width1
        txtvHELPNote.layer.addSublayer(border1)
        txtvHELPNote.layer.masksToBounds = true
        
        viewHELPPop.addSubview(txtvHELPNote)
        
        //--------- Cancel & Save ----------------
        btnHELPCancelPop = UIButton(frame: CGRect(x: 0, y: viewHELPPop.frame.size.height-50, width: viewHELPPop.frame.size.width / 2, height: 50))
        btnHELPCancelPop.setTitle("Cancel", for: .normal)
        btnHELPCancelPop.setTitleColor(UIColor.red, for: .normal)
        btnHELPCancelPop.titleLabel?.font = UIFont(name: "Dubai-Medium", size: 18.0)!
        btnHELPCancelPop.tag=1
        btnHELPCancelPop.addTarget(self, action: #selector(pressCancelHELPPop), for: .touchUpInside)
        btnHELPCancelPop.layer.borderWidth = 1.0
        btnHELPCancelPop.layer.borderColor = UIColor.lightGray.cgColor
        btnHELPCancelPop.layer.cornerRadius = 0.0
        btnHELPCancelPop.layer.masksToBounds = true
        btnHELPCancelPop.backgroundColor = UIColor(red: 239.0/255, green: 239.0/255, blue: 244.0/255, alpha: 1.0)
        viewHELPPop.addSubview(btnHELPCancelPop)
        
        btnHELPSavePop = UIButton(frame: CGRect(x: btnHELPCancelPop.frame.maxX, y: viewHELPPop.frame.size.height-50, width: viewHELPPop.frame.size.width / 2, height: 50))
        btnHELPSavePop.setTitle("Submit", for: .normal)
        btnHELPSavePop.setTitleColor(UIColor.black, for: .normal)
        btnHELPSavePop.titleLabel?.font = UIFont(name: "Dubai-Medium", size: 18.0)!
        btnHELPSavePop.tag=2
        btnHELPSavePop.addTarget(self, action: #selector(pressSaveHELPPop), for: .touchUpInside)
        btnHELPSavePop.layer.borderWidth = 1.0
        btnHELPSavePop.layer.borderColor = UIColor.lightGray.cgColor
        btnHELPSavePop.layer.cornerRadius = 0.0
        btnHELPSavePop.layer.masksToBounds = true
        btnHELPSavePop.backgroundColor = UIColor(red: 239.0/255, green: 239.0/255, blue: 244.0/255, alpha: 1.0)
        viewHELPPop.addSubview(btnHELPSavePop)
        
        self.view.addSubview(self.viewHELPControlPop)
    }
    @objc func pressCancelHELPPop() -> Void
    {
        self.viewHELPControlPop.removeFromSuperview()
    }
    @objc func pressSaveHELPPop() -> Void
    {
        self.viewHELPControlPop.removeFromSuperview()
    }*/
    
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
    
    
    //MARK: - post Chnage Password method
    func postChnagePassword(strNewPass:String,strNewConfirmPass:String)
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
            print(dicUser)
            strCustomerid = String(format: "%@", dicUser.value(forKey: "id") as! CVarArg)
            strCustomermobilenumber = String(format: "%@", dicUser.value(forKey: "register_mobilenumber") as! CVarArg)
        }
        
        let strSlectedStoreID = String(format: "%@", UserDefaults.standard.string(forKey: "SelectedStoreID")!)
        
        let diccustomer:NSMutableDictionary? = ["register_mobilenumber" : strCustomermobilenumber,"password" : strNewPass,"confirm_password" : strNewConfirmPass,"registered_in_store_id" : strSlectedStoreID];
        
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
                    
                    let dictemp = NSMutableDictionary(dictionary: json)
                    let Status = String(format: "%@", dictemp.value(forKey: "Status") as! CVarArg)
                    let ResponseMessage = String(format: "%@", dictemp.value(forKey: "ResponseMessage") as! CVarArg)
                    
                    OperationQueue.main.addOperation {
                        
                        if Status == "1"{
                            
                            let strpassword = String(format: "%@", self.txtCP2Pop.text!)
                            UserDefaults.standard.set(strpassword, forKey: "RegisteredUserDetailsPassword")
                            UserDefaults.standard.synchronize()
                            
                            let strPP = String(format: "%@", UserDefaults.standard.string(forKey: "RegisteredUserDetailsPassword")!)
                            print("strPP >>><<< %@",strPP)
                            
                            self.viewCPControlPop.removeFromSuperview()
                            
                            let uiAlert = UIAlertController(title: "", message: "Password has been changed succesfully", preferredStyle: UIAlertController.Style.alert)
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
