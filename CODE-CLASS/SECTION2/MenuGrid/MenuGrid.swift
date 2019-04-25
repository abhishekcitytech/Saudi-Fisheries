//
//  MenuGrid.swift
//  Saudi Fisheries
//
//  Created by Sandipan on 13/03/19.
//  Copyright © 2019 SANDIPAN. All rights reserved.
//

import UIKit

class MenuGrid: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    @IBOutlet var viewTopMenuBar: UIView!
    @IBOutlet var btnStarter: UIButton!
    @IBOutlet var btnMainCourse: UIButton!
    @IBOutlet var btnDessert: UIButton!
    
    @IBOutlet var tableLine: UITableView!
    var arrMMenus = NSMutableArray()
    
    // MARK: - viewWillAppear Method
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true
        
        btnStarter.isSelected = true
        btnMainCourse.isSelected = false
        btnDessert.isSelected = false
        btnStarter.setTitleColor(UIColor(red: 0/255, green: 183/255, blue: 178/255, alpha: 1.0), for: .normal)
        btnMainCourse.setTitleColor(UIColor.darkGray, for: .normal)
        btnDessert.setTitleColor(UIColor.darkGray, for: .normal)
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
        
        arrMMenus = ["p1.jpg", "p2.jpg", "p3.jpg","p4.jpg","p5.jpg", "p6.jpg"]
    
        self.tableLine.register(UINib(nibName: "MenuTableCell", bundle: nil), forCellReuseIdentifier: "MenuTableCell")
        self.tableLine.separatorStyle = .singleLine
    }
    
    // MARK: - pressBack method
    @IBAction func pressBack(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Search method
    @IBAction func pressSearch(_ sender: Any)
    {
    }
    
    // MARK: - pressStarter && pressMainCourse && pressDessert method
    @IBAction func pressStarter(_ sender: Any)
    {
        if btnStarter.isSelected == true {
            
        }
        else{
            btnStarter.isSelected = true
            btnMainCourse.isSelected = false
            btnDessert.isSelected = false
            btnStarter.setTitleColor(UIColor(red: 0/255, green: 183/255, blue: 178/255, alpha: 1.0), for: .normal)
            btnMainCourse.setTitleColor(UIColor.darkGray, for: .normal)
            btnDessert.setTitleColor(UIColor.darkGray, for: .normal)
        }
    }
    @IBAction func pressMainCourse(_ sender: Any)
    {
        if btnMainCourse.isSelected == true {
            
        }
        else{
            btnStarter.isSelected = false
            btnMainCourse.isSelected = true
            btnDessert.isSelected = false
            btnStarter.setTitleColor(UIColor.darkGray, for: .normal)
            btnMainCourse.setTitleColor(UIColor(red: 0/255, green: 183/255, blue: 178/255, alpha: 1.0), for: .normal)
            btnDessert.setTitleColor(UIColor.darkGray, for: .normal)
        }
    }
    @IBAction func pressDessert(_ sender: Any)
    {
        if btnDessert.isSelected == true {
            
        }
        else{
            btnStarter.isSelected = false
            btnMainCourse.isSelected = false
            btnDessert.isSelected = true
            btnStarter.setTitleColor(UIColor.darkGray, for: .normal)
            btnMainCourse.setTitleColor(UIColor.darkGray, for: .normal)
            btnDessert.setTitleColor(UIColor(red: 0/255, green: 183/255, blue: 178/255, alpha: 1.0), for: .normal)
        }
    }
    
    
    // MARK: - tableView delegate and datasoruce Method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrMMenus.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 110.0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableCell", for: indexPath) as! MenuTableCell
    
        let rowimagename = "\(arrMMenus[indexPath.row])"
        cell.imgvMenu.image = UIImage(named: rowimagename)
        
        cell.lblName.text = "Sea Bass"
        cell.lblETA.text = "90 minutes"
        cell.lblPrice.text = "47.00 SAR"
        
        cell.btnAddMenuCart.addTarget(self, action: #selector(pressAddCartMenu), for: .touchUpInside)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
    }
    @objc func pressAddCartMenu() -> Void
    {
    }
}
