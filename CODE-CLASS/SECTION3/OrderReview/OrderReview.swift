//
//  OrderReview.swift
//  Saudi Fisheries
//
//  Created by Sandipan on 28/01/19.
//  Copyright © 2019 SANDIPAN. All rights reserved.
//

import UIKit

class OrderReview: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let cellReuseIdentifier = "cell"
    var stridentifer = NSString()
    @IBOutlet var tabvList: UITableView!
    
    var arrMMain = NSMutableArray()
    
    @IBOutlet var viewBottomTotal: UIView!
    @IBOutlet var btnPlaceOrder: UIButton!
    
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
        
        arrMMain = ["p1.jpg", "p2.jpg", "p3.jpg","p4.jpg","p5.jpg", "p6.jpg"]
        
        tabvList.backgroundView=nil
        tabvList.backgroundColor=UIColor.clear
        tabvList.separatorColor=UIColor.clear
        tabvList.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        viewBottomTotal.layer.borderColor = UIColor.lightGray.cgColor
        viewBottomTotal.layer.borderWidth = 1.0
        viewBottomTotal.layer.cornerRadius = 0.0
        viewBottomTotal.layer.masksToBounds = true
    }
    
    // MARK: - press Back method
    @IBAction func pressBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

    // MARK: - tableView delegate & datasource Method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrMMain.count
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
        
        let rowimagename = "\(arrMMain[indexPath.item])"
        let imgvicon1 = UIImageView(frame: CGRect(x: 15, y: 15, width: 120, height: 80))
        imgvicon1.backgroundColor = UIColor.clear
        imgvicon1.image = UIImage(named:rowimagename)
        cell.contentView.addSubview(imgvicon1)
        
        let label = UILabel(frame: CGRect(x: imgvicon1.frame.maxX + 5, y: 10, width: 150, height: 25))
        label.textAlignment = .left
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.clear
        label.numberOfLines=1;
        label.text = "Saloman"
        label.font = UIFont(name: "Dubai-Regular", size: 18.0)!
        cell.contentView.addSubview(label)
        
        let label1 = UILabel(frame: CGRect(x: imgvicon1.frame.maxX + 5, y: label.frame.maxY, width: 150, height:30))
        label1.text = "Fresh Fish | Oman"
        label1.textAlignment = .left
        label1.textColor = UIColor.darkGray
        label1.backgroundColor = UIColor.clear
        label1.font = UIFont(name: "Dubai-Regular", size: 15.0)!
        cell.contentView.addSubview(label1)
        
        let label2 = UILabel(frame: CGRect(x: imgvicon1.frame.maxX + 5, y: label1.frame.maxY, width: 150, height:30))
        label2.text = "47.00 AED"
        label2.textAlignment = .left
        label2.textColor = UIColor.darkGray
        label2.backgroundColor = UIColor.clear
        label2.font = UIFont(name: "Dubai-Medium", size: 18.0)!
        cell.contentView.addSubview(label2)
        
        let lblQty = UILabel(frame: CGRect(x: label.frame.maxX + 10, y: 10, width: 60, height: 25))
        lblQty.textAlignment = .center
        lblQty.font = UIFont(name: "Dubai-Bold", size: 18.0)!
        lblQty.text="1 Kg"
        lblQty.textColor = UIColor(red: 0/255, green: 183/255, blue: 178/255, alpha: 1.0)
        lblQty.backgroundColor = UIColor.clear
        cell.contentView.addSubview(lblQty)
        
        let labelSeparator = UILabel(frame: CGRect(x: 0, y: 109.5, width: tableView.frame.size.width, height: 0.5))
        labelSeparator.backgroundColor = UIColor(red: 65/255, green: 65/255, blue: 66/255, alpha: 1.0)
        cell.contentView.addSubview(labelSeparator)
        
        return cell;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
    }
    
    
    // MARK: - press Place Order Method
    @IBAction func pressPlaceOrder(_ sender: Any)
    {
        let screenSize = UIScreen.main.bounds
        if (screenSize.height == 568.0){
        }
        else if (screenSize.height == 480.0){
        }
        else if(screenSize.height == 667.0){
            let storyBoard = UIStoryboard(name: "SectionThree6S", bundle: nil)
            let ThankYouOrder = storyBoard.instantiateViewController(withIdentifier: "ThankYouOrder") as! ThankYouOrder
            ThankYouOrder.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(ThankYouOrder, animated: true)
        }
        else if(screenSize.height == 736.0){
            let storyBoard = UIStoryboard(name: "SectionThree6SPlus", bundle: nil)
            let ThankYouOrder = storyBoard.instantiateViewController(withIdentifier: "ThankYouOrder") as! ThankYouOrder
            ThankYouOrder.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(ThankYouOrder, animated: true)
        }
        else if(screenSize.height == 812.0){
            let storyBoard = UIStoryboard(name: "SectionThreeXS", bundle: nil)
            let ThankYouOrder = storyBoard.instantiateViewController(withIdentifier: "ThankYouOrder") as! ThankYouOrder
            ThankYouOrder.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(ThankYouOrder, animated: true)
        }
        else{
            let storyBoard = UIStoryboard(name: "SectionThreeXSMAX", bundle: nil)
            let ThankYouOrder = storyBoard.instantiateViewController(withIdentifier: "ThankYouOrder") as! ThankYouOrder
            ThankYouOrder.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(ThankYouOrder, animated: true)
        }
    }
}
