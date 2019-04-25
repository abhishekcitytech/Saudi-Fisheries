//
//  DeliveryAddressList.swift
//  Saudi Fisheries
//
//  Created by Sandipan on 29/01/19.
//  Copyright © 2019 SANDIPAN. All rights reserved.
//

import UIKit

class DeliveryAddressList: UIViewController , UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate  {

    @IBOutlet var btnAddNewAddress: UIButton!
    
    @IBOutlet var tabvAddress: UITableView!
    let cellReuseIdentifier = "cell"
    var stridentifer = NSString()
    
    var arrMAddressList = NSMutableArray()
    
    
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
        
        self.tabvAddress.register(UINib(nibName: "DACell", bundle: nil), forCellReuseIdentifier: "DACell")
        self.tabvAddress.separatorStyle = .singleLine
        
        arrMAddressList = ["1","2"]
    }

    // MARK: - pressBack method
    @IBAction func pressBack(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - tableView delegate and datasoruce Method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrMAddressList.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 130.0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DACell", for: indexPath) as! DACell
        
        cell.lblName.text = "Brett Lee"
        cell.lblAddress.text = "3A 1st Floor King Fahd Rd, Jizan,82725,Saudi Arabia,UAE"
        cell.lblMobileno.text = "+966114845600"
        
        if indexPath.row == 0{
            cell.lblAddressType.text = "Home"
            cell.lblAddressType.backgroundColor = UIColor(red: 0/255, green: 183/255, blue: 178/255, alpha: 1.0)
        }else{
            cell.lblAddressType.text = "Work"
            cell.lblAddressType.backgroundColor = UIColor(red: 65/255, green: 65/255, blue: 67/255, alpha: 1.0)
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
    }
    
    // MARK: - press AddNewAddress method
    @IBAction func pressAddNewAddress(_ sender: Any)
    {
        let screenSize = UIScreen.main.bounds
        if (screenSize.height == 568.0){
        }
        else if (screenSize.height == 480.0){
        }
        else if(screenSize.height == 667.0){
            let storyBoard = UIStoryboard(name: "SectionFour6S", bundle: nil)
            let AddDeliveryAddress = storyBoard.instantiateViewController(withIdentifier: "AddDeliveryAddress") as! AddDeliveryAddress
            self.navigationController?.pushViewController(AddDeliveryAddress, animated: true)
        }
        else if(screenSize.height == 736.0){
            let storyBoard = UIStoryboard(name: "SectionFour6SPlus", bundle: nil)
            let AddDeliveryAddress = storyBoard.instantiateViewController(withIdentifier: "AddDeliveryAddress") as! AddDeliveryAddress
            self.navigationController?.pushViewController(AddDeliveryAddress, animated: true)
        }
        else if(screenSize.height == 812.0){
            let storyBoard = UIStoryboard(name: "SectionFourXS", bundle: nil)
            let AddDeliveryAddress = storyBoard.instantiateViewController(withIdentifier: "AddDeliveryAddress") as! AddDeliveryAddress
            self.navigationController?.pushViewController(AddDeliveryAddress, animated: true)
        }
        else{
            let storyBoard = UIStoryboard(name: "SectionFourXSMAX", bundle: nil)
            let AddDeliveryAddress = storyBoard.instantiateViewController(withIdentifier: "AddDeliveryAddress") as! AddDeliveryAddress
            self.navigationController?.pushViewController(AddDeliveryAddress, animated: true)
        }
    }
}
