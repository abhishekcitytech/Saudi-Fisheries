//
//  CartTab.swift
//  Saudi Fisheries
//
//  Created by Sandipan on 18/01/19.
//  Copyright © 2019 SANDIPAN. All rights reserved.
//

import UIKit

class CartTab: UIViewController,UITextFieldDelegate , UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var btnSlide: UIButton!
    
    @IBOutlet var viewBottomTotal: UIView!
    
    @IBOutlet var btnProceedtoCheckout: UIButton!
    
    @IBOutlet var tableLine: UITableView!
    
    var arrMProducts = NSMutableArray()
    
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
        //let myAppDelegate = UIApplication.shared.delegate as! AppDelegate

        arrMProducts = ["p1.jpg", "p2.jpg", "p3.jpg","p4.jpg","p5.jpg", "p6.jpg"]
        
        self.tableLine.register(UINib(nibName: "LCell", bundle: nil), forCellReuseIdentifier: "LCell")
        self.tableLine.separatorStyle = .singleLine
        
        viewBottomTotal.layer.borderColor = UIColor.lightGray.cgColor
        viewBottomTotal.layer.borderWidth = 1.0
        viewBottomTotal.layer.cornerRadius = 0.0
        viewBottomTotal.layer.masksToBounds = true
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
        return arrMProducts.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100.0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LCell", for: indexPath) as! LCell
        
        let rowimagename = "\(arrMProducts[indexPath.row])"
        
        cell.imgvProduct.image = UIImage(named: rowimagename)
        cell.lblname.text = "Saloman"
        cell.lblCategory.text = "Fresh Fish | Oman"
        cell.lblPrice.text = "47.00 AED"
        
        cell.btnMinus.addTarget(self, action: #selector(pressMinus), for: .touchUpInside)
        cell.btnPlus.addTarget(self, action: #selector(pressPlus), for: .touchUpInside)
        
        cell.viewQTY.layer.borderColor = UIColor.lightGray.cgColor
        cell.viewQTY.layer.borderWidth = 1.0
        cell.viewQTY.layer.cornerRadius = 2.0
        cell.viewQTY.layer.masksToBounds = true
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        if (editingStyle == .delete)
        {
            // handle delete (by removing the data from your array and updating the tableview)
            
            /*let dictemp: NSDictionary = arrMProducts[indexPath.item] as! NSDictionary
            let  strid = String(format: "%@", dictemp.value(forKey: "Id") as! CVarArg)
            self.removecartlist(streotemid: strid)*/
        }
    }
    
    // MARK: - press Minus & Plus Method
    @objc func pressMinus() -> Void
    {
    }
    @objc func pressPlus() -> Void
    {
    }
    
    // MARK: - press ProceedtoCheckout Method
    @IBAction func pressProceedtoCheckout(_ sender: Any)
    {
        let screenSize = UIScreen.main.bounds
        if (screenSize.height == 568.0){
        }
        else if (screenSize.height == 480.0){
        }
        else if(screenSize.height == 667.0){
            let storyBoard = UIStoryboard(name: "SectionThree6S", bundle: nil)
            let ShoppingMethodAddress = storyBoard.instantiateViewController(withIdentifier: "ShoppingMethodAddress") as! ShoppingMethodAddress
            ShoppingMethodAddress.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(ShoppingMethodAddress, animated: true)
        }
        else if(screenSize.height == 736.0){
            let storyBoard = UIStoryboard(name: "SectionThree6SPlus", bundle: nil)
            let ShoppingMethodAddress = storyBoard.instantiateViewController(withIdentifier: "ShoppingMethodAddress") as! ShoppingMethodAddress
            ShoppingMethodAddress.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(ShoppingMethodAddress, animated: true)
        }
        else if(screenSize.height == 812.0){
            let storyBoard = UIStoryboard(name: "SectionThreeXS", bundle: nil)
            let ShoppingMethodAddress = storyBoard.instantiateViewController(withIdentifier: "ShoppingMethodAddress") as! ShoppingMethodAddress
            ShoppingMethodAddress.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(ShoppingMethodAddress, animated: true)
        }
        else{
            let storyBoard = UIStoryboard(name: "SectionThreeXSMAX", bundle: nil)
            let ShoppingMethodAddress = storyBoard.instantiateViewController(withIdentifier: "ShoppingMethodAddress") as! ShoppingMethodAddress
            ShoppingMethodAddress.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(ShoppingMethodAddress, animated: true)
        }
    }
    
}
