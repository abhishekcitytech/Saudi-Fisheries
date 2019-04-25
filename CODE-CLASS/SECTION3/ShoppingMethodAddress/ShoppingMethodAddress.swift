//
//  ShoppingMethodAddress.swift
//  Saudi Fisheries
//
//  Created by Sandipan on 28/01/19.
//  Copyright © 2019 SANDIPAN. All rights reserved.
//

import UIKit

class ShoppingMethodAddress: UIViewController , UITableViewDelegate, UITableViewDataSource , UITextFieldDelegate
{
    
    var viewAddessControlPop = UIControl()
    var viewAddressPop = UIView()
    var txtAddressNamePop = UITextField()
    var txtAddressStreet1Pop = UITextField()
    var txtAddressStreet2Pop = UITextField()
    var txtAddressCityPop = UITextField()
    var txtAddressZipPop = UITextField()
    var txtAddressCountryPop = UITextField()
    var txtAddressMobilenoPop = UITextField()
    var btnAddressCancelPop = UIButton()
    var btnAddressSavePop = UIButton()

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
    
    @IBOutlet var viewBottomSelection: UIView!
    @IBOutlet var btnCOD: UIButton!
    @IBOutlet var lblCOD: UILabel!
    
    @IBOutlet var btnReviewYourOrder: UIButton!
    
    
    
    let cellReuseIdentifier = "cell"
    var stridentifer = NSString()
    
    var arrMStoreList = NSMutableArray()
    var arrMAddressList = NSMutableArray()
    
