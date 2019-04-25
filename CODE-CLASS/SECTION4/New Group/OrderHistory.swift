//
//  OrderHistory.swift
//  Saudi Fisheries
//
//  Created by Sandipan on 25/01/19.
//  Copyright © 2019 SANDIPAN. All rights reserved.
//

import UIKit

class OrderHistory: UIViewController, UITableViewDataSource, UITableViewDelegate, FloatRatingViewDelegate {

    let cellReuseIdentifier = "cell"
    var stridentifer = NSString()
    @IBOutlet var tabvList: UITableView!
    
    var arrMOrderSate = NSMutableArray()
    var arrMMain = NSMutableArray()
    
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
        
        arrMOrderSate = ["2","1","0","2","2","0"]
        arrMMain = ["p1.jpg", "p2.jpg", "p3.jpg","p4.jpg","p5.jpg","p6.jpg"]
        
        self.tabvList.register(UINib(nibName: "OHCell", bundle: nil), forCellReuseIdentifier: "OHCell")
        self.tabvList.separatorStyle = .singleLine
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
    
    
    // MARK: - tableView delegate and datasoruce Method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrMMain.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 115.0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OHCell", for: indexPath) as! OHCell
        
        let rowimagename = "\(arrMMain[indexPath.row])"
        
        cell.imgvProduct.image = UIImage(named: rowimagename)
        
        cell.lblname.text = "Saloman"
        cell.lblCategory.text = "Fresh | Oman"
        cell.lblPrice.text = "47.00 AED"
        cell.lblQTY.text = "1 Kg"
        
        cell.floatingReview.backgroundColor = UIColor.clear
        cell.floatingReview.delegate = self
        cell.floatingReview.contentMode = UIView.ContentMode.center
        cell.floatingReview.type = .floatRatings
        cell.floatingReview.rating = 3.5
        
        cell.btnStatus.addTarget(self, action: #selector(pressStatus), for: .touchUpInside)
        let strStatus = "\(arrMOrderSate[indexPath.row])"
        if strStatus == "0"
        {
            cell.btnStatus.tag = 0
            cell.btnStatus.setTitle("Pending", for: .normal)
            cell.btnStatus.backgroundColor = UIColor(red: 38/255, green: 195/255, blue: 225/255, alpha: 1.0)
        }
        else if strStatus == "1"
        {
            cell.btnStatus.tag = 1
            cell.btnStatus.setTitle("Processing", for: .normal)
            cell.btnStatus.backgroundColor = UIColor(red: 229/255, green: 180/255, blue: 45/255, alpha: 1.0)
        }
        else if strStatus == "2"
        {
            cell.btnStatus.tag = 2
            cell.btnStatus.setTitle("Re Order", for: .normal)
            cell.btnStatus.backgroundColor = UIColor(red: 178/255, green: 210/255, blue: 53/255, alpha: 1.0)
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
    }
    @objc func pressStatus()
    {
        print("Button Status")
    }
    
}
