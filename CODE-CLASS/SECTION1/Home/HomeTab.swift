//
//  HomeTab.swift
//  Saudi Fisheries
//
//  Created by Sandipan on 18/01/19.
//  Copyright © 2019 SANDIPAN. All rights reserved.
//

import UIKit

class HomeTab: UIViewController,UIScrollViewDelegate {

    var loadingCircle = UIView()
    var circle = UIView()
    
    @IBOutlet var btnSlide: UIButton!
    @IBOutlet var btnSearch: UIButton!
    
    @IBOutlet var viewBanner: UIView!
    @IBOutlet var scrollBanner: UIScrollView!
    var pageControl = UIPageControl()
    
    var  arrMBanners = NSMutableArray()
    var  arrMStores = NSMutableArray()
    
    @IBOutlet var viewFreshProducts: UIView!
    @IBOutlet var lblFreshProducts: UILabel!
    @IBOutlet var scrollFreshProducts: UIScrollView!
    var  arrMFreshProducts = NSMutableArray()
    
    @IBOutlet var viewFrozenProducts: UIView!
    @IBOutlet var lblFrozenProducts: UILabel!
    @IBOutlet var scrollFrozenProducts: UIScrollView!
    var  arrMFrozenProducts = NSMutableArray()
    
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
        //self.tabBarController?.navigationController?.navigationBar.isHidden = true
        
        arrMFreshProducts = ["p1.jpg", "p2.jpg", "p3.jpg","p4.jpg"]
        arrMFrozenProducts = ["p1.jpg", "p2.jpg", "p3.jpg"]
       
        self.createFreshProductsSlide()
        self.createFrozenProductsSlide()
        
        let datanotSave = UserDefaults.standard.integer(forKey: "dataNotSave")
        print("datanotSave",datanotSave)
        if (datanotSave == 0)
        {
            print("call get authorization method")
            self.getAuthenticationToken()
        }
        else
        {
            print("not call get authorization method")
            self.getBannerUrl()
        }
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
    // MARK: - Search method
    @IBAction func pressSearch(_ sender: Any)
    {
    }
    
    // MARK: - create Banners Slider Method
    func pagecontrollerBanners() -> Void
    {
        self.automaticallyAdjustsScrollViewInsets=false
        scrollBanner.isPagingEnabled=true
        scrollBanner.showsHorizontalScrollIndicator=false
        scrollBanner.delegate=self;
        scrollBanner.backgroundColor=UIColor.white
        
        let widthhh = scrollBanner.bounds.size.width * CGFloat(arrMBanners.count)
        let heighttt = scrollBanner.bounds.size.height
        scrollBanner.contentSize=CGSize(width: widthhh, height: heighttt)
        
        self.pageControl = UIPageControl(frame: CGRect(x: 0, y: viewBanner.frame.size.height-50, width: 200, height: 60))
        self.pageControl.center = CGPoint (x: viewBanner.frame.size.width/2.0, y: viewBanner.frame.size.height/2.0+150)
        self.pageControl.numberOfPages = arrMBanners.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor(red: 0/255, green: 183/255, blue: 178/255, alpha: 1.0)
        self.pageControl.pageIndicatorTintColor = UIColor.white
        self.pageControl.currentPageIndicatorTintColor = UIColor(red: 0/255, green: 183/255, blue: 178/255, alpha: 1.0)
        self.view.addSubview(pageControl)
        self.view.bringSubviewToFront(pageControl)
        
        for x in 0 ..< arrMBanners.count
        {
            
            let widthhh = scrollBanner.bounds.size.width * CGFloat(x)
            
            let viewPage = UIView(frame: CGRect(x: widthhh, y: 0, width: viewBanner.frame.size.width, height: viewBanner.frame.size.height))
            viewPage.tag=x
            scrollBanner.addSubview(viewPage)
            
            let imgviconBG = UIImageView(frame: CGRect(x: 0, y: 0, width: viewPage.frame.size.width, height: viewPage.frame.size.height))
            imgviconBG.backgroundColor = UIColor.clear
            let dictemp: NSDictionary = arrMBanners[x] as! NSDictionary
            let  strimage = String(format: "%@", dictemp.value(forKey: "PictureUrl") as! CVarArg)
            print(strimage)
            imgviconBG.imageFromURL(urlString: strimage)
            viewPage.addSubview(imgviconBG)
        }
    }
    
