//
//  OrderHistory.swift
//  Saudi Fisheries
//
//  Created by Sandipan on 25/01/19.
//  Copyright © 2019 SANDIPAN. All rights reserved.
//

import UIKit

class OrderHistory: UIViewController, UITableViewDataSource, UITableViewDelegate, FloatRatingViewDelegate
{
    var loadingCircle = UIView()
    var circle = UIView()
    
    let cellReuseIdentifier = "cell"
    var stridentifer = NSString()
    @IBOutlet var tabvList: UITableView!
    
    var arrMOrders = NSMutableArray()
    var arrMOrdersItems = NSMutableArray()
    
    // MARK: - viewWillAppear Method
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - viewDidAppear Method
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        self.getMyOrdersList()
    }
    
    // MARK: - viewDidLoad method
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //Do any additional setup after loading the view.
        //let myAppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        self.tabvList.backgroundView=nil
        self.tabvList.backgroundColor=UIColor.clear
        self.tabvList.separatorColor=UIColor.clear
        self.tabvList.register(UINib(nibName: "OHCell", bundle: nil), forCellReuseIdentifier: "OHCell")
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
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return arrMOrders.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (self.arrMOrdersItems[section] as AnyObject).count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 115.0
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 74.0
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat
    {
        return 0.0
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let headerView = UIView()
        headerView.frame=CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 44)
        headerView.backgroundColor=UIColor(red: 242/255, green: 242/255, blue: 246/255, alpha: 1.0)
        
        let dictemp1: NSDictionary = self.arrMOrders[section] as! NSDictionary
        let  strid = String(format: "%@", dictemp1.value(forKey: "id") as! CVarArg)
        let  strorder_subtotal_incl_tax = String(format: "%@", dictemp1.value(forKey: "order_subtotal_incl_tax") as! CVarArg)
        
        let label = UILabel(frame: CGRect(x: 15, y: 0, width: tableView.frame.size.width/2-40 , height: 44))
        label.textAlignment = .left
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.text = String(format: "Order#%@", strid)
        label.font = UIFont(name: "Dubai-Medium", size: 19.0)!
        headerView.addSubview(label)
        
        let btnReOrder = UIButton(frame: CGRect(x: headerView.frame.size.width - 100, y: 20, width: 80, height: 34))
        btnReOrder.backgroundColor = UIColor(red: 178/255, green: 210/255, blue: 53/255, alpha: 1.0)
        btnReOrder.tag = Int(strid)!
        btnReOrder.setTitle("Re Order", for: .normal)
        btnReOrder.setTitleColor(UIColor.white, for: .normal)
        btnReOrder.titleLabel?.font = UIFont(name: "Dubai-Medium", size: 16.0)!
        btnReOrder.addTarget(self, action: #selector(pressReOrder), for: .touchUpInside)
        btnReOrder.layer.borderWidth = 1.0
        btnReOrder.layer.borderColor = UIColor.clear.cgColor
        btnReOrder.layer.cornerRadius = 4.0
        btnReOrder.layer.masksToBounds = true
        headerView.addSubview(btnReOrder)
        
        let label1 = UILabel(frame: CGRect(x: 15, y: label.frame.maxY, width: tableView.frame.size.width/2-40, height: 30))
        label1.textAlignment = .left
        label1.backgroundColor = UIColor.clear
        label1.textColor = UIColor.black
        label1.text = String(format: "SubTotal: %@ SAR", strorder_subtotal_incl_tax)
        label1.font = UIFont(name: "Dubai-Regular", size: 14.0)!
        headerView.addSubview(label1)
        
        return headerView
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView?
    {
        let footerView = UIView()
        footerView.frame=CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 0)
        footerView.backgroundColor=UIColor.white
        return footerView
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OHCell", for: indexPath) as! OHCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.accessoryType = UITableViewCell.AccessoryType.none
        cell.backgroundColor=UIColor.white
        cell.clearsContextBeforeDrawing = true
        cell.contentView.clearsContextBeforeDrawing = true
        
        //print(indexPath.item)
        //print(indexPath.section)
        //print(indexPath.row)
        
        let arr: NSArray = self.arrMOrdersItems[indexPath.section] as! NSArray
        let dictemp: NSDictionary = arr[indexPath.item] as! NSDictionary
        
        let  id = String(format: "%@", dictemp.value(forKey: "id") as! CVarArg)
        let  product_id = String(format: "%@", dictemp.value(forKey: "product_id") as! CVarArg)
        let  quantity = String(format: "%@", dictemp.value(forKey: "quantity") as! CVarArg)
        let dictempproduct: NSDictionary = dictemp.value(forKey: "product") as! NSDictionary
        let  strname = String(format: "%@", dictempproduct.value(forKey: "name") as! CVarArg)
        let  strprice = String(format: "%@", dictempproduct.value(forKey: "price") as! CVarArg)
        let  strproduct_type = String(format: "%@", dictempproduct.value(forKey: "product_type") as! CVarArg)
        let  strRating = String(format: "%@", dictempproduct.value(forKey: "Rating") as! CVarArg)
        
        let arrImages = dictempproduct.value(forKey: "images") as! NSArray
        let dictempImg: NSDictionary = arrImages[0] as! NSDictionary
        let  strsrc = String(format: "%@", dictempImg.value(forKey: "src") as! CVarArg)
        
        
        cell.imgvProduct.imageFromURL(urlString: strsrc)
        
        cell.lblname.text = strname
        cell.lblCategory.text = strproduct_type
        cell.lblPrice.text = String(format: "%@%@", strprice,"SAR")
        cell.lblQTY.text = String(format: "%@%@", "QTY:",quantity)
        
        cell.floatingReview.backgroundColor = UIColor.clear
        cell.floatingReview.delegate = self
        cell.floatingReview.contentMode = UIView.ContentMode.center
        cell.floatingReview.type = .floatRatings
        let lessPrecisePI = Double(strRating)
        cell.floatingReview.rating = lessPrecisePI!
        
        let dictemp1: NSDictionary = self.arrMOrders[indexPath.section] as! NSDictionary
        //let  order_status = String(format: "%@", dictemp1.value(forKey: "order_status") as! CVarArg)
        //let  payment_status = String(format: "%@", dictemp1.value(forKey: "payment_status") as! CVarArg)
        //let  shipping_status = String(format: "%@", dictemp1.value(forKey: "shipping_status") as! CVarArg)
        let  pick_up_in_store = String(format: "%@", dictemp1.value(forKey: "pick_up_in_store") as! CVarArg)
        
        if pick_up_in_store == "0" {
            cell.btnStatus.tag = 0
            cell.btnStatus.setBackgroundImage(UIImage(named: "trackorder"), for: .normal)
        }
        else{
            cell.btnStatus.tag = 1
            cell.btnStatus.setBackgroundImage(UIImage(named: "pickuporder"), for: .normal)
        }
        cell.btnStatus.addTarget(self, action: #selector(pressStatus), for: .touchUpInside)
        
        
        let labelSeparator = UILabel(frame: CGRect(x: 15, y: 114.5, width: tableView.frame.size.width, height: 0.5))
        labelSeparator.backgroundColor = UIColor.lightGray
        cell.contentView.addSubview(labelSeparator)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
    }
    @objc func pressStatus(sender: UIButton)
    {
        if sender.tag == 0 {
            print("Button TrackOrder")
        }
        else if sender.tag == 1 {
            print("Button Pickup Store")
        }
    }
    @objc func pressReOrder(sender: UIButton)
    {
        print(sender.tag)
        let strOrderid = String(sender.tag)
        print(strOrderid)
        self.postReOrder(strOrderid: strOrderid)
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
    
    
    //MARK: - get MyOrdersList method
    func getMyOrdersList()
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
        let strconnurl = String(format: "%@%@%@", Constants.conn.ConnUrl, "/api/orders/getorderbyloggedinuser/",strCustomerid)
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
                    let arrMord = Data.value(forKey: "orders") as! NSArray
                    self.arrMOrders = NSMutableArray(array: arrMord)
                    //print("arrMOrders --->",self.arrMOrders)
                    //print("arrMOrders count --->",self.arrMOrders.count)
                    
                    for x in 0 ..< self.arrMOrders.count
                    {
                        let dictemp111: NSDictionary = self.arrMOrders[x] as! NSDictionary
                        let arrmtem = dictemp111.value(forKey: "order_items") as! NSArray
                        self.arrMOrdersItems.add(arrmtem)
                        
                    }
                    //print("arrMOrdersItems --->",self.arrMOrdersItems)
                    print("arrMOrdersItems count --->",self.arrMOrdersItems.count)
                    //self.arrMOrdersItems.removeAllObjects()
                    //self.arrMOrdersItems = ["1"];
                    
                    OperationQueue.main.addOperation {
                        self.tabvList.reloadData()
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
    
    //MARK: - get MyOrdersList method
    func postReOrder(strOrderid:String)
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
        let strconnurl = String(format: "%@%@%@?customerId=%@", Constants.conn.ConnUrl, "/api/reorder/",strOrderid,strCustomerid)
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
                    
                    OperationQueue.main.addOperation {
                        
                        if Status == "1"{
                            let uiAlert = UIAlertController(title: "", message: "Product successfully added in your cart", preferredStyle: UIAlertController.Style.alert)
                            self.present(uiAlert, animated: true, completion: nil)
                            uiAlert.addAction(UIAlertAction(title: "Go to Cart", style: .default, handler: { action in
                                print("Click of default button")
                            }))
                            uiAlert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: { action in
                                print("Click of Cancel button")
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
