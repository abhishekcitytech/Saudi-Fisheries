//
//  CartTab.swift
//  Saudi Fisheries
//
//  Created by Sandipan on 18/01/19.
//  Copyright © 2019 SANDIPAN. All rights reserved.
//

import UIKit

class CartTab: UIViewController,UITextFieldDelegate , UITableViewDelegate,UITableViewDataSource {

    var loadingCircle = UIView()
    var circle = UIView()
    
    @IBOutlet var btnSlide: UIButton!
    
    @IBOutlet var viewBottomTotal: UIView!
    @IBOutlet var lbl01: UILabel!
    @IBOutlet var lbl011: UILabel!
    @IBOutlet var lbl02: UILabel!
    @IBOutlet var lbl022: UILabel!
    @IBOutlet var lbl03: UILabel!
    @IBOutlet var lbl033: UILabel!
    @IBOutlet var lbl04: UILabel!
    @IBOutlet var lbl044: UILabel!
    
    @IBOutlet var btnProceedtoCheckout: UIButton!
    @IBOutlet var tableLine: UITableView!
    
    @IBOutlet var viewDiscountGiftCard: UIView!
    @IBOutlet var lblDiscountCode: UILabel!
    @IBOutlet var txtDiscountCode: UITextField!
    @IBOutlet var btnApplyDiscountCode: UIButton!
    @IBOutlet var lblGiftCards: UILabel!
    @IBOutlet var txtGiftCards: UITextField!
    @IBOutlet var btnApplyGiftCards: UIButton!
    
    var arrMProducts = NSMutableArray()
    
