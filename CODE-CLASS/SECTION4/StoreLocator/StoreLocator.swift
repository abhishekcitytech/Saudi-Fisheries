//
//  StoreLocator.swift
//  Saudi Fisheries
//
//  Created by Sandipan on 29/01/19.
//  Copyright © 2019 SANDIPAN. All rights reserved.
//

import UIKit

class StoreLocator: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var searchStore: UISearchBar!
    @IBOutlet var tabvStore: UITableView!
    
    let cellReuseIdentifier = "cell"
    var stridentifer = NSString()

    var arrMStoreList = NSMutableArray()
    var arrMStoreStatus = NSMutableArray()
    
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
        
        arrMStoreList = ["Al - Shafa District - Dirab Road", "Al-Malaz District - Jarir Road", "Al - Malaz District - Ali Bin Mohammed Bin Abdul Wahab Road", "Al Rabwa Neighborhood - Al Rabwah Market", "Al - Rabwa neighborhood - Hassan bin Ali Street", "Al-'Olayya District - Al-Takhasusi Road", "The neighborhood of Granada - Khalid Ibn Al Waleed Road", "Al - Aqiq neighborhood - Imam Saud bin Faisal Road", "Al Murooj Neighborhood - North Market", "Old City - Old Market", "Al-Badea neighborhood - Hamza Ibn Abdul Muttalib road", "Al-Rowdah neighborhood - Khaled Ibn Alwaleed road", "Al - Rawabi Quarter Kilo 10 - Old Makkah Road", "Al - Zahra neighborhood - Al - Hira road", "Al - Bawadi neighborhood - King Fahad Road", "Al-Samer neighborhood - Al Ajwad Street", "Al Rowad District - Mohammed Ali Maghrabi Road", "Dammam - Hay Al - Tabishi - Prince Mohammed Bin Fahd Road", "Al Khobar City - Al-'Olayya District - Central Market", "Dhahran City - Al Danah District - Ibn Battuta Road"]
        
        arrMStoreStatus = ["0","1","0","0","1","1","0","1","1","1","1","1","1","1","0","1","0","0","0","1"]
        
        self.tabvStore.register(UINib(nibName: "SLCell", bundle: nil), forCellReuseIdentifier: "SLCell")
        self.tabvStore.separatorStyle = .singleLine
    }
    
    // MARK: - pressBack method
    @IBAction func pressBack(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - tableView delegate and datasoruce Method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrMStoreList.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 130.0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SLCell", for: indexPath) as! SLCell
        
        cell.lblName.text = "Store Name"
        cell.lblAddress.text = String(format: "%@", arrMStoreList[indexPath.row] as! CVarArg)
        
        let strStatusOpenClose = String(format: "%@", arrMStoreStatus[indexPath.row] as! CVarArg)
        if strStatusOpenClose == "0" {
            //OPEN
            cell.lblOpenClose.text = "Open"
            cell.lblOpenClose.backgroundColor = UIColor(red: 38/255, green: 195/255, blue: 225/255, alpha: 1.0)
        }
        else if strStatusOpenClose == "1" {
            //CLOSE
            cell.lblOpenClose.text = "Close"
            cell.lblOpenClose.backgroundColor = UIColor(red: 178/255, green: 210/255, blue: 53/255, alpha: 1.0)
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
    }
}
