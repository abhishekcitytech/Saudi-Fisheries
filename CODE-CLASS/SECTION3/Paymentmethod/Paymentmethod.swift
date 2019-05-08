//
//  Paymentmethod.swift
//  Saudi Fisheries
//
//  Created by Sandipan on 01/05/19.
//  Copyright © 2019 SANDIPAN. All rights reserved.
//

import UIKit

class Paymentmethod: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource
{
    var loadingCircle = UIView()
    var circle = UIView()
    
    var selectedIndexPath: IndexPath?
    
    @IBOutlet var colList: UICollectionView!
    var reuseIdentifier = "PMCell"
    
    var arrMPaymentMethod = NSMutableArray()
    
    // MARK: - viewWillAppear Method
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true
        
    }
    
    // MARK: - viewDidAppear Method
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        self.getPaymentMethodList()
    }
    
    // MARK: - viewDidLoad method
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //let myAppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let layout = colList.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: 160, height: 160)
        colList.register(UINib(nibName: "PMCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    // MARK: - press Back method
    @IBAction func pressBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - UICollectionView Delegate & DataSource Method
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return self.arrMPaymentMethod.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! PMCell
        cell.backgroundColor = UIColor.white
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.cornerRadius = 3.0
        cell.contentView.layer.borderColor = UIColor.lightGray.cgColor
        cell.contentView.layer.masksToBounds = true
        
        if selectedIndexPath != nil && indexPath == selectedIndexPath {
            cell.backgroundColor = UIColor(red: 178/255, green: 210/255, blue: 51/255, alpha: 1.0)
            
        }else{
            
            cell.backgroundColor = UIColor.white
        }
        
        let dictemp: NSDictionary = arrMPaymentMethod[indexPath.row] as! NSDictionary
        let  str1 = String(format: "%@", dictemp.value(forKey: "Name") as! CVarArg)
        let  str2 = String(format: "%@", dictemp.value(forKey: "Description") as! CVarArg)
        let  str3 = String(format: "%@", dictemp.value(forKey: "Fee") as! CVarArg)
        let  str4 = String(format: "%@", dictemp.value(forKey: "LogoUrl") as! CVarArg)
        let  str5 = String(format: "%@", dictemp.value(forKey: "PaymentMethodSystemName") as! CVarArg)
        
        cell.lbl1.textColor = UIColor.darkGray
        cell.lbl1.text = str1
        cell.imgvLogo.imageFromURL(urlString: str4)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 5, left:5, bottom:5, right:5)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let cell = collectionView.cellForItem(at: indexPath) as! PMCell
        cell.backgroundColor =  UIColor(red: 178/255, green: 210/255, blue: 51/255, alpha: 1.0)
        self.selectedIndexPath = indexPath
        cell.lbl1.textColor = UIColor.white
        
        let dictemp: NSDictionary = arrMPaymentMethod[indexPath.row] as! NSDictionary
        let  str1 = String(format: "%@", dictemp.value(forKey: "Name") as! CVarArg)
        let  str2 = String(format: "%@", dictemp.value(forKey: "Description") as! CVarArg)
        let  str3 = String(format: "%@", dictemp.value(forKey: "Fee") as! CVarArg)
        let  str4 = String(format: "%@", dictemp.value(forKey: "LogoUrl") as! CVarArg)
        let  str5 = String(format: "%@", dictemp.value(forKey: "PaymentMethodSystemName") as! CVarArg)
        
        self.setPaymentMethod(strSysName:str5)
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath)
    {
        let cell: PMCell = collectionView.cellForItem(at: indexPath) as! PMCell
        cell.backgroundColor = UIColor.white
        cell.lbl1.textColor = UIColor.darkGray
        selectedIndexPath = nil
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
    
    //MARK: - get Payment Method List method
    func getPaymentMethodList()
    {
        self.showLoadingMode()
        
        let dicUser = UserDefaults.standard.value(forKey: "RegisteredUserDetails") as! NSMutableDictionary
        let  strCustomerid = String(format: "%@", dicUser.value(forKey: "id") as! CVarArg)
        let strSlectedStoreID = String(format: "%@", UserDefaults.standard.string(forKey: "SelectedStoreID")!)
        
        let strapikey = String(format: "%@ %@", UserDefaults.standard.string(forKey: "token_type")!, UserDefaults.standard.string(forKey: "access_token")!)
        let strconnurl = String(format: "%@%@customerId=%@&storeId=%@", Constants.conn.ConnUrl, "/api/getpaymentmethod?",strCustomerid,strSlectedStoreID)
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
                    let arrMpm = Data.value(forKey: "PaymentMethods") as! NSArray
                    self.arrMPaymentMethod = NSMutableArray(array: arrMpm)
                    print("arrMPaymentMethod --->",self.arrMPaymentMethod)
                    
                    OperationQueue.main.addOperation {
                        self.colList.reloadData()
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
    
    //MARK: - setPaymentMethod method
    func setPaymentMethod(strSysName:String)
    {
        self.showLoadingMode()
        
        let dicUser = UserDefaults.standard.value(forKey: "RegisteredUserDetails") as! NSMutableDictionary
        let  strCustomerid = String(format: "%@", dicUser.value(forKey: "id") as! CVarArg)
        let strSlectedStoreID = String(format: "%@", UserDefaults.standard.string(forKey: "SelectedStoreID")!)
        
        let strapikey = String(format: "%@ %@", UserDefaults.standard.string(forKey: "token_type")!, UserDefaults.standard.string(forKey: "access_token")!)
        let strconnurl = String(format: "%@%@customerId=%@&storeId=%@&paymentmethod=%@", Constants.conn.ConnUrl, "/api/savepaymentmethod?",strCustomerid,strSlectedStoreID,strSysName)
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
                                let OrderReview = storyBoard.instantiateViewController(withIdentifier: "OrderReview") as! OrderReview
                                OrderReview.hidesBottomBarWhenPushed = true
                                self.navigationController?.pushViewController(OrderReview, animated: true)
                            }
                            else if(screenSize.height == 736.0){
                                let storyBoard = UIStoryboard(name: "SectionThree6SPlus", bundle: nil)
                                let OrderReview = storyBoard.instantiateViewController(withIdentifier: "OrderReview") as! OrderReview
                                OrderReview.hidesBottomBarWhenPushed = true
                                self.navigationController?.pushViewController(OrderReview, animated: true)
                            }
                            else if(screenSize.height == 812.0){
                                let storyBoard = UIStoryboard(name: "SectionThreeXS", bundle: nil)
                                let OrderReview = storyBoard.instantiateViewController(withIdentifier: "OrderReview") as! OrderReview
                                OrderReview.hidesBottomBarWhenPushed = true
                                self.navigationController?.pushViewController(OrderReview, animated: true)
                            }
                            else{
                                let storyBoard = UIStoryboard(name: "SectionThreeXSMAX", bundle: nil)
                                let OrderReview = storyBoard.instantiateViewController(withIdentifier: "OrderReview") as! OrderReview
                                OrderReview.hidesBottomBarWhenPushed = true
                                self.navigationController?.pushViewController(OrderReview, animated: true)
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
