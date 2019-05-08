//
//  OrderReview.swift
//  Saudi Fisheries
//
//  Created by Sandipan on 28/01/19.
//  Copyright © 2019 SANDIPAN. All rights reserved.
//

import UIKit

class OrderReview: UIViewController, UITableViewDataSource, UITableViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource
{
    @IBOutlet var viewPopWareHouse: UIView!
    @IBOutlet var lblChooseWarehouse: UILabel!
    @IBOutlet var collWareHouse: UICollectionView!
    var reuseIdentifier = "ORWCell"
    var arrMWareHouse = NSMutableArray()
    var selectedIndexPath: IndexPath?
    var strSelectedWareHouse = String()
    
    
    var loadingCircle = UIView()
    var circle = UIView()
    
    var arrMOrderReview = NSMutableArray()
    
    @IBOutlet var viewBottomTotal: UIView!
    @IBOutlet var lbl01: UILabel!
    @IBOutlet var lbl011: UILabel!
    @IBOutlet var lbl02: UILabel!
    @IBOutlet var lbl022: UILabel!
    @IBOutlet var lbl03: UILabel!
    @IBOutlet var lbl033: UILabel!
    @IBOutlet var lbl04: UILabel!
    @IBOutlet var lbl044: UILabel!

    @IBOutlet var tableLine: UITableView!
    @IBOutlet var btnConfirmOrder: UIButton!
    