    // MARK: - viewWillAppear Method
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - viewDidAppear Method
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        self.getCartList()
    }
    
    // MARK: - viewDidLoad method
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //let myAppDelegate = UIApplication.shared.delegate as! AppDelegate
 
        self.tableLine.backgroundView=nil
        self.tableLine.backgroundColor=UIColor.clear
        self.tableLine.separatorColor=UIColor.clear
        self.tableLine.register(UINib(nibName: "LCell", bundle: nil), forCellReuseIdentifier: "LCell")
        
        viewBottomTotal.layer.borderColor = UIColor.lightGray.cgColor
        viewBottomTotal.layer.borderWidth = 1.0
        viewBottomTotal.layer.cornerRadius = 0.0
        viewBottomTotal.layer.masksToBounds = true
        
        txtDiscountCode.layer.borderColor = UIColor.lightGray.cgColor
        txtDiscountCode.layer.borderWidth = 1.0
        txtDiscountCode.layer.cornerRadius = 4.0
        txtDiscountCode.layer.masksToBounds = true
        
        btnApplyDiscountCode.layer.borderColor = UIColor.clear.cgColor
        btnApplyDiscountCode.layer.borderWidth = 0.0
        btnApplyDiscountCode.layer.cornerRadius = 4.0
        btnApplyDiscountCode.layer.masksToBounds = true
        
        txtGiftCards.layer.borderColor = UIColor.lightGray.cgColor
        txtGiftCards.layer.borderWidth = 1.0
        txtGiftCards.layer.cornerRadius = 4.0
        txtGiftCards.layer.masksToBounds = true
        
        btnApplyGiftCards.layer.borderColor = UIColor.clear.cgColor
        btnApplyGiftCards.layer.borderWidth = 0.0
        btnApplyGiftCards.layer.cornerRadius = 4.0
        btnApplyGiftCards.layer.masksToBounds = true
        
        viewDiscountGiftCard.isHidden = true
        viewBottomTotal.isHidden = true
        btnProceedtoCheckout.isHidden = true
        self.tableLine.isHidden = true
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
    
    // MARK: - Textfield Delegate Method
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
    }
    func textFieldDidEndEditing(_ textField: UITextField)
    {
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool
    {
        return true;
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool
    {
        return true;
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool
    {
        return true;
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        return true;
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder();
        return true;
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
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.accessoryType = UITableViewCell.AccessoryType.none
        cell.backgroundColor=UIColor.white
        cell.clearsContextBeforeDrawing = true
        cell.contentView.clearsContextBeforeDrawing = true
        
        let dictemp: NSDictionary = self.arrMProducts[indexPath.item] as! NSDictionary
        
        let  id = String(format: "%@", dictemp.value(forKey: "id") as! CVarArg)
        let  product_id = String(format: "%@", dictemp.value(forKey: "product_id") as! CVarArg)
        let  quantity = String(format: "%@", dictemp.value(forKey: "quantity") as! CVarArg)
        let  strlineitemunitprice = String(format: "%@", dictemp.value(forKey: "lineitemunitprice") as! CVarArg)
        
        let dictempproduct: NSDictionary = dictemp.value(forKey: "product") as! NSDictionary
        
        let  strname = String(format: "%@", dictempproduct.value(forKey: "name") as! CVarArg)
        let  strprice = String(format: "%@", dictempproduct.value(forKey: "price") as! CVarArg)
        //let  strdisable_wishlist_button = String(format: "%@", dictempproduct.value(forKey: "disable_wishlist_button") as! CVarArg) //0 1
        let  strproduct_type = String(format: "%@", dictempproduct.value(forKey: "product_type") as! CVarArg)
        let  strRating = String(format: "%@", dictempproduct.value(forKey: "Rating") as! CVarArg)
        
        let arrImages = dictempproduct.value(forKey: "images") as! NSArray
        let dictempImg: NSDictionary = arrImages[0] as! NSDictionary
        let  strsrc = String(format: "%@", dictempImg.value(forKey: "src") as! CVarArg)
        
        cell.lblPrice.text = String(format: "%@%@", strlineitemunitprice,"SAR")
        cell.lblname.text = strname
        cell.lblCategory.text = String(format: "%@%@", strproduct_type,"")
        
        cell.imgvProduct.imageFromURL(urlString: strsrc)
       
        cell.txtQTTY.text = quantity
        
        cell.btnMinus.tag = indexPath.item
        cell.btnPlus.tag = indexPath.item
        cell.btnMinus.addTarget(self, action: #selector(pressMinus), for: .touchUpInside)
        cell.btnPlus.addTarget(self, action: #selector(pressPlus), for: .touchUpInside)
        
        cell.viewQTY.layer.borderColor = UIColor.lightGray.cgColor
        cell.viewQTY.layer.borderWidth = 1.0
        cell.viewQTY.layer.cornerRadius = 2.0
        cell.viewQTY.layer.masksToBounds = true
        
        let labelSeparator = UILabel(frame: CGRect(x: 15, y: 99.5, width: tableView.frame.size.width, height: 0.5))
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
            self.deleteCartList(streotemid: id)
        }
    }
    
    // MARK: - press Minus & Plus Method
    @objc func pressMinus(sender:UIButton!)
    {
        let btnsendtag:UIButton = sender
        print(btnsendtag.tag)
        
        let dictemp: NSDictionary = self.arrMProducts[btnsendtag.tag] as! NSDictionary
        let  id = String(format: "%@", dictemp.value(forKey: "id") as! CVarArg)
        let  product_id = String(format: "%@", dictemp.value(forKey: "product_id") as! CVarArg)
        let arrMAttr = dictemp.value(forKey: "product_attributes") as! NSArray
        let  quantity = String(format: "%@", dictemp.value(forKey: "quantity") as! CVarArg)
        var myInt1 = Int(quantity)
        
        if myInt1! <= 1 {
            //Not Clickable
        }
        else
        {
            myInt1 = myInt1! - 1
            print(myInt1 as Any)
            
            self.updateCartList(strQty: myInt1!, strCartid: id, strProductid: product_id)
        }
    }
    @objc func pressPlus(sender:UIButton!)
    {
        let btnsendtag:UIButton = sender
        print(btnsendtag.tag)
        
        let dictemp: NSDictionary = self.arrMProducts[btnsendtag.tag] as! NSDictionary
        let  id = String(format: "%@", dictemp.value(forKey: "id") as! CVarArg)
        let  product_id = String(format: "%@", dictemp.value(forKey: "product_id") as! CVarArg)
        let arrMAttr = dictemp.value(forKey: "product_attributes") as! NSArray
        let  quantity = String(format: "%@", dictemp.value(forKey: "quantity") as! CVarArg)
        var myInt1 = Int(quantity)
        
        if myInt1! >= 1 {
            myInt1 = myInt1! + 1
            print(myInt1 as Any)
            
             self.updateCartList(strQty: myInt1!, strCartid: id, strProductid: product_id)
        }
        else
        {
        }
    }
    
    // MARK: - press Apply Discount Gift  Method
    @IBAction func pressApplyDiscountCode(_ sender: Any)
    {
        if txtDiscountCode.text == ""
        {
            let uiAlert = UIAlertController(title: "", message: "Please enter promo code", preferredStyle: UIAlertController.Style.alert)
            self.present(uiAlert, animated: true, completion: nil)
            uiAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                print("Click of default button")
            }))
        }
        else{
            self.getApplydiscountcode()
        }
    }
    @IBAction func pressApplyGiftCards(_ sender: Any)
    {
        if txtGiftCards.text == ""
        {
            let uiAlert = UIAlertController(title: "", message: "Please enter gift code", preferredStyle: UIAlertController.Style.alert)
            self.present(uiAlert, animated: true, completion: nil)
            uiAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                print("Click of default button")
            }))
        }
        else{
            self.getApplygiftcard()
        }
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
            let Billing = storyBoard.instantiateViewController(withIdentifier: "Billing") as! Billing
            Billing.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(Billing, animated: true)
        }
        else if(screenSize.height == 736.0){
            let storyBoard = UIStoryboard(name: "SectionThree6SPlus", bundle: nil)
            let Billing = storyBoard.instantiateViewController(withIdentifier: "Billing") as! Billing
            Billing.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(Billing, animated: true)
        }
        else if(screenSize.height == 812.0){
            let storyBoard = UIStoryboard(name: "SectionThreeXS", bundle: nil)
            let Billing = storyBoard.instantiateViewController(withIdentifier: "Billing") as! Billing
            Billing.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(Billing, animated: true)
        }
        else{
            let storyBoard = UIStoryboard(name: "SectionThreeXSMAX", bundle: nil)
            let Billing = storyBoard.instantiateViewController(withIdentifier: "Billing") as! Billing
            Billing.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(Billing, animated: true)
        }
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
    
    //MARK: - get Cart method
    func getCartList()
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
        let strconnurl = String(format: "%@%@%@?storeId=%@&shoppingTypeId=%@", Constants.conn.ConnUrl, "/api/shopping_cart_items/",strCustomerid,strSlectedStoreID,"1")
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
                    
                    let dicOrderTotals = Data.value(forKey: "OrderTotals") as! NSDictionary
                    let strOrderTotal = String(format: "%@", dicOrderTotals.value(forKey: "OrderTotal") as! CVarArg)
                    let strOrderTotalDiscount = String(format: "%@", dicOrderTotals.value(forKey: "OrderTotalDiscount") as! CVarArg)
                    let strShipping = String(format: "%@", dicOrderTotals.value(forKey: "Shipping") as! CVarArg)
                    let strSubTotal = String(format: "%@", dicOrderTotals.value(forKey: "SubTotal") as! CVarArg)
                    let strSubTotalDiscount = String(format: "%@", dicOrderTotals.value(forKey: "SubTotalDiscount") as! CVarArg)
                    let strTax = String(format: "%@", dicOrderTotals.value(forKey: "Tax") as! CVarArg)
                    
                    OperationQueue.main.addOperation {
                        
                        if strOrderTotal == ""
                        {
                            self.viewDiscountGiftCard.isHidden = true
                            self.viewBottomTotal.isHidden = true
                            self.btnProceedtoCheckout.isHidden = true
                        }
                        else
                        {
                            self.viewDiscountGiftCard.isHidden = false
                            self.viewBottomTotal.isHidden = false
                            self.lbl01.text = " Sub Total"
                            self.lbl011.text = strSubTotal
                            self.lbl02.text = " Order Discount"
                            self.lbl022.text = strOrderTotalDiscount
                            self.lbl03.text = " Tax"
                            self.lbl033.text = strTax
                            self.lbl04.text = " Order Total"
                            self.lbl044.text = strOrderTotal
                            
                            self.btnProceedtoCheckout.isHidden = false
                        }
                    
                        self.tableLine.isHidden = false
                        self.tableLine.reloadData()
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
    
    //MARK: - delete CartList method
    func deleteCartList(streotemid:String)
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
        
        let dicshopping_cart_item:NSMutableDictionary? = ["shopping_cart_type" : "shoppingcart",
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
                            self.getCartList()
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
    
    
    //MARK: - update CartList method
    func updateCartList(strQty:Int,strCartid:String,strProductid:String)
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
        
        let dicshopping_cart_item:NSMutableDictionary? = [
            "quantity" : strQty,
            "shopping_cart_type" : "shoppingcart",
            "product_id" : strProductid,
            "storeid" : strSlectedStoreID,
            ];
        
        let dicPostOverAll:NSMutableDictionary? = ["shopping_cart_item" : dicshopping_cart_item as Any];
        
        let strapikey = String(format: "%@ %@", UserDefaults.standard.string(forKey: "token_type")!, UserDefaults.standard.string(forKey: "access_token")!)
        let strconnurl = String(format: "%@%@%@?customerId=%@", Constants.conn.ConnUrl, "/api/shopping_cart_items/",strCartid,strCustomerid)
        let request = NSMutableURLRequest(url: NSURL(string: strconnurl)! as URL)
        request.httpMethod = "PUT"
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
                            self.getCartList()
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
    
    //MARK: - get Apply Discount Code method
    func getApplydiscountcode()
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
        let strconnurl = String(format: "%@%@%@?storeId=%@&shoppingTypeId=%@&discountcouponcode=%@&discountTypeId=%@", Constants.conn.ConnUrl, "/api/shopping_cart_items/",strCustomerid,strSlectedStoreID,"1",txtDiscountCode.text!,"1")
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
                        if Status == "1"
                        {
                            self.txtDiscountCode.text = ""
                            self.arrMProducts.removeAllObjects()
                            self.getCartList()
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
    
    //MARK: - get Apply Gift Cards method
    func getApplygiftcard()
    {
        self.showLoadingMode()
        
        var  strCustomerid = String()
        if UserDefaults.standard.value(forKey: "RegisteredUserDetails") == nil{
            print("emplty")
            strCustomerid = String(format: "%@", "")
        }
        else{
            let dicUser = UserDefaults.standard.value(forKey: "RegisteredUserDetails") as! NSMutableDictionary
            strCustomerid = String(format: "%@", dicUser.value(forKey: "id") as! CVarArg)
        }
        
        let strSlectedStoreID = String(format: "%@", UserDefaults.standard.string(forKey: "SelectedStoreID")!)
        
        let strapikey = String(format: "%@ %@", UserDefaults.standard.string(forKey: "token_type")!, UserDefaults.standard.string(forKey: "access_token")!)
        let strconnurl = String(format: "%@%@%@?storeId=%@&shoppingTypeId=%@&giftcardcouponcode=%@&giftcardTypeId=%@", Constants.conn.ConnUrl, "/api/shopping_cart_items/",strCustomerid,strSlectedStoreID,"1",txtGiftCards.text!,"1")
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
                        if Status == "1"
                        {
                            self.txtGiftCards.text = ""
                            self.arrMProducts.removeAllObjects()
                            self.getCartList()
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
