//
//  ShoppingMethodAddress.swift
//  Saudi Fisheries
//
//  Created by Sandipan on 28/01/19.
//  Copyright © 2019 SANDIPAN. All rights reserved.
//

import UIKit

class PickupShipping: UIViewController , UITableViewDelegate, UITableViewDataSource , UITextFieldDelegate
{
    
    var loadingCircle = UIView()
    var circle = UIView()
    
    @IBOutlet var lblChooseYourPreferences: UILabel!
    
    @IBOutlet var viewTopSelection: UIView!
    @IBOutlet var btnPickup: UIButton!
    @IBOutlet var lblPickup: UILabel!
    @IBOutlet var btnDelivery: UIButton!
    @IBOutlet var lblDelivery: UILabel!
    
    @IBOutlet var viewPickup: UIView!
    @IBOutlet var searchStore: UISearchBar!
    @IBOutlet var tabvStore: UITableView!
    
    @IBOutlet var viewDelivery: UIView!
    @IBOutlet var tabvAddress: UITableView!
    @IBOutlet var btnAddNewAddress: UIButton!
    
    let cellReuseIdentifier = "cell"
    var cell = UITableViewCell()
    var stridentifer = NSString()
    
    var arrMStoreList = NSMutableArray()
    var arrMAddressList = NSMutableArray()
    
    var strAddressId = String()
    var selectedRows:[IndexPath] = []
    
    var strStoreId = String()
    var selectedRows1:[IndexPath] = []
    