    // MARK: - viewWillAppear Method
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true
    
    }
    
    // MARK: - viewDidAppear Method
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        btnPickup.isSelected = true
        btnDelivery.isSelected = false
        viewPickup.isHidden = false
        viewDelivery.isHidden = true
        tabvStore.reloadData()
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
        
        viewBottomSelection.layer.borderColor = UIColor.lightGray.cgColor
        viewBottomSelection.layer.borderWidth = 1.0
        viewBottomSelection.layer.cornerRadius = 2.0
        viewBottomSelection.layer.masksToBounds = true
        
        btnAddNewAddress.layer.borderColor = UIColor.lightGray.cgColor
        btnAddNewAddress.layer.borderWidth = 1.0
        btnAddNewAddress.layer.cornerRadius = 2.0
        btnAddNewAddress.layer.masksToBounds = true
        
        viewPickup.isHidden = true
        viewDelivery.isHidden = true
        btnCOD.isSelected = true
        
        tabvStore.backgroundView=nil
        tabvStore.backgroundColor=UIColor.clear
        tabvStore.separatorColor=UIColor.clear
        tabvStore.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        tabvAddress.backgroundView=nil
        tabvAddress.backgroundColor=UIColor.clear
        tabvAddress.separatorColor=UIColor.clear
        tabvAddress.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        arrMStoreList = ["1", "2", "3","4","5", "6", "7"]
        arrMAddressList = ["1"]
    }
    
    // MARK: - press Back method
    @IBAction func pressBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: - press Pickup & Delivery method
    @IBAction func pressPickup(_ sender: Any)
    {
        if btnPickup.isSelected == true {
        }
        else{
            btnPickup.isSelected = true
            btnDelivery.isSelected = false
            viewPickup.isHidden = false
            viewDelivery.isHidden = true
            tabvStore.reloadData()
        }
    }
    @IBAction func pressDelivery(_ sender: Any)
    {
        if btnDelivery.isSelected == true {
        }
        else{
            btnPickup.isSelected = false
            btnDelivery.isSelected = true
            viewPickup.isHidden = true
            viewDelivery.isHidden = false
            tabvAddress.reloadData()
        }
    }
    
    // MARK: - press COD method
    @IBAction func pressCOD(_ sender: Any) {
    }
    
    // MARK: - press ReviewYourOrder method
    @IBAction func pressReviewYourOrder(_ sender: Any)
    {
        let screenSize = UIScreen.main.bounds
        if (screenSize.height == 568.0){
        }
        else if (screenSize.height == 480.0){
        }
        else if(screenSize.height == 667.0){
            let storyBoard = UIStoryboard(name: "SectionThree6S", bundle: nil)
            let OrderReview = storyBoard.instantiateViewController(withIdentifier: "OrderReview") as! OrderReview
            OrderReview.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(OrderReview, animated: true)
        }
        else if(screenSize.height == 736.0){
            let storyBoard = UIStoryboard(name: "SectionThree6SPlus", bundle: nil)
            let OrderReview = storyBoard.instantiateViewController(withIdentifier: "OrderReview") as! OrderReview
            OrderReview.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(OrderReview, animated: true)
        }
        else if(screenSize.height == 812.0){
            let storyBoard = UIStoryboard(name: "SectionThreeXS", bundle: nil)
            let OrderReview = storyBoard.instantiateViewController(withIdentifier: "OrderReview") as! OrderReview
            OrderReview.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(OrderReview, animated: true)
        }
        else{
            let storyBoard = UIStoryboard(name: "SectionThreeXSMAX", bundle: nil)
            let OrderReview = storyBoard.instantiateViewController(withIdentifier: "OrderReview") as! OrderReview
            OrderReview.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(OrderReview, animated: true)
        }
    }
    
    
    // MARK: - tableView delegate & datasource Method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tabvStore {
            return arrMStoreList.count
        }
        else  if tableView == tabvAddress {
            return arrMAddressList.count
        }
        return 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110.0
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier:cellReuseIdentifier)
        
        cell.selectionStyle=UITableViewCell.SelectionStyle.none
        cell.accessoryType = UITableViewCell.AccessoryType.none
        cell.backgroundColor=UIColor.white
        cell.clearsContextBeforeDrawing = true
        cell.contentView.clearsContextBeforeDrawing = true
        
        if tableView == tabvStore
        {
            let label = UILabel(frame: CGRect(x: 15, y: 10, width: tabvStore.frame.size.width, height: 25))
            label.textAlignment = .left
            label.textColor = UIColor.black
            label.backgroundColor = UIColor.clear
            label.numberOfLines=1;
            label.text = "Saudi Fisheries Co"
            label.font = UIFont(name: "Dubai-Regular", size: 16.0)!
            cell.contentView.addSubview(label)
            
            let label1 = UILabel(frame: CGRect(x: 15, y: label.frame.maxY, width: tabvStore.frame.size.width, height:40))
            label1.text = "Al Uraija Al Gharbiyah, Riyadh 12976, Saudi Arabia"
            label1.textAlignment = .left
            label1.numberOfLines = 2
            label1.textColor = UIColor.darkGray
            label1.backgroundColor = UIColor.clear
            label1.font = UIFont(name: "Dubai-Regular", size: 14.0)!
            cell.contentView.addSubview(label1)
            
            let label2 = UILabel(frame: CGRect(x: 15, y: label1.frame.maxY, width: tabvStore.frame.size.width, height:30))
            label2.text = "Open 8AM Closes 4PM"
            label2.textAlignment = .left
            label2.textColor = UIColor.darkGray
            label2.backgroundColor = UIColor.clear
            label2.font = UIFont(name: "Dubai-Medium", size: 14.0)!
            cell.contentView.addSubview(label2)
            
            let btnSelectionStore = UIButton(frame: CGRect(x: label.frame.maxX - 48, y: label.frame.minY + 10, width: 24, height: 24))
            btnSelectionStore.tag=1
            btnSelectionStore.setImage(UIImage(named: "radiouncheck"), for: .normal)
            btnSelectionStore.setImage(UIImage(named: "radiocheck"), for: .selected)
            btnSelectionStore.backgroundColor=UIColor.clear
            btnSelectionStore.addTarget(self, action: #selector(pressSelectionStore), for: .touchUpInside)
            cell.contentView.addSubview(btnSelectionStore)
            
            
            let labelSeparator = UILabel(frame: CGRect(x: 0, y: 109.5, width: tableView.frame.size.width, height: 0.5))
            labelSeparator.backgroundColor = UIColor(red: 65/255, green: 65/255, blue: 66/255, alpha: 1.0)
            cell.contentView.addSubview(labelSeparator)
        }
        else  if tableView == tabvAddress
        {
            let label = UILabel(frame: CGRect(x: 15, y: 10, width: tabvStore.frame.size.width, height: 25))
            label.textAlignment = .left
            label.textColor = UIColor.black
            label.backgroundColor = UIColor.clear
            label.numberOfLines=1;
            label.text = "Brett Lee"
            label.font = UIFont(name: "Dubai-Regular", size: 16.0)!
            cell.contentView.addSubview(label)
            
            let label1 = UILabel(frame: CGRect(x: 15, y: label.frame.maxY, width: tabvStore.frame.size.width, height:40))
            label1.text = "King Fahd Rd, Jizan 82725, Saudi Arabia"
            label1.textAlignment = .left
            label1.numberOfLines = 2
            label1.textColor = UIColor.darkGray
            label1.backgroundColor = UIColor.clear
            label1.font = UIFont(name: "Dubai-Regular", size: 14.0)!
            cell.contentView.addSubview(label1)
            
            let label2 = UILabel(frame: CGRect(x: 15, y: label1.frame.maxY, width: tabvStore.frame.size.width, height:30))
            label2.text = "+966 11 4845600"
            label2.textAlignment = .left
            label2.textColor = UIColor.darkGray
            label2.backgroundColor = UIColor.clear
            label2.font = UIFont(name: "Dubai-Medium", size: 14.0)!
            cell.contentView.addSubview(label2)
            
            let btnSelectionAddress = UIButton(frame: CGRect(x: label.frame.maxX - 48, y: label.frame.minY + 10, width: 24, height: 24))
            btnSelectionAddress.tag=1
            btnSelectionAddress.setImage(UIImage(named: "radiouncheck"), for: .normal)
            btnSelectionAddress.setImage(UIImage(named: "radiocheck"), for: .selected)
            btnSelectionAddress.backgroundColor=UIColor.clear
            btnSelectionAddress.addTarget(self, action: #selector(pressSelectionAddress), for: .touchUpInside)
            cell.contentView.addSubview(btnSelectionAddress)
            
            
            let labelSeparator = UILabel(frame: CGRect(x: 0, y: 109.5, width: tableView.frame.size.width, height: 0.5))
            labelSeparator.backgroundColor = UIColor(red: 65/255, green: 65/255, blue: 66/255, alpha: 1.0)
            cell.contentView.addSubview(labelSeparator)
        }
        
        return cell;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
    }
    @objc func pressSelectionStore(){
        print("Button press Selection Store")
    }
    @objc func pressSelectionAddress(){
        print("Button press Selection Store")
    }
    
    // MARK: - press AddNewAddress method
    @IBAction func pressAddNewAddress(_ sender: Any)
    {
        self.createAddNewAddressPopUp()
    }
    
    // MARK: - AddNewAddress PopUp View method
    func createAddNewAddressPopUp() -> Void
    {
        self.viewAddessControlPop = UIControl(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height:UIScreen.main.bounds.height))
        self.viewAddessControlPop.backgroundColor=UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.7)
        
        viewAddressPop = UIView(frame: CGRect(x: 15, y: 0, width: self.viewAddessControlPop.frame.size.width - 30 , height:self.viewAddessControlPop.frame.size.height / 2 + 80))
        viewAddressPop.center = self.viewAddessControlPop.center
        viewAddressPop.backgroundColor=UIColor.white
        viewAddressPop.layer.cornerRadius = 4.0
        viewAddressPop.layer.masksToBounds = true
        self.viewAddessControlPop.addSubview(viewAddressPop)
        
        //--------- Text Input ----------------
        txtAddressNamePop =  UITextField(frame: CGRect(x: 15, y: 15, width: viewAddressPop.frame.width-30, height: 44))
        txtAddressNamePop.textAlignment = NSTextAlignment.left
        txtAddressNamePop.backgroundColor = UIColor.white
        txtAddressNamePop.delegate=self
        txtAddressNamePop.placeholder="  Name"
        txtAddressNamePop.textColor=UIColor.darkGray
        txtAddressNamePop.isSecureTextEntry=false
        txtAddressNamePop.font = UIFont(name: "Dubai-Regular", size: 16.0)!
        
        let border = CALayer()
        let width = CGFloat(0.5)
        border.borderColor = UIColor(red: 65/255, green: 65/255, blue: 66/255, alpha: 1.0).cgColor
        border.frame = CGRect(x: 0, y: txtAddressNamePop.frame.size.height - width, width: txtAddressNamePop.frame.size.width, height: txtAddressNamePop.frame.size.height)
        border.borderWidth = width
        txtAddressNamePop.layer.addSublayer(border)
        txtAddressNamePop.layer.masksToBounds = true
        
        viewAddressPop.addSubview(txtAddressNamePop)
        
        txtAddressStreet1Pop =  UITextField(frame: CGRect(x: 15, y: txtAddressNamePop.frame.maxY + 2, width: viewAddressPop.frame.width-30, height: 44))
        txtAddressStreet1Pop.textAlignment = NSTextAlignment.left
        txtAddressStreet1Pop.backgroundColor = UIColor.white
        txtAddressStreet1Pop.delegate=self
        txtAddressStreet1Pop.placeholder="  Street 1"
        txtAddressStreet1Pop.textColor=UIColor.darkGray
        txtAddressStreet1Pop.isSecureTextEntry=false
        txtAddressStreet1Pop.font = UIFont(name: "Dubai-Regular", size: 16.0)!
        
        let border1 = CALayer()
        let width1 = CGFloat(0.5)
        border1.borderColor = UIColor(red: 65/255, green: 65/255, blue: 66/255, alpha: 1.0).cgColor
        border1.frame = CGRect(x: 0, y: txtAddressStreet1Pop.frame.size.height - width1, width: txtAddressStreet1Pop.frame.size.width, height: txtAddressStreet1Pop.frame.size.height)
        border1.borderWidth = width1
        txtAddressStreet1Pop.layer.addSublayer(border1)
        txtAddressStreet1Pop.layer.masksToBounds = true
        
        viewAddressPop.addSubview(txtAddressStreet1Pop)
        
        txtAddressStreet2Pop =  UITextField(frame: CGRect(x: 15, y: txtAddressStreet1Pop.frame.maxY + 2, width: viewAddressPop.frame.width-30, height: 44))
        txtAddressStreet2Pop.textAlignment = NSTextAlignment.left
        txtAddressStreet2Pop.backgroundColor = UIColor.white
        txtAddressStreet2Pop.delegate=self
        txtAddressStreet2Pop.placeholder="  Street 2"
        txtAddressStreet2Pop.textColor=UIColor.darkGray
        txtAddressStreet2Pop.isSecureTextEntry=false
        txtAddressStreet2Pop.font = UIFont(name: "Dubai-Regular", size: 16.0)!
        
        let border2 = CALayer()
        let width2 = CGFloat(0.5)
        border2.borderColor = UIColor(red: 65/255, green: 65/255, blue: 66/255, alpha: 1.0).cgColor
        border2.frame = CGRect(x: 0, y: txtAddressStreet2Pop.frame.size.height - width2, width: txtAddressStreet2Pop.frame.size.width, height: txtAddressStreet2Pop.frame.size.height)
        border2.borderWidth = width2
        txtAddressStreet2Pop.layer.addSublayer(border2)
        txtAddressStreet2Pop.layer.masksToBounds = true
        
        viewAddressPop.addSubview(txtAddressStreet2Pop)
        
        txtAddressCityPop =  UITextField(frame: CGRect(x: 15, y: txtAddressStreet2Pop.frame.maxY + 2, width: viewAddressPop.frame.width-30, height: 44))
        txtAddressCityPop.textAlignment = NSTextAlignment.left
        txtAddressCityPop.backgroundColor = UIColor.white
        txtAddressCityPop.delegate=self
        txtAddressCityPop.placeholder="  City"
        txtAddressCityPop.textColor=UIColor.darkGray
        txtAddressCityPop.isSecureTextEntry=false
        txtAddressCityPop.font = UIFont(name: "Dubai-Regular", size: 16.0)!
        
        let border3 = CALayer()
        let width3 = CGFloat(0.5)
        border3.borderColor = UIColor(red: 65/255, green: 65/255, blue: 66/255, alpha: 1.0).cgColor
        border3.frame = CGRect(x: 0, y: txtAddressCityPop.frame.size.height - width3, width: txtAddressCityPop.frame.size.width, height: txtAddressCityPop.frame.size.height)
        border3.borderWidth = width3
        txtAddressCityPop.layer.addSublayer(border3)
        txtAddressCityPop.layer.masksToBounds = true
        
        viewAddressPop.addSubview(txtAddressCityPop)
        
        txtAddressZipPop =  UITextField(frame: CGRect(x: 15, y: txtAddressCityPop.frame.maxY + 2, width: viewAddressPop.frame.width-30, height: 44))
        txtAddressZipPop.textAlignment = NSTextAlignment.left
        txtAddressZipPop.backgroundColor = UIColor.white
        txtAddressZipPop.delegate=self
        txtAddressZipPop.placeholder="  Zip Code"
        txtAddressZipPop.textColor=UIColor.darkGray
        txtAddressZipPop.isSecureTextEntry=false
        txtAddressZipPop.font = UIFont(name: "Dubai-Regular", size: 16.0)!
        
        let border4 = CALayer()
        let width4 = CGFloat(0.5)
        border4.borderColor = UIColor(red: 65/255, green: 65/255, blue: 66/255, alpha: 1.0).cgColor
        border4.frame = CGRect(x: 0, y: txtAddressZipPop.frame.size.height - width4, width: txtAddressZipPop.frame.size.width, height: txtAddressZipPop.frame.size.height)
        border4.borderWidth = width4
        txtAddressZipPop.layer.addSublayer(border4)
        txtAddressZipPop.layer.masksToBounds = true
        
        viewAddressPop.addSubview(txtAddressZipPop)
        
        txtAddressCountryPop =  UITextField(frame: CGRect(x: 15, y: txtAddressZipPop.frame.maxY + 2, width: viewAddressPop.frame.width-30, height: 44))
        txtAddressCountryPop.textAlignment = NSTextAlignment.left
        txtAddressCountryPop.backgroundColor = UIColor.white
        txtAddressCountryPop.delegate=self
        txtAddressCountryPop.placeholder="  Country"
        txtAddressCountryPop.textColor=UIColor.darkGray
        txtAddressCountryPop.isSecureTextEntry=false
        txtAddressCountryPop.font = UIFont(name: "Dubai-Regular", size: 16.0)!
        
        let border5 = CALayer()
        let width5 = CGFloat(0.5)
        border5.borderColor = UIColor(red: 65/255, green: 65/255, blue: 66/255, alpha: 1.0).cgColor
        border5.frame = CGRect(x: 0, y: txtAddressCountryPop.frame.size.height - width5, width: txtAddressCountryPop.frame.size.width, height: txtAddressCountryPop.frame.size.height)
        border5.borderWidth = width5
        txtAddressCountryPop.layer.addSublayer(border5)
        txtAddressCountryPop.layer.masksToBounds = true
        
        viewAddressPop.addSubview(txtAddressCountryPop)
        
        txtAddressMobilenoPop =  UITextField(frame: CGRect(x: 15, y: txtAddressCountryPop.frame.maxY + 2, width: viewAddressPop.frame.width-30, height: 44))
        txtAddressMobilenoPop.textAlignment = NSTextAlignment.left
        txtAddressMobilenoPop.backgroundColor = UIColor.white
        txtAddressMobilenoPop.delegate=self
        txtAddressMobilenoPop.placeholder="  Mobile Number"
        txtAddressMobilenoPop.textColor=UIColor.darkGray
        txtAddressMobilenoPop.isSecureTextEntry=false
        txtAddressMobilenoPop.font = UIFont(name: "Dubai-Regular", size: 16.0)!
        
        let border6 = CALayer()
        let width6 = CGFloat(0.5)
        border6.borderColor = UIColor(red: 65/255, green: 65/255, blue: 66/255, alpha: 1.0).cgColor
        border6.frame = CGRect(x: 0, y: txtAddressMobilenoPop.frame.size.height - width6, width: txtAddressMobilenoPop.frame.size.width, height: txtAddressMobilenoPop.frame.size.height)
        border6.borderWidth = width6
        txtAddressMobilenoPop.layer.addSublayer(border6)
        txtAddressMobilenoPop.layer.masksToBounds = true
        
        viewAddressPop.addSubview(txtAddressMobilenoPop)
        
        
        
        //--------- Cancel & Save ----------------
        btnAddressCancelPop = UIButton(frame: CGRect(x: 0, y: viewAddressPop.frame.size.height-50, width: viewAddressPop.frame.size.width / 2, height: 50))
        btnAddressCancelPop.setTitle("Cancel", for: .normal)
        btnAddressCancelPop.setTitleColor(UIColor.red, for: .normal)
        btnAddressCancelPop.titleLabel?.font = UIFont(name: "Dubai-Medium", size: 18.0)!
        btnAddressCancelPop.tag=1
        btnAddressCancelPop.addTarget(self, action: #selector(pressCancelPop), for: .touchUpInside)
        btnAddressCancelPop.layer.borderWidth = 1.0
        btnAddressCancelPop.layer.borderColor = UIColor.lightGray.cgColor
        btnAddressCancelPop.layer.cornerRadius = 0.0
        btnAddressCancelPop.layer.masksToBounds = true
        btnAddressCancelPop.backgroundColor = UIColor(red: 239.0/255, green: 239.0/255, blue: 244.0/255, alpha: 1.0)
        viewAddressPop.addSubview(btnAddressCancelPop)
        
        btnAddressSavePop = UIButton(frame: CGRect(x: btnAddressCancelPop.frame.maxX, y: viewAddressPop.frame.size.height-50, width: viewAddressPop.frame.size.width / 2, height: 50))
        btnAddressSavePop.setTitle("Save", for: .normal)
        btnAddressSavePop.setTitleColor(UIColor.black, for: .normal)
        btnAddressSavePop.titleLabel?.font = UIFont(name: "Dubai-Medium", size: 18.0)!
        btnAddressSavePop.tag=2
        btnAddressSavePop.addTarget(self, action: #selector(pressSavePop), for: .touchUpInside)
        btnAddressSavePop.layer.borderWidth = 1.0
        btnAddressSavePop.layer.borderColor = UIColor.lightGray.cgColor
        btnAddressSavePop.layer.cornerRadius = 0.0
        btnAddressSavePop.layer.masksToBounds = true
        btnAddressSavePop.backgroundColor = UIColor(red: 239.0/255, green: 239.0/255, blue: 244.0/255, alpha: 1.0)
        viewAddressPop.addSubview(btnAddressSavePop)
        
        self.view.addSubview(self.viewAddessControlPop)
    }
    @objc func pressCancelPop() -> Void
    {
        self.viewAddessControlPop.removeFromSuperview()
    }
    @objc func pressSavePop() -> Void
    {
        self.viewAddessControlPop.removeFromSuperview()
    }
}