    // MARK: - create Fresh Products Slider Method
    func createFreshProductsSlide() -> Void
    {
        self.automaticallyAdjustsScrollViewInsets=false
        scrollFreshProducts.isPagingEnabled=true
        scrollFreshProducts.showsHorizontalScrollIndicator=false
        scrollFreshProducts.delegate=self;
        scrollFreshProducts.backgroundColor=UIColor.clear
        
        let widthhh = scrollFreshProducts.bounds.size.width/2 * CGFloat(arrMFreshProducts.count)
        let heighttt = scrollFreshProducts.bounds.size.height
        scrollFreshProducts.contentSize=CGSize(width: widthhh, height: heighttt)
        
        for x in 0 ..< arrMFreshProducts.count
        {
            let viewPage = UIView(frame: CGRect(x: x * NSInteger(scrollFreshProducts.frame.size.width / 2) + 10 , y: 5, width: NSInteger(scrollFreshProducts.frame.size.width / 2)-20, height: NSInteger(scrollFreshProducts.frame.size.height)-10))
            viewPage.tag=x
            viewPage.backgroundColor = UIColor.white
            viewPage.layer.borderWidth = 1
            viewPage.layer.borderColor = UIColor.clear.cgColor
            viewPage.layer.masksToBounds = true
         
            let imgvProducts = UIImageView(frame: CGRect(x: 0, y: 0, width: viewPage.frame.size.width, height: viewPage.frame.size.height/2 + 15))
            imgvProducts.backgroundColor = UIColor.clear
            let rowimagename = "\(arrMFreshProducts[x])"
            imgvProducts.image = UIImage(named:rowimagename)
            viewPage.addSubview(imgvProducts)
            
            let lblNameType = UILabel(frame: CGRect(x: 0, y: imgvProducts.frame.maxY, width: viewPage.frame.size.width, height:20))
            lblNameType.textAlignment = .center
            lblNameType.textColor = UIColor(red: 65/255, green: 65/255, blue: 67/255, alpha: 1.0)
            lblNameType.backgroundColor = UIColor.clear
            lblNameType.text = " Sea Bream | Turkey"
            lblNameType.font = UIFont(name: "Dubai-Regular", size: 13.0)!
            viewPage.addSubview(lblNameType)
            
            let lblPriceUnit = UILabel(frame: CGRect(x: 0, y: lblNameType.frame.maxY, width: viewPage.frame.size.width, height:20))
            lblPriceUnit.textAlignment = .center
            lblPriceUnit.textColor = UIColor(red: 0/255, green: 183/255, blue: 178/255, alpha: 1.0)
            lblPriceUnit.backgroundColor = UIColor.clear
            lblPriceUnit.text = " 47.00 AED"
            lblPriceUnit.font = UIFont(name: "Dubai-Medium", size: 13.0)!
            viewPage.addSubview(lblPriceUnit)
            
            scrollFreshProducts.addSubview(viewPage)
        }
    }
    
