//
//  ProductGrid.swift
//  Saudi Fisheries
//
//  Created by Sandipan on 18/01/19.
//  Copyright © 2019 SANDIPAN. All rights reserved.
//

import UIKit

class ProductGrid: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate , UITableViewDataSource , UIActionSheetDelegate , FloatRatingViewDelegate
{
    var loadingCircle = UIView()
    var circle = UIView()
    
    @IBOutlet var btnSlide: UIButton!
    
    @IBOutlet var viewFilterListGrid: UIView!
    @IBOutlet var btnFilter: UIButton!
    @IBOutlet var btnSort: UIButton!
    
    @IBOutlet var CollectionTable: UICollectionView!
    var reuseIdentifier = "STCell"
    
    @IBOutlet var tableLine: UITableView!
    
    var strCatID = String()
    
    var arrMProducts = NSMutableArray()
    
    // MARK: - viewWillAppear Method
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true
        
        self.getProductList(strCategoryID: strCatID)
        tableLine.isHidden = true
        CollectionTable.isHidden = false
        
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
         
        
        let layout = CollectionTable.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: 170, height: 230)
        CollectionTable.register(UINib(nibName: "STCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        
        
        self.tableLine.register(UINib(nibName: "STCellTABLE", bundle: nil), forCellReuseIdentifier: "STCellTABLE")
        self.tableLine.separatorStyle = .singleLine
        
        let border = CALayer()
        let width = CGFloat(0.5)
        border.borderColor = UIColor(red: 65/255, green: 65/255, blue: 66/255, alpha: 1.0).cgColor
        border.frame = CGRect(x: 0, y: viewFilterListGrid.frame.size.height - width, width: viewFilterListGrid.frame.size.width, height: viewFilterListGrid.frame.size.height)
        border.borderWidth = width
        viewFilterListGrid.layer.addSublayer(border)
        viewFilterListGrid.layer.masksToBounds = true
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
    
    // MARK: - UICollectionView Delegate & DataSource Method
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return self.arrMProducts.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! STCell
        cell.contentView.backgroundColor = UIColor.white
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.cornerRadius = 0.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = true
   
        let dictemp: NSDictionary = self.arrMProducts[indexPath.item] as! NSDictionary
        
        let  strid = String(format: "%@", dictemp.value(forKey: "id") as! CVarArg)
        let  strname = String(format: "%@", dictemp.value(forKey: "name") as! CVarArg)
        let  strprice = String(format: "%@", dictemp.value(forKey: "price") as! CVarArg)
        let  strdisable_wishlist_button = String(format: "%@", dictemp.value(forKey: "isproductinwishlist") as! CVarArg) //0 1
        let  strproduct_type = String(format: "%@", dictemp.value(forKey: "product_type") as! CVarArg)
        let  strRating = String(format: "%@", dictemp.value(forKey: "Rating") as! CVarArg)
        
        let arrImages = dictemp.value(forKey: "images") as! NSArray
        let dictempImg: NSDictionary = arrImages[0] as! NSDictionary
        let  strsrc = String(format: "%@", dictempImg.value(forKey: "src") as! CVarArg)
        
        /*print(strid)
        print(strname)
        print(strprice)
        print(strproduct_type)
        print(strRating)
        print(strsrc)*/
        
        print(strdisable_wishlist_button)
       
        cell.lbl1.text = String(format: "%@%@", strprice,"SAR")
        cell.lbl2.text = strname
        cell.lbl3.text = String(format: "%@%@", strproduct_type,"")
        
        cell.imgvProduct.imageFromURL(urlString: strsrc)
        
        if strdisable_wishlist_button == "0" {
            cell.btnFav.setImage(UIImage(named: "favdeselected"), for: .normal)
            cell.btnFav.tag = indexPath.item
            cell.btnFav.addTarget(self, action: #selector(pressFavAdd), for: .touchUpInside)
        }
        else{
            cell.btnFav.setImage(UIImage(named: "favselected"), for: .normal)
        }
        
        cell.floatRatingView.backgroundColor = UIColor.clear
        cell.floatRatingView.delegate = self
        cell.floatRatingView.contentMode = UIView.ContentMode.center
        cell.floatRatingView.type = .floatRatings
        let lessPrecisePI = Double(strRating)
        cell.floatRatingView.rating = lessPrecisePI!
    
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let dictemp: NSDictionary = self.arrMProducts[indexPath.item] as! NSDictionary
        let  strid = String(format: "%@", dictemp.value(forKey: "id") as! CVarArg)
        
        let screenSize = UIScreen.main.bounds
        if (screenSize.height == 568.0){
        }
        else if (screenSize.height == 480.0){
        }
        else if(screenSize.height == 667.0){
            let storyBoard = UIStoryboard(name: "SectionTwo6S", bundle: nil)
            let ProductDetails = storyBoard.instantiateViewController(withIdentifier: "ProductDetails") as! ProductDetails
            ProductDetails.strID = strid
            ProductDetails.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(ProductDetails, animated: true)
        }
        else if(screenSize.height == 736.0){
            let storyBoard = UIStoryboard(name: "SectionTwo6SPlus", bundle: nil)
            let ProductDetails = storyBoard.instantiateViewController(withIdentifier: "ProductDetails") as! ProductDetails
            ProductDetails.strID = strid
            ProductDetails.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(ProductDetails, animated: true)
        }
        else if(screenSize.height == 812.0){
            let storyBoard = UIStoryboard(name: "SectionTwoXS", bundle: nil)
            let ProductDetails = storyBoard.instantiateViewController(withIdentifier: "ProductDetails") as! ProductDetails
            ProductDetails.strID = strid
            ProductDetails.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(ProductDetails, animated: true)
        }
        else{
            let storyBoard = UIStoryboard(name: "SectionTwoXSMAX", bundle: nil)
            let ProductDetails = storyBoard.instantiateViewController(withIdentifier: "ProductDetails") as! ProductDetails
            ProductDetails.strID = strid
            ProductDetails.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(ProductDetails, animated: true)
        }
    }
    
    //MARK: - add to wishlist Method
    @objc func pressFavAdd(sender: UIButton)
    {
        let dictemp: NSDictionary = self.arrMProducts[sender.tag] as! NSDictionary
        let  strid = String(format: "%@", dictemp.value(forKey: "id") as! CVarArg)
        self.postAddtoFav(strPId: strid)
    }
    
    // MARK: - tableView delegate and datasoruce Method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrMProducts.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 110.0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "STCellTABLE", for: indexPath) as! STCellTABLE
        
        //let rowimagename = "\(arrMProducts[indexPath.row])"
        
        //cell.imgvProduct.image = UIImage(named: rowimagename)
        //cell.lblname.text = "Saloman"
        //cell.lblCategory.text = "Fresh Fish | Oman"
        //cell.lblPrice.text = "47.00 AED"
        
        //cell.btnAddFav.addTarget(self, action: #selector(pressFavAddTable), for: .touchUpInside)
        
        //cell.floatRatingView.backgroundColor = UIColor.clear
        //cell.floatRatingView.delegate = self
        //cell.floatRatingView.contentMode = UIView.ContentMode.scaleAspectFit
        //cell.floatRatingView.type = .floatRatings
        //cell.floatRatingView.rating = 3.3
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
    }
    
    
    //MARK: - Add Wishlist Method
    @objc func pressFavAddTable() -> Void
    {
    }
    
    
    // MARK: - press ListGrid Method
    /*@IBAction func pressListGrid(_ sender: Any)
    {
        if btnListGrid.tag == 1
        {
            //list shown
            btnListGrid.tag = 2
            btnListGrid.setImage(UIImage(named: "grid"), for: .normal)
            tableLine.isHidden = false
            CollectionTable.isHidden = true
            tableLine.reloadData()
        }
        else if btnListGrid.tag == 2
        {
            //Grid shown
            btnListGrid.tag = 1
            btnListGrid.setImage(UIImage(named: "list"), for: .normal)
            tableLine.isHidden = true
            CollectionTable.isHidden = false
            CollectionTable.reloadData()
        }
    }*/
    
    // MARK: - press Sort Method
    @IBAction func pressSort(_ sender: Any)
    {
        let alert = UIAlertController(title: "", message: "Choose option", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Top rated", style: .default , handler:{ (UIAlertAction)in
            print("User click top rated")
        }))
        
        alert.addAction(UIAlertAction(title: "Low to high", style: .default , handler:{ (UIAlertAction)in
            print("User click Low to high")
        }))
        
        alert.addAction(UIAlertAction(title: "High to low", style: .default , handler:{ (UIAlertAction)in
            print("User click High to low")
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive , handler:{ (UIAlertAction)in
            print("User click Cancel")
        }))
       
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
    }
    
    // MARK: - press Filter Method
    @IBAction func pressFilter(_ sender: Any)
    {
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
    
    
    //MARK: - get ProductList method
    func getProductList(strCategoryID:String)
    {
        self.showLoadingMode()
        
        let strSlectedStoreID = String(format: "%@", UserDefaults.standard.string(forKey: "SelectedStoreID")!)
        
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
        
        let strapikey = String(format: "%@ %@", UserDefaults.standard.string(forKey: "token_type")!, UserDefaults.standard.string(forKey: "access_token")!)
        let strconnurl = String(format: "%@%@storeid=%@&category_id=%@&customer_id=%@&limit=%@&page=%@", Constants.conn.ConnUrl, "/api/products?",strSlectedStoreID,strCategoryID,strCustomerid,"10","1")
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
                    
                    let Data = dictemp.value(forKey: "Data") as! NSDictionary
                    let arrMProd = Data.value(forKey: "products") as! NSArray
                    self.arrMProducts = NSMutableArray(array: arrMProd)
                    print("arrMProducts --->",self.arrMProducts)
            
                    OperationQueue.main.addOperation {
                        self.CollectionTable.reloadData()
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
    
    //MARK: - get AddtoFav method
    func postAddtoFav(strPId:String)
    {
        self.showLoadingMode()
        
        let strSlectedStoreID = String(format: "%@", UserDefaults.standard.string(forKey: "SelectedStoreID")!)
        
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
        
        let dicshopping_cart_item:NSMutableDictionary? = ["quantity" : "1",
                                                          "shopping_cart_type" : "wishlist",
                                                          "product_id" : strPId,
                                                          "customer_id" : strCustomerid,
                                                          "storeid" : strSlectedStoreID,
                                                          ];
        print("dicshopping_cart_item ---->>>>>",dicshopping_cart_item as Any)
        
        let dicPostOverAll:NSMutableDictionary? = ["shopping_cart_item" : dicshopping_cart_item as Any];
        print("dicPostOverAll ---->>>>>",dicPostOverAll as Any)
        
        let strapikey = String(format: "%@ %@", UserDefaults.standard.string(forKey: "token_type")!, UserDefaults.standard.string(forKey: "access_token")!)
        let strconnurl = String(format: "%@%@", Constants.conn.ConnUrl, "/api/shopping_cart_items")
        let request = NSMutableURLRequest(url: NSURL(string: strconnurl)! as URL)
        request.httpMethod = "POST"
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
                    
                    let dictemp = json as NSDictionary
                    print("dictemp --->",dictemp)
                    
                    let Status = String(format: "%@", dictemp.value(forKey: "Status") as! CVarArg)
                    let ResponseMessage = String(format: "%@", dictemp.value(forKey: "ResponseMessage") as! CVarArg)
                    
                    OperationQueue.main.addOperation {
                        
                        if Status == "1"
                        {
                            self.arrMProducts.removeAllObjects()
                            self.getProductList(strCategoryID: self.strCatID)
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