    // MARK: - viewWillAppear Method
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true
    }

    // MARK: - viewDidAppear Method
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.getOrderReviewMethod()
    }
    
    // MARK: - viewDidLoad method
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //Do any additional setup after loading the view.
        //let myAppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        self.viewPopWareHouse.isHidden = true
        let layout = collWareHouse.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: 355, height: 70)
        collWareHouse.backgroundColor = UIColor.clear
        collWareHouse.register(UINib(nibName: "ORWCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        
        self.tableLine.backgroundView=nil
        self.tableLine.backgroundColor=UIColor.clear
        self.tableLine.separatorColor=UIColor.clear
        self.tableLine.register(UINib(nibName: "ORCell", bundle: nil), forCellReuseIdentifier: "ORCell")
        
        viewBottomTotal.layer.borderColor = UIColor.lightGray.cgColor
        viewBottomTotal.layer.borderWidth = 1.0
        viewBottomTotal.layer.cornerRadius = 0.0
        viewBottomTotal.layer.masksToBounds = true
        
        viewBottomTotal.isHidden = true
        btnConfirmOrder.isHidden = true
        self.tableLine.isHidden = true
    }
    
    // MARK: - press Back method
    @IBAction func pressBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - press Cross method
    @IBAction func pressCrossPop(_ sender: Any) {
    }
    
    
    // MARK: - UICollectionView Delegate & DataSource Method
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return self.arrMWareHouse.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! ORWCell
        cell.backgroundColor = UIColor.white
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.cornerRadius = 3.0
        cell.contentView.layer.borderColor = UIColor.lightGray.cgColor
        cell.contentView.layer.masksToBounds = true
        
        /*if selectedIndexPath != nil && indexPath == selectedIndexPath {
            cell.backgroundColor = UIColor(red: 178/255, green: 210/255, blue: 51/255, alpha: 1.0)
            
        }else{
            
            cell.backgroundColor = UIColor.white
        }*/
        
        cell.backgroundColor = UIColor(red: 178/255, green: 210/255, blue: 51/255, alpha: 1.0)
        
        let dictemp: NSDictionary = arrMWareHouse[indexPath.row] as! NSDictionary
        let  str1 = String(format: "%@", dictemp.value(forKey: "Id") as! CVarArg)
        let  str2 = String(format: "%@", dictemp.value(forKey: "Name") as! CVarArg)
        let  str3 = String(format: "%@,%@,%@,%@,%@,%@", dictemp.value(forKey: "Address1") as! CVarArg,dictemp.value(forKey: "Address2") as! CVarArg,dictemp.value(forKey: "City") as! CVarArg,dictemp.value(forKey: "State") as! CVarArg,dictemp.value(forKey: "Zip") as! CVarArg,dictemp.value(forKey: "Country") as! CVarArg)
        
        cell.lbl1.textColor = UIColor.white
        //cell.lbl1.textColor = UIColor.darkGray
        cell.lbl1.text = str2
        cell.lbl2.text = str3
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 5, left:5, bottom:5, right:5)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        /*let cell = collectionView.cellForItem(at: indexPath) as! ORWCell
        cell.backgroundColor =  UIColor(red: 178/255, green: 210/255, blue: 51/255, alpha: 1.0)
        self.selectedIndexPath = indexPath
        cell.lbl1.textColor = UIColor.white*/
        
        let dictemp: NSDictionary = arrMWareHouse[indexPath.row] as! NSDictionary
        let  str1 = String(format: "%@", dictemp.value(forKey: "Id") as! CVarArg)
        let  str2 = String(format: "%@", dictemp.value(forKey: "Name") as! CVarArg)
        strSelectedWareHouse = str1
        print("strSelectedWareHouse %@",strSelectedWareHouse)
        
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath)
    {
        /*let cell: ORWCell = collectionView.cellForItem(at: indexPath) as! ORWCell
        cell.backgroundColor = UIColor.white
        cell.lbl1.textColor = UIColor.darkGray
        selectedIndexPath = nil
        strSelectedWareHouse = ""
        print("strSelectedWareHouse %@",strSelectedWareHouse)*/
    }
    
    
    // MARK: - tableView delegate & datasource Method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrMOrderReview.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100.0
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 0.0
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat
    {
        return 0.0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ORCell", for: indexPath) as! ORCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.accessoryType = UITableViewCell.AccessoryType.none
        cell.backgroundColor=UIColor.white
        cell.clearsContextBeforeDrawing = true
        cell.contentView.clearsContextBeforeDrawing = true
        
        let dictemp: NSDictionary = self.arrMOrderReview[indexPath.item] as! NSDictionary
        
        let  Id = String(format: "%@", dictemp.value(forKey: "Id") as! CVarArg)
        let  ProductId = String(format: "%@", dictemp.value(forKey: "ProductId") as! CVarArg)
        let  ProductName = String(format: "%@", dictemp.value(forKey: "ProductName") as! CVarArg)
        let  Quantity = String(format: "%@", dictemp.value(forKey: "Quantity") as! CVarArg)
        let  UnitPrice = String(format: "%@", dictemp.value(forKey: "UnitPrice") as! CVarArg)
        let  SubTotal = String(format: "%@", dictemp.value(forKey: "SubTotal") as! CVarArg)
        
        let dictempImg: NSDictionary = dictemp.value(forKey: "Picture") as! NSDictionary
        let  strsrc = String(format: "%@", dictempImg.value(forKey: "ImageUrl") as! CVarArg)
   
        cell.lblname.text = ProductName
        cell.lblQuantity.text = String(format: "Quantity: %@",Quantity)
        cell.lblUnitPrice.text = String(format: "%@%@", UnitPrice,"SAR")
        //cell.lblSubTotal.text = String(format: "SubTotal:%@%@", SubTotal,"SAR")
        
        cell.imgvProduct.imageFromURL(urlString: strsrc)
        
        //let labelSeparator = UILabel(frame: CGRect(x: 15, y: 99.5, width: tableView.frame.size.width, height: 0.5))
        //labelSeparator.backgroundColor = UIColor.lightGray
        //cell.contentView.addSubview(labelSeparator)
        
        return cell;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
    }
    
    // MARK: - press Confirm Order Method
    @IBAction func pressConfirmOrder(_ sender: Any)
    {
        if strSelectedWareHouse == "" {
            
            let uiAlert = UIAlertController(title: "", message: "Please selected preferred warehouse", preferredStyle: UIAlertController.Style.alert)
            self.present(uiAlert, animated: true, completion: nil)
            uiAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                print("Click of default button")
            }))
        }
        else
        {
            self.createOrder(strWareHouseID: strSelectedWareHouse)
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
    
    //MARK: - get Order Review method
    func getOrderReviewMethod()
    {
        self.showLoadingMode()
        
        let dicUser = UserDefaults.standard.value(forKey: "RegisteredUserDetails") as! NSMutableDictionary
        let  strCustomerid = String(format: "%@", dicUser.value(forKey: "id") as! CVarArg)
        let strSlectedStoreID = String(format: "%@", UserDefaults.standard.string(forKey: "SelectedStoreID")!)
        
        let strapikey = String(format: "%@ %@", UserDefaults.standard.string(forKey: "token_type")!, UserDefaults.standard.string(forKey: "access_token")!)
        let strconnurl = String(format: "%@%@customerId=%@&storeId=%@", Constants.conn.ConnUrl, "/api/revieworder?",strCustomerid,strSlectedStoreID)
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
                    let arrMor = Data.value(forKey: "Items") as! NSArray
                    self.arrMOrderReview = NSMutableArray(array: arrMor)
                    print("arrMOrderReview --->",self.arrMOrderReview)
                    
                    
                    let dicOrderTotals = Data.value(forKey: "OrderTotal") as! NSDictionary
                    let strOrderTotal = String(format: "%@", dicOrderTotals.value(forKey: "OrderTotal") as! CVarArg)
                    let strOrderTotalDiscount = String(format: "%@", dicOrderTotals.value(forKey: "OrderTotalDiscount") as! CVarArg)
                    let strShipping = String(format: "%@", dicOrderTotals.value(forKey: "Shipping") as! CVarArg)
                    let strSubTotal = String(format: "%@", dicOrderTotals.value(forKey: "SubTotal") as! CVarArg)
                    let strSubTotalDiscount = String(format: "%@", dicOrderTotals.value(forKey: "SubTotalDiscount") as! CVarArg)
                    let strTax = String(format: "%@", dicOrderTotals.value(forKey: "Tax") as! CVarArg)
                    
                    OperationQueue.main.addOperation {
                        
                        if strSubTotal == "" || strOrderTotalDiscount == "" || strTax == "" || strOrderTotal == ""
                        {
                            self.viewBottomTotal.isHidden = true
                            self.btnConfirmOrder.isHidden = true
                        }
                        else{
                            self.viewBottomTotal.isHidden = false
                            self.lbl01.text = " Sub Total"
                            self.lbl011.text = strSubTotal
                            self.lbl02.text = " Order Discount"
                            self.lbl022.text = strOrderTotalDiscount
                            self.lbl03.text = " Tax"
                            self.lbl033.text = strTax
                            self.lbl04.text = " Order Total"
                            self.lbl044.text = strOrderTotal
                            
                            self.btnConfirmOrder.isHidden = false
                        }
                        
                        self.tableLine.isHidden = false
                        self.tableLine.reloadData()
                        
                        
                        let strIdentifier = String(format: "%@", UserDefaults.standard.value(forKey: "DeliveryPickup") as! CVarArg)
                        if strIdentifier == "100" {
                            //Delivery
                            self.getWareHouseList()
                        }
                        else if strIdentifier == "200" {
                            //Prickup
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
    
    //MARK: - get WareHouse method
    func getWareHouseList()
    {
        self.showLoadingMode()
        
        let strapikey = String(format: "%@ %@", UserDefaults.standard.string(forKey: "token_type")!, UserDefaults.standard.string(forKey: "access_token")!)
        let strconnurl = String(format: "%@%@", Constants.conn.ConnUrl, "/api/warehouse")
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
                    //print("json --->",json)
                    
                    let dictemp = NSMutableDictionary(dictionary: json)
                    
                    let Status = String(format: "%@", dictemp.value(forKey: "Status") as! CVarArg)
                    let ResponseMessage = String(format: "%@", dictemp.value(forKey: "ResponseMessage") as! CVarArg)
                    
                    let strSlectedStoreID = String(format: "%@", UserDefaults.standard.string(forKey: "SelectedStoreID")!)
                    
                    let arrMWrhs = NSMutableArray(array: dictemp.value(forKey: "Data") as! NSArray)
                    print("arrMWrhs --->",arrMWrhs)
                    
                    for x in 0 ..< arrMWrhs.count
                    {
                        let dictemp: NSDictionary = arrMWrhs[x] as! NSDictionary
                        let  StoreId = String(format: "%@", dictemp.value(forKey: "StoreId") as! CVarArg)
                        if strSlectedStoreID == StoreId
                        {
                            self.arrMWareHouse.addObjects(from: [arrMWrhs[x]])
                        }
                    }
                    print(self.arrMWareHouse)
                    
                    OperationQueue.main.addOperation {
                       self.viewPopWareHouse.isHidden = false
                       self.collWareHouse.reloadData()
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
    
    //MARK: - createOrder method
    func createOrder(strWareHouseID:String)
    {
        self.showLoadingMode()
        
        let dicUser = UserDefaults.standard.value(forKey: "RegisteredUserDetails") as! NSMutableDictionary
        let  strCustomerid = String(format: "%@", dicUser.value(forKey: "id") as! CVarArg)
        let strSlectedStoreID = String(format: "%@", UserDefaults.standard.string(forKey: "SelectedStoreID")!)
        
        let strapikey = String(format: "%@ %@", UserDefaults.standard.string(forKey: "token_type")!, UserDefaults.standard.string(forKey: "access_token")!)
        let strconnurl = String(format: "%@%@customerId=%@&warehouseId=%@&storeId=%@", Constants.conn.ConnUrl, "/api/createorder?",strCustomerid,strWareHouseID,strSlectedStoreID)
        let request = NSMutableURLRequest(url: NSURL(string: strconnurl)! as URL)
        request.httpMethod = "POST"
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
                    let strOrderID = String(format: "%@", dictemp.value(forKey: "Data") as! CVarArg)
                    
                    OperationQueue.main.addOperation {
                        if Status == "1"
                        {
                            let screenSize = UIScreen.main.bounds
                            if (screenSize.height == 568.0){
                            }
                            else if (screenSize.height == 480.0){
                            }
                            else if(screenSize.height == 667.0){
                                let storyBoard = UIStoryboard(name: "SectionThree6S", bundle: nil)
                                let ThankYouOrder = storyBoard.instantiateViewController(withIdentifier: "ThankYouOrder") as! ThankYouOrder
                                ThankYouOrder.strOrderid = strOrderID
                                ThankYouOrder.hidesBottomBarWhenPushed = true
                                self.navigationController?.pushViewController(ThankYouOrder, animated: true)
                            }
                            else if(screenSize.height == 736.0){
                                let storyBoard = UIStoryboard(name: "SectionThree6SPlus", bundle: nil)
                                let ThankYouOrder = storyBoard.instantiateViewController(withIdentifier: "ThankYouOrder") as! ThankYouOrder
                                ThankYouOrder.strOrderid = strOrderID
                                ThankYouOrder.hidesBottomBarWhenPushed = true
                                self.navigationController?.pushViewController(ThankYouOrder, animated: true)
                            }
                            else if(screenSize.height == 812.0){
                                let storyBoard = UIStoryboard(name: "SectionThreeXS", bundle: nil)
                                let ThankYouOrder = storyBoard.instantiateViewController(withIdentifier: "ThankYouOrder") as! ThankYouOrder
                                ThankYouOrder.strOrderid = strOrderID
                                ThankYouOrder.hidesBottomBarWhenPushed = true
                                self.navigationController?.pushViewController(ThankYouOrder, animated: true)
                            }
                            else{
                                let storyBoard = UIStoryboard(name: "SectionThreeXSMAX", bundle: nil)
                                let ThankYouOrder = storyBoard.instantiateViewController(withIdentifier: "ThankYouOrder") as! ThankYouOrder
                                ThankYouOrder.strOrderid = strOrderID
                                ThankYouOrder.hidesBottomBarWhenPushed = true
                                self.navigationController?.pushViewController(ThankYouOrder, animated: true)
                            }
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