    // MARK: - create Frozen Products Slider Method
    func createFrozenProductsSlide() -> Void
    {
        self.automaticallyAdjustsScrollViewInsets=false
        scrollFrozenProducts.isPagingEnabled=true
        scrollFrozenProducts.showsHorizontalScrollIndicator=false
              scrollFrozenProducts.delegate=self;
        scrollFrozenProducts.backgroundColor=UIColor.clear
        
        let widthhh = scrollFrozenProducts.bounds.size.width/2 * CGFloat(arrMFrozenProducts.count)
        let heighttt = scrollFrozenProducts.bounds.size.height
        scrollFrozenProducts.contentSize=CGSize(width: widthhh, height: heighttt)
        
        for x in 0 ..< arrMFrozenProducts.count
        {
            let viewPage = UIView(frame: CGRect(x: x * NSInteger(scrollFrozenProducts.frame.size.width / 3) + 5 , y: 2, width: NSInteger(scrollFrozenProducts.frame.size.width / 3)-10, height: NSInteger(scrollFrozenProducts.frame.size.height)-4))
            viewPage.tag=x
            viewPage.backgroundColor = UIColor.white
            viewPage.layer.borderWidth = 1
            viewPage.layer.borderColor = UIColor.clear.cgColor
            viewPage.layer.masksToBounds = true
            
            let imgvProducts = UIImageView(frame: CGRect(x: 5, y: 5, width: viewPage.frame.size.width-10, height: viewPage.frame.size.height/2 + 10))
            imgvProducts.backgroundColor = UIColor.clear
            let rowimagename = "\(arrMFrozenProducts[x])"
            imgvProducts.image = UIImage(named:rowimagename)
            viewPage.addSubview(imgvProducts)
            
            let lblNameType = UILabel(frame: CGRect(x: 0, y: imgvProducts.frame.maxY, width: viewPage.frame.size.width, height:20))
            lblNameType.textAlignment = .center
            lblNameType.textColor = UIColor(red: 65/255, green: 65/255, blue: 67/255, alpha: 1.0)
            lblNameType.backgroundColor = UIColor.clear
            lblNameType.text = " Sea Bream | Oman"
            lblNameType.font = UIFont(name: "Dubai-Regular", size: 13.0)!
            viewPage.addSubview(lblNameType)
            
            let lblPriceUnit = UILabel(frame: CGRect(x: 0, y: lblNameType.frame.maxY, width: viewPage.frame.size.width, height:20))
            lblPriceUnit.textAlignment = .center
            lblPriceUnit.textColor = UIColor(red: 0/255, green: 183/255, blue: 178/255, alpha: 1.0)
            lblPriceUnit.backgroundColor = UIColor.clear
            lblPriceUnit.text = " 47.00 AED"
            lblPriceUnit.font = UIFont(name: "Dubai-Medium", size: 13.0)!
            viewPage.addSubview(lblPriceUnit)
           
            scrollFrozenProducts.addSubview(viewPage)
        }
        
    }
    
