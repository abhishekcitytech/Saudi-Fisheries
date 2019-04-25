//
//  MyWishlist.swift
//  Saudi Fisheries
//
//  Created by Sandipan on 29/01/19.
//  Copyright © 2019 SANDIPAN. All rights reserved.
//

import UIKit

class MyWishlist: UIViewController, UITableViewDataSource, UITableViewDelegate, FloatRatingViewDelegate {

    let cellReuseIdentifier = "cell"
    var stridentifer = NSString()
    @IBOutlet var tabvList: UITableView!
    
    var arrMMain = NSMutableArray()
    var arrMFavSate = NSMutableArray()
    
    // MARK: - viewWillAppear Method
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true
        
        arrMFavSate = ["0","1","1","0","0","1"];
        arrMMain = ["p1.jpg", "p2.jpg", "p3.jpg","p4.jpg","p5.jpg", "p6.jpg"]
        
        self.tabvList.register(UINib(nibName: "WLCell", bundle: nil), forCellReuseIdentifier: "WLCell")
        self.tabvList.separatorStyle = .singleLine
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "WLCell", for: indexPath) as! WLCell
        
        let rowimagename = "\(arrMMain[indexPath.row])"
        
        cell.imgvProduct.image = UIImage(named: rowimagename)
        
        cell.lblname.text = "Saloman"
        cell.lblCategory.text = "Fresh | Oman"
        cell.lblPrice.text = "47.00 AED"
        
        cell.floatingReview.backgroundColor = UIColor.clear
        cell.floatingReview.delegate = self
        cell.floatingReview.contentMode = UIView.ContentMode.center
        cell.floatingReview.type = .floatRatings
        cell.floatingReview.rating = 3.5
        
        cell.btnFav.addTarget(self, action: #selector(pressAddFav), for: .touchUpInside)
        
        let strStatus = "\(arrMFavSate[indexPath.row])"
        if strStatus == "0"
        {
            cell.btnFav.tag = 0
            cell.btnFav.setBackgroundImage(UIImage(named: "favdeselected"), for: .normal)
        }
        else if strStatus == "1"
        {
            cell.btnFav.tag = 1
            cell.btnFav.setBackgroundImage(UIImage(named: "favselected"), for: .normal)
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
    }
    @objc func pressAddFav(){
        print("Button Add fav")
    }
}
