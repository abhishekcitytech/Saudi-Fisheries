//
//  MyWishlist.swift
//  Saudi Fisheries
//
//  Created by Sandipan on 29/01/19.
//  Copyright © 2019 SANDIPAN. All rights reserved.
//

import UIKit

class MyWishlist: UIViewController, UITableViewDataSource, UITableViewDelegate, FloatRatingViewDelegate {

    var loadingCircle = UIView()
    var circle = UIView()
    
    let cellReuseIdentifier = "cell"
    var stridentifer = NSString()
    @IBOutlet var tabvList: UITableView!
    
    var arrMProducts = NSMutableArray()
    
    // MARK: - viewWillAppear Method
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true
        
        
        self.tabvList.backgroundView=nil
        self.tabvList.backgroundColor=UIColor.clear
        self.tabvList.separatorColor=UIColor.clear
        self.tabvList.register(UINib(nibName: "WLCell", bundle: nil), forCellReuseIdentifier: "WLCell")
        
    }
    
    // MARK: - viewDidAppear Method
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        self.getWishList()
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
        return arrMProducts.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 115.0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WLCell", for: indexPath) as! WLCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.accessoryType = UITableViewCell.AccessoryType.none
        cell.backgroundColor=UIColor.white
        cell.clearsContextBeforeDrawing = true
        cell.contentView.clearsContextBeforeDrawing = true
        
        
        let dictemp: NSDictionary = self.arrMProducts[indexPath.item] as! NSDictionary
        
        let  id = String(format: "%@", dictemp.value(forKey: "id") as! CVarArg)
        let  product_id = String(format: "%@", dictemp.value(forKey: "product_id") as! CVarArg)
        let  quantity = String(format: "%@", dictemp.value(forKey: "quantity") as! CVarArg)
        
        let dictempproduct: NSDictionary = dictemp.value(forKey: "product") as! NSDictionary
        
        let  strname = String(format: "%@", dictempproduct.value(forKey: "name") as! CVarArg)
        let  strprice = String(format: "%@", dictempproduct.value(forKey: "price") as! CVarArg)
        //let  strdisable_wishlist_button = String(format: "%@", dictempproduct.value(forKey: "disable_wishlist_button") as! CVarArg) //0 1
        let  strproduct_type = String(format: "%@", dictempproduct.value(forKey: "product_type") as! CVarArg)
        let  strRating = String(format: "%@", dictempproduct.value(forKey: "Rating") as! CVarArg)
        
        let arrImages = dictempproduct.value(forKey: "images") as! NSArray
        let dictempImg: NSDictionary = arrImages[0] as! NSDictionary
        let  strsrc = String(format: "%@", dictempImg.value(forKey: "src") as! CVarArg)
        
        cell.lblPrice.text = String(format: "%@%@", strprice,"SAR")
        cell.lblname.text = strname
        cell.lblCategory.text = String(format: "%@%@", strproduct_type,"")
        
        cell.imgvProduct.imageFromURL(urlString: strsrc)
        
//        if strdisable_wishlist_button == "0" {
//            cell.btnFav.setImage(UIImage(named: "favdeselected"), for: .normal)
//        }
//        else{
//            cell.btnFav.setImage(UIImage(named: "favselected"), for: .normal)
//        }
        cell.btnFav.setBackgroundImage(UIImage(named: "favselected"), for: .normal)
        cell.btnFav.addTarget(self, action: #selector(pressAddFav), for: .touchUpInside)
        
        cell.floatingReview.backgroundColor = UIColor.clear
        cell.floatingReview.delegate = self
        cell.floatingReview.contentMode = UIView.ContentMode.center
        cell.floatingReview.type = .floatRatings
        let lessPrecisePI = Double(strRating)
        cell.floatingReview.rating = lessPrecisePI!
        
        let labelSeparator = UILabel(frame: CGRect(x: 15, y: 114.5, width: tableView.frame.size.width, height: 0.5))
        labelSeparator.backgroundColor = UIColor.lightGray
        cell.contentView.addSubview(labelSeparator)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            // handle delete (by removing the data from your array and updating the tableview)
            
            let dictemp: NSDictionary = self.arrMProducts[indexPath.item] as! NSDictionary
            let  id = String(format: "%@", dictemp.value(forKey: "id") as! CVarArg)
            self.deleteWishList(streotemid: id)
        }
    }
    @objc func pressAddFav(){
        print("Button Added fav")
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
    
    
    //MARK: - get WishList method
    func getWishList()
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
        let strconnurl = String(format: "%@%@%@?storeId=%@&shoppingTypeId=%@", Constants.conn.ConnUrl, "/api/shopping_cart_items/",strCustomerid,strSlectedStoreID,"2")
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
                    let arrMProd = Data.value(forKey: "shopping_carts") as! NSArray
                    self.arrMProducts = NSMutableArray(array: arrMProd)
                    print("arrMProducts --->",self.arrMProducts)
                    
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
    
    //MARK: - delete WishList method
    func deleteWishList(streotemid:String)
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
        
        let dicshopping_cart_item:NSMutableDictionary? = ["shopping_cart_type" : "Wishlist",
                                                          "customer_id" : strCustomerid,
                                                          "storeid" : strSlectedStoreID,
                                                          ];
        
        let dicPostOverAll:NSMutableDictionary? = ["shopping_cart_item" : dicshopping_cart_item as Any];
        
        let strapikey = String(format: "%@ %@", UserDefaults.standard.string(forKey: "token_type")!, UserDefaults.standard.string(forKey: "access_token")!)
        let strconnurl = String(format: "%@%@%@", Constants.conn.ConnUrl, "/api/shopping_cart_items/",streotemid)
        let request = NSMutableURLRequest(url: NSURL(string: strconnurl)! as URL)
        request.httpMethod = "DELETE"
        request.setValue(strapikey, forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let jsonData : NSData = try! JSONSerialization.data(withJSONObject: dicPostOverAll as Any) as NSData
        let jsonString = NSString(data: jsonData as Data, encoding: String.Encoding.utf8.rawValue)! as String
        print("json string = \(jsonString)")
        request.httpBody = jsonData as Data
        
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
                    
                    let dictemp = NSMutableDictionary(dictionary: json)
                    
                    let Status = String(format: "%@", dictemp.value(forKey: "Status") as! CVarArg)
                    let ResponseMessage = String(format: "%@", dictemp.value(forKey: "ResponseMessage") as! CVarArg)
                    
                    OperationQueue.main.addOperation {
                        
                        if Status == "1"{
                            self.arrMProducts.removeAllObjects()
                            self.getWishList()
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