    // MARK: - ScrollView Delegate Method
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        if scrollView.tag == 124
        {
            let pageWidth = scrollBanner.bounds.size.width
            let fractionalPage = scrollBanner.contentOffset.x / pageWidth
            let nearestNumber = lround(Double(fractionalPage))
            if (pageControl.currentPage != nearestNumber){
                pageControl.currentPage = nearestNumber ;
                if (scrollBanner.isDragging){
                    pageControl.updateCurrentPageDisplay()
                }
            }
        }
        else if scrollView.tag == 122
        {
        }
        else if scrollView.tag == 123
        {
        }
    }
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView)
    {
        print("end scroll")
        if scrollView.tag == 124
        {
            pageControl.updateCurrentPageDisplay()
        }
        else if scrollView.tag == 122
        {
        }
        else if scrollView.tag == 123
        {
        }
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView)
    {
        if scrollView.tag == 124
        {
            let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
            pageControl.currentPage = Int(pageNumber)
        }
        else if scrollView.tag == 122
        {
        }
        else if scrollView.tag == 123
        {
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
    
    
    //MARK: - get AuthenticationToken method
    func getAuthenticationToken()
    {
        self.showLoadingMode()
        
        let strconnurl = String(format: "%@%@client_id=%@&redirect_uri=%@AccessTokens&response_type=%@&client_secretekey=%@", Constants.conn.ConnUrl, "oauth/authorize?","admin",Constants.conn.ConnUrl,"code","admin")
        let request = NSMutableURLRequest(url: NSURL(string: strconnurl)! as URL)
        request.httpMethod = "GET"
        //request.setValue(strauthkey, forHTTPHeaderField: "Authorization")
        //request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
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
                    let access_token = String(format: "%@", Data.value(forKey: "access_token") as! CVarArg)
                    let expires_in = String(format: "%@", Data.value(forKey: "expires_in") as! CVarArg)
                    let token_type = String(format: "%@", Data.value(forKey: "token_type") as! CVarArg)
                    let refresh_token = String(format: "%@", Data.value(forKey: "refresh_token") as! CVarArg)
                   
                    print("Status",Status)
                    print("ResponseMessage",ResponseMessage)
                    print("Data",Data)
                    print("access_token",access_token)
                    print("expires_in",expires_in)
                    print("token_type",token_type)
                    print("refresh_token",refresh_token)
                    
                    UserDefaults.standard.set(access_token, forKey: "access_token")
                    UserDefaults.standard.set(expires_in, forKey: "expires_in")
                    UserDefaults.standard.set(token_type, forKey: "token_type")
                    UserDefaults.standard.set(refresh_token, forKey: "refresh_token")
                    UserDefaults.standard.set(1, forKey: "dataNotSave")
                    UserDefaults.standard.synchronize()
                    
                    OperationQueue.main.addOperation {
                        self.getStoreList()
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
    
    //MARK: - get StoreList method
    func getStoreList()
    {
        self.showLoadingMode()
        
        let strapikey = String(format: "%@ %@", UserDefaults.standard.string(forKey: "token_type")!, UserDefaults.standard.string(forKey: "access_token")!)
        let strconnurl = String(format: "%@%@", Constants.conn.ConnUrl, "/api/stores")
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
                    let arrMStore = Data.value(forKey: "stores") as! NSArray
                    self.arrMStores = NSMutableArray(array: arrMStore)
                    print("arrMStores --->",self.arrMStores)
                    
                    let dicFirstIndex = self.arrMStores.object(at: 0) as! NSDictionary
                    let SelectedStoreID = String(format: "%@", dicFirstIndex.value(forKey: "StoreID") as! CVarArg)
                    let SelectedStoreNAME = String(format: "%@", dicFirstIndex.value(forKey: "StoreID") as! CVarArg)
                    
                    OperationQueue.main.addOperation {
                        self.getBannerUrl()
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
    
    //MARK: - get BannerUrl method
    func getBannerUrl()
    {
        self.showLoadingMode()
        
        let strapikey = String(format: "%@ %@", UserDefaults.standard.string(forKey: "token_type")!, UserDefaults.standard.string(forKey: "access_token")!)
        let strconnurl = String(format: "%@%@", Constants.conn.ConnUrl, "api/getbannerbystoreid/1")
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
                    
                    let arrMGallery = json.value(forKey: "Data") as! NSArray
                    self.arrMBanners = NSMutableArray(array: arrMGallery)
                    print("arrMBanners --->",self.arrMBanners)
                    
                    OperationQueue.main.addOperation {
                        self.pagecontrollerBanners()
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
extension UIImageView {
    public func imageFromURL(urlString: String) {
        let activityIndicator = UIActivityIndicatorView(style: .gray)
        activityIndicator.color =  UIColor(red: 78.0/255, green: 129.0/255, blue: 237.0/255, alpha: 1.0)
        activityIndicator.frame = CGRect.init(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        activityIndicator.startAnimating()
        //if self.image == nil{
        //self.addSubview(activityIndicator)
        //}
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
            if error != nil {
                print(error ?? "No Error")
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                activityIndicator.removeFromSuperview()
                self.image = image
            })
            
        }).resume()
    }
}