    // MARK: - viewWillAppear Method
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true
    
    }
    
    // MARK: - viewDidAppear Method
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        btnPickup.isSelected = false
        btnDelivery.isSelected = true
        viewPickup.isHidden = true
        viewDelivery.isHidden = false
        UserDefaults.standard.set("100", forKey: "DeliveryPickup")
        UserDefaults.standard.synchronize()
        self.getShippingAddressList()
    }
    
    // MARK: - viewDidLoad method
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //let myAppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        viewTopSelection.layer.borderColor = UIColor.lightGray.cgColor
        viewTopSelection.layer.borderWidth = 1.0
        viewTopSelection.layer.cornerRadius = 2.0
        viewTopSelection.layer.masksToBounds = true
        
        viewPickup.isHidden = true
        viewDelivery.isHidden = true
        
        self.tabvStore.backgroundView=nil
        self.tabvStore.backgroundColor=UIColor.clear
        self.tabvStore.separatorColor=UIColor.clear
        self.tabvStore.register(UINib(nibName: "PUCell", bundle: nil), forCellReuseIdentifier: "PUCell")
        
        self.tabvAddress.backgroundView=nil
        self.tabvAddress.backgroundColor=UIColor.clear
        self.tabvAddress.separatorColor=UIColor.clear
        self.tabvAddress.register(UINib(nibName: "SPCell", bundle: nil), forCellReuseIdentifier: "SPCell")
    }
    
    // MARK: - press Back method
    @IBAction func pressBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - press Continue method
    @IBAction func pressContinue(_ sender: Any)
    {
        if btnPickup.isSelected == true {
            print(strStoreId)
            self.setShippingAddressPickup(strPickId: strStoreId)
        }
        else if btnDelivery.isSelected == true{
            print(strAddressId)
            self.setShippingAddress(strAddressId: strAddressId)
        }
    }
    
    
    // MARK: - press Pickup & Delivery method
    @IBAction func pressDelivery(_ sender: Any)
    {
        if btnDelivery.isSelected == true {
        }
        else{
            btnPickup.isSelected = false
            btnDelivery.isSelected = true
            viewPickup.isHidden = true
            viewDelivery.isHidden = false
            UserDefaults.standard.set("100", forKey: "DeliveryPickup")
            UserDefaults.standard.synchronize()
            self.getShippingAddressList()
        }
    }
    @IBAction func pressPickup(_ sender: Any)
    {
        if btnPickup.isSelected == true {
        }
        else{
            btnPickup.isSelected = true
            btnDelivery.isSelected = false
            viewPickup.isHidden = false
            viewDelivery.isHidden = true
            UserDefaults.standard.set("200", forKey: "DeliveryPickup")
            UserDefaults.standard.synchronize()
            self.tabvStore.reloadData()
        }
    }
    
    
    
    // MARK: - tableView delegate & datasource Method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if tableView == tabvStore
        {
            return arrMStoreList.count
        }
        else  if tableView == tabvAddress
        {
            return arrMAddressList.count
        }
        return 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 120.0
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 0.0
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat
    {
        return 0.0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if tableView == tabvStore
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PUCell", for: indexPath) as! PUCell
            cell.accessoryType = UITableViewCell.AccessoryType.none
            cell.selectionStyle = .none
            cell.backgroundColor = UIColor.white
            
            let dictemp: NSDictionary = self.arrMStoreList[indexPath.item] as! NSDictionary
            let strId = String(format: "%@", dictemp.value(forKey: "Id") as! CVarArg)
            let strName = String(format: "%@", dictemp.value(forKey: "Name") as! CVarArg)
            let strProviderSystemName = String(format: "%@", dictemp.value(forKey: "ProviderSystemName") as! CVarArg)
            let strAddress = String(format: "%@,%@,%@,%@,%@", dictemp.value(forKey: "Address") as! CVarArg,dictemp.value(forKey: "City") as! CVarArg,dictemp.value(forKey: "StateName") as! CVarArg,dictemp.value(forKey: "ZipPostalCode") as! CVarArg,dictemp.value(forKey: "CountryName") as! CVarArg)
            let strLatitude = String(format: "%@", dictemp.value(forKey: "Latitude") as! CVarArg)
            let strLongitude = String(format: "%@", dictemp.value(forKey: "Longitude") as! CVarArg)
            let strOpeningHours = String(format: "%@", dictemp.value(forKey: "OpeningHours") as! CVarArg)
            
            cell.lbl1.text = strName
            cell.lbl2.text = strAddress
            cell.lbl3.text = strOpeningHours
            
            let strSelectedStoreID = String(format: "%@", UserDefaults.standard.string(forKey: "SelectedStoreID")!)
            let strSelectedStoreNAME = String(format: "%@", UserDefaults.standard.string(forKey: "SelectedStoreNAME")!)
            print("strId %@",strId)
            print("strSelectedStoreID %@",strSelectedStoreID)
            if strSelectedStoreID == strId{
                cell.backgroundColor=UIColor(red: 242/255, green: 242/255, blue: 246/255, alpha: 1.0)
                
                let selectedIndexPath = IndexPath(row: indexPath.row, section: 0)
                selectedRows1.removeAll()
                selectedRows1.append(selectedIndexPath)
                
                strStoreId = String(format: "%@", dictemp.value(forKey: "Id") as! CVarArg)
                print("strStoreId %@",strStoreId)
            }else{
                cell.backgroundColor=UIColor.white
            }
            
            if selectedRows1.contains(indexPath){
                cell.btnCheckUnCheck.setBackgroundImage(UIImage(named:"radiocheck"), for: .normal)
            }else{
                cell.btnCheckUnCheck.setBackgroundImage(UIImage(named:"radiouncheck"), for: .normal)
            }
            cell.btnCheckUnCheck.tag = indexPath.row
            cell.btnCheckUnCheck.addTarget(self, action: #selector(checkBoxSelection2(_:)), for: .touchUpInside)
            
            let labelSeparator = UILabel(frame: CGRect(x: 0, y: 119.5, width: tableView.frame.size.width, height: 0.5))
            labelSeparator.backgroundColor = UIColor(red: 65/255, green: 65/255, blue: 66/255, alpha: 1.0)
            cell.contentView.addSubview(labelSeparator)
            
            return cell;
        }
        else  if tableView == tabvAddress
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SPCell", for: indexPath) as! SPCell
            cell.accessoryType = UITableViewCell.AccessoryType.none
            cell.selectionStyle = .none
            cell.backgroundColor = UIColor.white
            
            let dictemp: NSDictionary = arrMAddressList[indexPath.row] as! NSDictionary
            let  strId = String(format: "%@", dictemp.value(forKey: "Id") as! CVarArg)
            let  strFirstName = String(format: "%@", dictemp.value(forKey: "FirstName") as! CVarArg)
            let  strLastName = String(format: "%@", dictemp.value(forKey: "LastName") as! CVarArg)
            let  strAddress1 = String(format: "%@", dictemp.value(forKey: "Address1") as! CVarArg)
            let  strAddress2 = String(format: "%@", dictemp.value(forKey: "Address2") as! CVarArg)
            let  strCity = String(format: "%@", dictemp.value(forKey: "City") as! CVarArg)
            let  strZipPostalCode = String(format: "%@", dictemp.value(forKey: "ZipPostalCode") as! CVarArg)
            let  strPhoneNumber = String(format: "%@", dictemp.value(forKey: "PhoneNumber") as! CVarArg)
            
            cell.lbl1.text = String(format: "%@ %@", strFirstName,strLastName)
            cell.lbl2.text = String(format: "%@,%@,%@,%@", strAddress1,strAddress2,strCity,strZipPostalCode)
            cell.lbl3.text = String(format: "%@", strPhoneNumber)
            
            if selectedRows.contains(indexPath){
                cell.btnCheckUnCheck.setBackgroundImage(UIImage(named:"radiocheck"), for: .normal)
            }else{
                cell.btnCheckUnCheck.setBackgroundImage(UIImage(named:"radiouncheck"), for: .normal)
            }
            cell.btnCheckUnCheck.tag = indexPath.row
            cell.btnCheckUnCheck.addTarget(self, action: #selector(checkBoxSelection1(_:)), for: .touchUpInside)
            
            let labelSeparator = UILabel(frame: CGRect(x: 0, y: 119.5, width: tableView.frame.size.width, height: 0.5))
            labelSeparator.backgroundColor = UIColor(red: 65/255, green: 65/255, blue: 66/255, alpha: 1.0)
            cell.contentView.addSubview(labelSeparator)
            
            return cell;
        }
        return cell;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
    }
    
    //MARK: - Delivery Address List Logical Method
    @objc func checkBoxSelection1(_ sender:UIButton)
    {
        let selectedIndexPath = IndexPath(row: sender.tag, section: 0)
        if self.selectedRows.contains(selectedIndexPath)
        {
            self.selectedRows.remove(at: self.selectedRows.index(of: selectedIndexPath)!)
        }
        else
        {
            self.selectedRows.removeAll()
            self.selectedRows.append(selectedIndexPath)
            
            let dictemp: NSDictionary = arrMAddressList[selectedIndexPath.row] as! NSDictionary
            strAddressId = String(format: "%@", dictemp.value(forKey: "Id") as! CVarArg)
            print(dictemp)
            print(strAddressId)
        }
        self.tabvAddress.reloadData()
    }
    func getAllIndexPaths1() -> [IndexPath]
    {
        var indexPaths: [IndexPath] = []
        for j in 0..<tabvAddress.numberOfRows(inSection: 0) {
            indexPaths.append(IndexPath(row: j, section: 0))
        }
        return indexPaths
    }
    
    //MARK: - Store List Logical Method
    @objc func checkBoxSelection2(_ sender:UIButton)
    {
        let selectedIndexPath = IndexPath(row: sender.tag, section: 0)
        if self.selectedRows1.contains(selectedIndexPath){
            self.selectedRows1.remove(at: self.selectedRows1.index(of: selectedIndexPath)!)
        }else{
            self.selectedRows1.removeAll()
            self.selectedRows1.append(selectedIndexPath)
            
            let dictemp: NSDictionary = arrMStoreList[selectedIndexPath.row] as! NSDictionary
            strStoreId = String(format: "%@", dictemp.value(forKey: "Id") as! CVarArg)
            print(dictemp)
            print(strStoreId)
        }
        self.tabvStore.reloadData()
    }
    func getAllIndexPaths2() -> [IndexPath]
    {
        var indexPaths: [IndexPath] = []
        for j in 0..<tabvStore.numberOfRows(inSection: 0) {
            indexPaths.append(IndexPath(row: j, section: 0))
        }
        return indexPaths
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
    
    
    //MARK: - get Shipping Address List method
    func getShippingAddressList()
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
        
        let strapikey = String(format: "%@ %@", UserDefaults.standard.string(forKey: "token_type")!, UserDefaults.standard.string(forKey: "access_token")!)
        let strconnurl = String(format: "%@%@%@?storeid=%@", Constants.conn.ConnUrl, "/api/getshippingaddress/",strCustomerid,strSlectedStoreID)
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
                    print("json --->",json)
                    
                    let dictemp = NSMutableDictionary(dictionary: json)
                    
                    let Status = String(format: "%@", dictemp.value(forKey: "Status") as! CVarArg)
                    let ResponseMessage = String(format: "%@", dictemp.value(forKey: "ResponseMessage") as! CVarArg)
                    
                    let Data = dictemp.value(forKey: "Data") as! NSDictionary
                    let arrMaddr = Data.value(forKey: "ExistingAddresses") as! NSArray
                    self.arrMAddressList = NSMutableArray(array: arrMaddr)
                    print("arrMAddressList --->",self.arrMAddressList)
                    
                    let arrMstr = Data.value(forKey: "PickupPoints") as! NSArray
                    let arrMstr1 = NSMutableArray(array: arrMstr)
                    print("arrMstr1 count --->",arrMstr1.count)
                    
                    let strSelectedStoreID = String(format: "%@", UserDefaults.standard.string(forKey: "SelectedStoreID")!)
                    
                    for x in 0 ..< arrMstr1.count
                    {
                        let dictemp: NSDictionary = arrMstr1[x] as! NSDictionary
                        let strId = String(format: "%@", dictemp.value(forKey: "Id") as! CVarArg)
                        if strSelectedStoreID == strId{
                            self.arrMStoreList.add(dictemp)
                        }
                    }
                    print("arrMStoreList count --->",self.arrMStoreList.count)
                    
                    OperationQueue.main.addOperation {
                        self.tabvAddress.reloadData()
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
    
    //MARK: - set ShippingAddress method
    func setShippingAddress(strAddressId:String)
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
        
        let strapikey = String(format: "%@ %@", UserDefaults.standard.string(forKey: "token_type")!, UserDefaults.standard.string(forKey: "access_token")!)
        let strconnurl = String(format: "%@%@customerId=%@&storeId=%@&addressId=%@&shippingComputationMethod=%@", Constants.conn.ConnUrl, "/api/saveshippingaddress?",strCustomerid,strSlectedStoreID,strAddressId,"Shipping.FixedByWeightByTotal")
        let request = NSMutableURLRequest(url: NSURL(string: strconnurl)! as URL)
        request.httpMethod = "POST"
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
                    print("json --->",json)
                    
                    let dictemp = NSMutableDictionary(dictionary: json)
                    let Status = String(format: "%@", dictemp.value(forKey: "Status") as! CVarArg)
                    let ResponseMessage = String(format: "%@", dictemp.value(forKey: "ResponseMessage") as! CVarArg)
                    
                    OperationQueue.main.addOperation {
                        if Status == "1"
                        {
                            let screenSize = UIScreen.main.bounds
                            if (screenSize.height == 568.0){
                            }
                            else if (screenSize.height == 480.0){
                            }
                            else if(screenSize.height == 667.0){
                                let storyBoard = UIStoryboard(name: "SectionThree6S", bundle: nil)
                                let Shippingmethod = storyBoard.instantiateViewController(withIdentifier: "Shippingmethod") as! Shippingmethod
                                Shippingmethod.hidesBottomBarWhenPushed = true
                                self.navigationController?.pushViewController(Shippingmethod, animated: true)
                            }
                            else if(screenSize.height == 736.0){
                                let storyBoard = UIStoryboard(name: "SectionThree6SPlus", bundle: nil)
                                let Shippingmethod = storyBoard.instantiateViewController(withIdentifier: "Shippingmethod") as! Shippingmethod
                                Shippingmethod.hidesBottomBarWhenPushed = true
                                self.navigationController?.pushViewController(Shippingmethod, animated: true)
                            }
                            else if(screenSize.height == 812.0){
                                let storyBoard = UIStoryboard(name: "SectionThreeXS", bundle: nil)
                                let Shippingmethod = storyBoard.instantiateViewController(withIdentifier: "Shippingmethod") as! Shippingmethod
                                Shippingmethod.hidesBottomBarWhenPushed = true
                                self.navigationController?.pushViewController(Shippingmethod, animated: true)
                            }
                            else{
                                let storyBoard = UIStoryboard(name: "SectionThreeXSMAX", bundle: nil)
                                let Shippingmethod = storyBoard.instantiateViewController(withIdentifier: "Shippingmethod") as! Shippingmethod
                                Shippingmethod.hidesBottomBarWhenPushed = true
                                self.navigationController?.pushViewController(Shippingmethod, animated: true)
                            }
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
    
    
    //MARK: - set ShippingAddressPickup method
    func setShippingAddressPickup(strPickId:String)
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
        
        let strapikey = String(format: "%@ %@", UserDefaults.standard.string(forKey: "token_type")!, UserDefaults.standard.string(forKey: "access_token")!)
        let strconnurl = String(format: "%@%@customerId=%@&storeId=%@&addressId=%@&shippingComputationMethod=%@&IsInStorePickup=%@&selecteInstorePickupId=%@", Constants.conn.ConnUrl, "/api/saveshippingaddress?",strCustomerid,strSlectedStoreID,"","Shipping.FixedByWeightByTotal","true",strPickId)
        let request = NSMutableURLRequest(url: NSURL(string: strconnurl)! as URL)
        request.httpMethod = "POST"
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
                    print("json --->",json)
                    
                    let dictemp = NSMutableDictionary(dictionary: json)
                    let Status = String(format: "%@", dictemp.value(forKey: "Status") as! CVarArg)
                    let ResponseMessage = String(format: "%@", dictemp.value(forKey: "ResponseMessage") as! CVarArg)
                    
                    OperationQueue.main.addOperation {
                        if Status == "1"
                        {
                            let screenSize = UIScreen.main.bounds
                            if (screenSize.height == 568.0){
                            }
                            else if (screenSize.height == 480.0){
                            }
                            else if(screenSize.height == 667.0){
                                let storyBoard = UIStoryboard(name: "SectionThree6S", bundle: nil)
                                let Paymentmethod = storyBoard.instantiateViewController(withIdentifier: "Paymentmethod") as! Paymentmethod
                                Paymentmethod.hidesBottomBarWhenPushed = true
                                self.navigationController?.pushViewController(Paymentmethod, animated: true)
                            }
                            else if(screenSize.height == 736.0){
                                let storyBoard = UIStoryboard(name: "SectionThree6SPlus", bundle: nil)
                                let Paymentmethod = storyBoard.instantiateViewController(withIdentifier: "Paymentmethod") as! Paymentmethod
                                Paymentmethod.hidesBottomBarWhenPushed = true
                                self.navigationController?.pushViewController(Paymentmethod, animated: true)
                            }
                            else if(screenSize.height == 812.0){
                                let storyBoard = UIStoryboard(name: "SectionThreeXS", bundle: nil)
                                let Paymentmethod = storyBoard.instantiateViewController(withIdentifier: "Paymentmethod") as! Paymentmethod
                                Paymentmethod.hidesBottomBarWhenPushed = true
                                self.navigationController?.pushViewController(Paymentmethod, animated: true)
                            }
                            else{
                                let storyBoard = UIStoryboard(name: "SectionThreeXSMAX", bundle: nil)
                                let Paymentmethod = storyBoard.instantiateViewController(withIdentifier: "Paymentmethod") as! Paymentmethod
                                Paymentmethod.hidesBottomBarWhenPushed = true
                                self.navigationController?.pushViewController(Paymentmethod, animated: true)
                            }
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
