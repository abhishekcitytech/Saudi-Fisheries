//
//  ProductDetails.swift
//  Saudi Fisheries
//
//  Created by Sandipan on 24/01/19.
//  Copyright © 2019 SANDIPAN. All rights reserved.
//

import UIKit

class ProductDetails: UIViewController,UIScrollViewDelegate,FloatRatingViewDelegate,UITextViewDelegate
{
    var loadingCircle = UIView()
    var circle = UIView()
    
    var strID = String()
    
    
    @IBOutlet var btnBack: UIButton!
    @IBOutlet var btnFav: UIButton!
    @IBOutlet var btnShare: UIButton!
    
    @IBOutlet var scrollOverAll: UIScrollView!
    
    @IBOutlet var viewGallery: UIView!
    @IBOutlet var scrollGallery: UIScrollView!
    
    @IBOutlet var viewMiddle: UIView!
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblOrigin: UILabel!
    @IBOutlet var lblCategory: UILabel!
    @IBOutlet var viewReviewFeebcak: FloatRatingView!
    
    //----------- SIZE ----------------//
    @IBOutlet var viewMiddle1: UIView!
    @IBOutlet var viewmid11: UIView!
    @IBOutlet var btnviewmid11Selection: UIButton!
    @IBOutlet var lblviewmid11Title: UILabel!
    @IBOutlet var lblviewmid11SubTitle: UILabel!
    
    
    @IBOutlet var viewmid22: UIView!
    @IBOutlet var btnviewmid22Selection: UIButton!
    @IBOutlet var lblviewmid22Title: UILabel!
    @IBOutlet var lblviewmid22SubTitle: UILabel!
    
    
    @IBOutlet var viewmid33: UIView!
    @IBOutlet var btnviewmid33Selection: UIButton!
    @IBOutlet var lblviewmid33Title: UILabel!
    @IBOutlet var lblviewmid33SubTitle: UILabel!
    
    
    //----------- MODE OF PURCHASE ----------------//
    @IBOutlet var viewMiddle23: UIView!
    @IBOutlet var lblSelectPurchaseProcedure: UILabel!
    @IBOutlet var lblRow: UILabel!
    @IBOutlet var lblService: UILabel!
    @IBOutlet var btnRow: UIButton!
    @IBOutlet var btnSevrice: UIButton!
    
    //----------- INSTRUCTIONS ----------------//
    @IBOutlet var viewMiddle2: UIView!
    @IBOutlet var lblInstructions2: UILabel!
    @IBOutlet var btnClean: UIButton!
    @IBOutlet var lblClean: UILabel!
    @IBOutlet var btnCleanCheckbox: UIButton!
    @IBOutlet var btnSlice: UIButton!
    @IBOutlet var lblSlice: UILabel!
    @IBOutlet var btnSliceCheckbox: UIButton!
    @IBOutlet var btnFillet: UIButton!
    @IBOutlet var lblFillet: UILabel!
    @IBOutlet var btnFilletCheckbox: UIButton!
    
    //----------- SERVICES ----------------//
    @IBOutlet var viewMiddle3: UIView!
    @IBOutlet var lblInstructions3: UILabel!
    @IBOutlet var btnFry: UIButton!
    @IBOutlet var lblFry: UILabel!
    @IBOutlet var btnFryCheckbox: UIButton!
    @IBOutlet var btnCook: UIButton!
    @IBOutlet var lblCook: UILabel!
    @IBOutlet var btnCookCheckbox: UIButton!
    
    //----------- COMMENTS ----------------//
    @IBOutlet var viewMiddle4: UIView!
    @IBOutlet var lblComments4: UILabel!
    @IBOutlet var txtVComments: UITextView!
    
    @IBOutlet var viewBottom1: UIView!
    @IBOutlet var btnAddtoCart: UIButton!
    @IBOutlet var viewQTY: UIView!
    @IBOutlet var lblProductPrice: UILabel!
    @IBOutlet var btnMinus: UIButton!
    @IBOutlet var btnPlus: UIButton!
    @IBOutlet var txtQTY: UITextField!
    
    var pageControl = UIPageControl()
    var  arrMBanners = NSMutableArray()
    
    var  arrMAttributes = NSMutableArray()
    
    var  arrMproduct_attributes = NSMutableArray()
    
    var  dicSizeAttr = NSMutableDictionary()
    var  dicModeofPurchaseAttr = NSMutableDictionary()
    var  dicInstructionsAttr = NSMutableDictionary()
    var  dicServicesAttr = NSMutableDictionary()
    var  dicCommentsAttr = NSMutableDictionary()
    
    // MARK: - viewWillAppear Method
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true
        
        viewMiddle1.isHidden = false
        viewMiddle23.isHidden = false
        btnRow.isSelected = true
        btnSevrice.isSelected = false
        viewMiddle2.isHidden = false
        viewMiddle3.isHidden = true
        viewMiddle4.isHidden = true
        btnviewmid11Selection.isSelected = true
        btnviewmid22Selection.isSelected = false
        btnviewmid33Selection.isSelected = false
        btnCleanCheckbox.isSelected = true
        btnSliceCheckbox.isSelected = false
        btnFilletCheckbox.isSelected = false
        btnFryCheckbox.isSelected = false
        btnCookCheckbox.isSelected = false
        
        self.getProductDetails(strPId: strID)
        
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
        
        scrollOverAll.contentSize = CGSize(width: scrollOverAll.frame.size.width, height: 450)
        
        let border = CALayer()
        let width = CGFloat(0.5)
        border.borderColor = UIColor(red: 65/255, green: 65/255, blue: 66/255, alpha: 1.0).cgColor
        border.frame = CGRect(x: 0, y: viewmid11.frame.size.height - width, width: viewmid11.frame.size.width, height: viewmid11.frame.size.height)
        border.borderWidth = width
        viewmid11.layer.addSublayer(border)
        viewmid11.layer.masksToBounds = true
        
        let border1 = CALayer()
        let width1 = CGFloat(0.5)
        border1.borderColor = UIColor(red: 65/255, green: 65/255, blue: 66/255, alpha: 1.0).cgColor
        border1.frame = CGRect(x: 0, y: viewmid22.frame.size.height - width1, width: viewmid22.frame.size.width, height: viewmid22.frame.size.height)
        border1.borderWidth = width1
        viewmid22.layer.addSublayer(border1)
        viewmid22.layer.masksToBounds = true
        
        let border2 = CALayer()
        let width2 = CGFloat(0.5)
        border2.borderColor = UIColor(red: 65/255, green: 65/255, blue: 66/255, alpha: 1.0).cgColor
        border2.frame = CGRect(x: 0, y: viewmid33.frame.size.height - width2, width: viewmid33.frame.size.width, height: viewmid33.frame.size.height)
        border2.borderWidth = width2
        viewmid33.layer.addSublayer(border2)
        viewmid33.layer.masksToBounds = true
        
        viewQTY.layer.borderColor = UIColor.lightGray.cgColor
        viewQTY.layer.borderWidth = 1.0
        viewQTY.layer.cornerRadius = 2.0
        viewQTY.layer.masksToBounds = true
        
        txtVComments.layer.borderColor = UIColor.lightGray.cgColor
        txtVComments.layer.borderWidth = 1.0
        txtVComments.layer.cornerRadius = 4.0
        txtVComments.layer.masksToBounds = true
    }
    
    // MARK: - pressBack method
    @IBAction func pressBack(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: - press small - medium - large method
    @IBAction func pressbtnviewmid11Selection(_ sender: Any)
    {
        if btnviewmid11Selection.isSelected == true {
        }
        else{
            btnviewmid11Selection.isSelected = true
            btnviewmid22Selection.isSelected = false
            btnviewmid33Selection.isSelected = false
            
            dicSizeAttr = ["value" : btnviewmid11Selection.tag ,"id" : viewMiddle1.tag];
        }
    }
    @IBAction func pressbtnviewmid22Selection(_ sender: Any)
    {
        if btnviewmid22Selection.isSelected == true {
        }
        else{
            btnviewmid11Selection.isSelected = false
            btnviewmid22Selection.isSelected = true
            btnviewmid33Selection.isSelected = false
            
            dicSizeAttr = ["value" : btnviewmid22Selection.tag ,"id" : viewMiddle1.tag];
        }
    }
    @IBAction func pressbtnviewmid33Selection(_ sender: Any)
    {
        if btnviewmid33Selection.isSelected == true {
        }
        else{
            btnviewmid11Selection.isSelected = false
            btnviewmid22Selection.isSelected = false
            btnviewmid33Selection.isSelected = true
            
            dicSizeAttr = ["value" : btnviewmid33Selection.tag ,"id" : viewMiddle1.tag];
        }
    }
    
    // MARK: - pressRow && pressService method
    @IBAction func pressRow(_ sender: UIButton)
    {
        if btnRow.isSelected == true {
            //
        }
        else{
            btnRow.isSelected = true
            btnSevrice.isSelected = false
            viewMiddle2.isHidden = false
            viewMiddle3.isHidden = true
            viewMiddle4.isHidden = true
            btnCleanCheckbox.isSelected = true
            btnSliceCheckbox.isSelected = false
            btnFilletCheckbox.isSelected = false
            btnFryCheckbox.isSelected = false
            btnCookCheckbox.isSelected = false
            
            scrollOverAll.contentSize = CGSize(width: scrollOverAll.frame.size.width, height: 450)
            
            dicModeofPurchaseAttr = ["value" : btnRow.tag ,"id" : viewMiddle23.tag];
            dicInstructionsAttr = ["value" : btnCleanCheckbox.tag ,"id" : viewMiddle2.tag];

            if dicServicesAttr.count > 0{
                dicServicesAttr.removeAllObjects()
                dicCommentsAttr.removeAllObjects()
            }
        }
    }
    @IBAction func pressService(_ sender: UIButton)
    {
        if btnSevrice.isSelected == true {
            //
        }
        else{
            btnRow.isSelected = false
            btnSevrice.isSelected = true
            viewMiddle2.isHidden = true
            viewMiddle3.isHidden = false
            viewMiddle4.isHidden = false
            btnCleanCheckbox.isSelected = false
            btnSliceCheckbox.isSelected = false
            btnFilletCheckbox.isSelected = false
            btnFryCheckbox.isSelected = true
            btnCookCheckbox.isSelected = false
            
            scrollOverAll.contentSize = CGSize(width: scrollOverAll.frame.size.width, height: 600)
            
            dicModeofPurchaseAttr = ["value" : btnSevrice.tag ,"id" : viewMiddle23.tag];
            dicServicesAttr = ["value" : btnFryCheckbox.tag ,"id" : viewMiddle3.tag];
            dicCommentsAttr = ["value" : txtVComments.text! ,"id" : viewMiddle4.tag];
            
            if dicInstructionsAttr.count > 0{
                dicInstructionsAttr.removeAllObjects()
            }
        }
    }
    
    // MARK: - pressCleanCheckBox && pressSliceCheckBox && pressFilletCheckBox method
    @IBAction func pressCleanCheckBox(_ sender: UIButton)
    {
        if btnCleanCheckbox.isSelected == true {
            //
        }
        else{
            btnCleanCheckbox.isSelected = true
            btnSliceCheckbox.isSelected = false
            btnFilletCheckbox.isSelected = false
            
            dicInstructionsAttr = ["value" : btnCleanCheckbox.tag ,"id" : viewMiddle2.tag];
        }
    }
    @IBAction func pressSliceCheckBox(_ sender: UIButton)
    {
        if btnSliceCheckbox.isSelected == true {
            //
        }
        else{
            btnCleanCheckbox.isSelected = false
            btnSliceCheckbox.isSelected = true
            btnFilletCheckbox.isSelected = false
            
            dicInstructionsAttr = ["value" : btnSliceCheckbox.tag ,"id" : viewMiddle2.tag];
        }
    }
    @IBAction func pressFilletCheckBox(_ sender: UIButton)
    {
        if btnFilletCheckbox.isSelected == true {
            //
        }
        else{
            btnCleanCheckbox.isSelected = false
            btnSliceCheckbox.isSelected = false
            btnFilletCheckbox.isSelected = true
            
            dicInstructionsAttr = ["value" : btnFilletCheckbox.tag ,"id" : viewMiddle2.tag];
        }
    }
    
    // MARK: - pressFryCheckBox && pressCookCheckBox method
    @IBAction func pressFryCheckBox(_ sender: UIButton)
    {
        if btnFryCheckbox.isSelected == true {
            //
        }
        else{
            btnFryCheckbox.isSelected = true
            btnCookCheckbox.isSelected = false
            
            dicServicesAttr = ["value" : btnFryCheckbox.tag ,"id" : viewMiddle3.tag];
            dicCommentsAttr = ["value" : txtVComments.text! ,"id" : viewMiddle4.tag];
        }
    }
    @IBAction func pressCookCheckBox(_ sender: UIButton)
    {
        if btnCookCheckbox.isSelected == true {
            //
        }
        else{
            btnFryCheckbox.isSelected = false
            btnCookCheckbox.isSelected = true
            
            dicServicesAttr = ["value" : btnCookCheckbox.tag ,"id" : viewMiddle3.tag];
            dicCommentsAttr = ["value" : txtVComments.text! ,"id" : viewMiddle4.tag];
        }
    }
    
    // MARK: - pressMinus Plus method
    @IBAction func pressMinus(_ sender: Any)
    {
    }
    @IBAction func pressPlus(_ sender: Any)
    {
    }
    
    // MARK: - pressAddtoCart method
    @IBAction func pressAddtoCart(_ sender: Any)
    {
        print("dicSizeAttr :",dicSizeAttr)
        print("dicModeofPurchaseAttr :",dicModeofPurchaseAttr)
        print("dicInstructionsAttr :",dicInstructionsAttr)
        print("dicServicesAttr :",dicServicesAttr)
        print("dicCommentsAttr :",dicCommentsAttr)
        
        if dicSizeAttr.count > 0
        {
            //Select  size
            arrMproduct_attributes.add(dicSizeAttr)
        }
        if dicModeofPurchaseAttr.count > 0
        {
            //Select  mode of purchase
            arrMproduct_attributes.add(dicModeofPurchaseAttr)
        }
        if dicInstructionsAttr.count > 0
        {
            //Select  instructions
            arrMproduct_attributes.add(dicInstructionsAttr)
        }
        if dicServicesAttr.count > 0
        {
            //Select  services
            arrMproduct_attributes.add(dicServicesAttr)
        }
        if dicCommentsAttr.count > 0
        {
            //Select  comments
            arrMproduct_attributes.add(dicCommentsAttr)
        }
        if txtQTY.text != "0"
        {
            //Quantity will not zero
        }
        
        print("arrMproduct_attributes >>><<<<",arrMproduct_attributes)
        self.postAddtoCart(strPId: strID, arrMattr: arrMproduct_attributes)
    }
    
    // MARK: - pressFav && pressShare method
    @IBAction func pressFav(_ sender: Any)
    {
         self.postAddtoFav(strPId: strID)
    }
    @IBAction func pressShare(_ sender: Any)
    {
    }
    
    // MARK: - pagecontroller Gallery Method
    func pagecontrollerGallery() -> Void
    {
        self.automaticallyAdjustsScrollViewInsets=false
        scrollGallery.isPagingEnabled=true
        scrollGallery.showsHorizontalScrollIndicator=false
        scrollGallery.delegate=self;
        scrollGallery.backgroundColor=UIColor.white
        
        let widthhh = scrollGallery.bounds.size.width * CGFloat(arrMBanners.count)
        let heighttt = scrollGallery.bounds.size.height
        scrollGallery.contentSize=CGSize(width: widthhh, height: heighttt)
        
        self.pageControl = UIPageControl(frame: CGRect(x: 0, y: viewGallery.frame.size.height-20, width: 200, height: 20))
        self.pageControl.center = CGPoint (x: viewGallery.frame.size.width/2.0, y: viewGallery.frame.size.height/2.0+100)
        self.pageControl.numberOfPages = arrMBanners.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor(red: 0/255, green: 183/255, blue: 178/255, alpha: 1.0)
        self.pageControl.pageIndicatorTintColor = UIColor.white
        self.pageControl.currentPageIndicatorTintColor = UIColor(red: 0/255, green: 183/255, blue: 178/255, alpha: 1.0)
        scrollOverAll.addSubview(pageControl)
        scrollOverAll.bringSubviewToFront(pageControl)
        
        for x in 0 ..< arrMBanners.count
        {
            print("pages",x)
            let widthhh = scrollGallery.bounds.size.width * CGFloat(x)
            
            let viewPage = UIView(frame: CGRect(x: widthhh, y: 0, width: viewGallery.frame.size.width, height: viewGallery.frame.size.height))
            viewPage.tag=x
            scrollGallery.addSubview(viewPage)
            
            let imgviconBG = UIImageView(frame: CGRect(x: 0, y: 0, width: viewPage.frame.size.width, height: viewPage.frame.size.height))
            imgviconBG.backgroundColor = UIColor.clear
            let dictemp: NSDictionary = arrMBanners[x] as! NSDictionary
            let  strimage = String(format: "%@", dictemp.value(forKey: "src") as! CVarArg)
            print(strimage)
            imgviconBG.imageFromURL(urlString: strimage)
            viewPage.addSubview(imgviconBG)
        }
    }
    
    // MARK: - ScrollView Delegate Method
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        if scrollView.tag == 222
        {
            let pageWidth = scrollGallery.bounds.size.width
            let fractionalPage = scrollGallery.contentOffset.x / pageWidth
            let nearestNumber = lround(Double(fractionalPage))
            if (pageControl.currentPage != nearestNumber){
                pageControl.currentPage = nearestNumber ;
                if (scrollGallery.isDragging){
                    pageControl.updateCurrentPageDisplay()
                }
            }
        }
        else if scrollView.tag == 224
        {
        }
    }
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView)
    {
        print("end scroll")
        if scrollView.tag == 222
        {
            pageControl.updateCurrentPageDisplay()
        }
        else if scrollView.tag == 224
        {
        }
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView)
    {
        if scrollView.tag == 222
        {
            let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
            pageControl.currentPage = Int(pageNumber)
        }
        else if scrollView.tag == 224
        {
        }
    }
    
    
    // MARK: - UITextView Delegate Method
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool{
        return true;
    }
    func textViewDidBeginEditing(_ textView: UITextView){
    }
    func textViewDidEndEditing(_ textView: UITextView){
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool{
        if (text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    func textViewDidChange(_ textView: UITextView){
    }
    func textViewDidChangeSelection(_ textView: UITextView){
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
    
    //MARK: - get ProductDetails method
    func getProductDetails(strPId:String)
    {
        self.showLoadingMode()
        
        let strapikey = String(format: "%@ %@", UserDefaults.standard.string(forKey: "token_type")!, UserDefaults.standard.string(forKey: "access_token")!)
        let strconnurl = String(format: "%@%@%@", Constants.conn.ConnUrl, "/api/products/",strPId)
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
                    
                    let dictempDetails: NSDictionary = arrMProd[0] as! NSDictionary
                    print("ProductDetails",dictempDetails)
                    
                    let  strid = String(format: "%@", dictempDetails.value(forKey: "id") as! CVarArg)
                    let  strname = String(format: "%@", dictempDetails.value(forKey: "name") as! CVarArg)
                    let  strprice = String(format: "%@", dictempDetails.value(forKey: "price") as! CVarArg)
                    let  strdisable_wishlist_button = String(format: "%@", dictempDetails.value(forKey: "disable_wishlist_button") as! CVarArg) //0 1
                    let  strproduct_type = String(format: "%@", dictempDetails.value(forKey: "product_type") as! CVarArg)
                    let  strRating = String(format: "%@", dictempDetails.value(forKey: "Rating") as! CVarArg)
                    
                    let arrImages = dictempDetails.value(forKey: "images") as! NSArray
                    self.arrMBanners = NSMutableArray(array: arrImages)
                    //print("arrMBanners --->",self.arrMBanners)
                    
                    let arrattributes = dictempDetails.value(forKey: "attributes") as! NSArray
                    self.arrMAttributes = NSMutableArray(array: arrattributes)
                    print("arrMAttributes --->",self.arrMAttributes)
                    
                    let  strorder_minimum_quantity = String(format: "%@", dictempDetails.value(forKey: "order_minimum_quantity") as! CVarArg)
                    
                    OperationQueue.main.addOperation {
                        
                        self.lblName.text = strname
                        self.lblOrigin.text = String(format: "%@%@", "Origin: ",strproduct_type)
                        self.lblCategory.text = String(format: "%@%@", "Category: ",strproduct_type)
                        self.lblProductPrice.text = String(format: "%@%@", strprice,"SAR")
                        self.txtQTY.text = String(format: "%@", strorder_minimum_quantity)
                        
                        self.viewReviewFeebcak.backgroundColor = UIColor.clear
                        self.viewReviewFeebcak.delegate = self
                        self.viewReviewFeebcak.contentMode = UIView.ContentMode.center
                        self.viewReviewFeebcak.type = .floatRatings
                        let lessPrecisePI = Double(strRating)
                        self.viewReviewFeebcak.rating = lessPrecisePI!
                        
                        if strdisable_wishlist_button == "0" {
                            self.btnFav.setImage(UIImage(named: "favdeselected"), for: .normal)
                        }else{
                            self.btnFav.setImage(UIImage(named: "favselected"), for: .normal)
                        }
                        
                        self.pagecontrollerGallery()
                        
                        for x in 0 ..< self.arrMAttributes.count
                        {
                            let dictemp: NSDictionary = self.arrMAttributes[x] as! NSDictionary
                            
                            let  strid = String(format: "%@", dictemp.value(forKey: "id") as! CVarArg)
                            let  strproduct_attribute_name = String(format: "%@", dictemp.value(forKey: "product_attribute_name") as! CVarArg)
                            
                            if strproduct_attribute_name == "Size"
                            {
                                self.viewMiddle1.tag = Int(strid)!
                                
                                let attribute_values = dictemp.value(forKey: "attribute_values") as! NSArray
                                for xxx in 0 ..< attribute_values.count
                                {
                                    let dictemp1: NSDictionary = attribute_values[xxx] as! NSDictionary
                                    let  strID = String(format: "%@", dictemp1.value(forKey: "id") as! CVarArg)
                                    var  strVALUE = String(format: "%@", dictemp1.value(forKey: "name") as! CVarArg)
                                    strVALUE = strVALUE.lowercased()
                                    print(strVALUE)
                                    
                                    if strVALUE == "small"{
                                        self.btnviewmid11Selection.tag = Int(strID)!
                                        self.lblviewmid11Title.text = strVALUE
                                    }
                                    else if strVALUE == "medium"{
                                        self.btnviewmid22Selection.tag = Int(strID)!
                                        self.lblviewmid22Title.text = strVALUE
                                    }
                                    else if strVALUE == "large"{
                                        self.btnviewmid33Selection.tag = Int(strID)!
                                        self.lblviewmid33Title.text = strVALUE
                                    }
                                }
                            }
                            else if strproduct_attribute_name == "Mode of purchase"
                            {
                                self.viewMiddle23.tag = Int(strid)!
                                
                                let attribute_values = dictemp.value(forKey: "attribute_values") as! NSArray
                                for xxx in 0 ..< attribute_values.count
                                {
                                    let dictemp1: NSDictionary = attribute_values[xxx] as! NSDictionary
                                    let  strID = String(format: "%@", dictemp1.value(forKey: "id") as! CVarArg)
                                    var  strVALUE = String(format: "%@", dictemp1.value(forKey: "name") as! CVarArg)
                                    strVALUE = strVALUE.lowercased()
                                    print(strVALUE)
                                    
                                    if strVALUE == "raw"{
                                        self.btnRow.tag = Int(strID)!
                                        self.lblRow.text = strVALUE
                                    }
                                    else if strVALUE == "services"{
                                        self.btnSevrice.tag = Int(strID)!
                                        self.lblService.text = strVALUE
                                    }
                                }
                            }
                            else if strproduct_attribute_name == "Instructions"
                            {
                                self.viewMiddle2.tag = Int(strid)!
                                
                                let attribute_values = dictemp.value(forKey: "attribute_values") as! NSArray
                                for xxx in 0 ..< attribute_values.count
                                {
                                    let dictemp1: NSDictionary = attribute_values[xxx] as! NSDictionary
                                    let  strID = String(format: "%@", dictemp1.value(forKey: "id") as! CVarArg)
                                    var  strVALUE = String(format: "%@", dictemp1.value(forKey: "name") as! CVarArg)
                                    strVALUE = strVALUE.lowercased()
                                    print(strVALUE)
                                    
                                    if strVALUE == "clean"{
                                        self.btnCleanCheckbox.tag = Int(strID)!
                                        self.lblClean.text = strVALUE
                                    }
                                    else if strVALUE == "slice"{
                                        self.btnSliceCheckbox.tag = Int(strID)!
                                        self.lblSlice.text = strVALUE
                                    }
                                    else if strVALUE == "fillet"{
                                        self.btnFilletCheckbox.tag = Int(strID)!
                                        self.lblFillet.text = strVALUE
                                    }
                                }
                            }
                            else if strproduct_attribute_name == "Services"
                            {
                                self.viewMiddle3.tag = Int(strid)!
                                
                                let attribute_values = dictemp.value(forKey: "attribute_values") as! NSArray
                                for xxx in 0 ..< attribute_values.count
                                {
                                    let dictemp1: NSDictionary = attribute_values[xxx] as! NSDictionary
                                    let  strID = String(format: "%@", dictemp1.value(forKey: "id") as! CVarArg)
                                    var  strVALUE = String(format: "%@", dictemp1.value(forKey: "name") as! CVarArg)
                                    strVALUE = strVALUE.lowercased()
                                    print(strVALUE)
                                    
                                    if strVALUE == "fry"{
                                        self.btnFryCheckbox.tag = Int(strID)!
                                        self.lblFry.text = strVALUE
                                    }
                                    else if strVALUE == "cook"{
                                        self.btnCookCheckbox.tag = Int(strID)!
                                        self.lblCook.text = strVALUE
                                    }
                                }
                            }
                            else if strproduct_attribute_name == "Comments"
                            {
                                self.viewMiddle4.tag = Int(strid)!
                                self.txtVComments.tag = Int(strid)!
                            }
                        }
                        
                        
                        self.dicSizeAttr = ["value" : self.btnviewmid11Selection.tag ,"id" : self.viewMiddle1.tag];
                        self.dicModeofPurchaseAttr = ["value" : self.btnRow.tag ,"id" : self.viewMiddle23.tag];
                        self.dicInstructionsAttr = ["value" : self.btnCleanCheckbox.tag ,"id" : self.viewMiddle2.tag];
                        //------------------------------
                        
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
    
        let dicUser = UserDefaults.standard.value(forKey: "RegisteredUserDetails") as! NSMutableDictionary
        print(dicUser)
        let  strCustomerid = String(format: "%@", dicUser.value(forKey: "id") as! CVarArg)
        
        let dicshopping_cart_item:NSMutableDictionary? = ["quantity" : txtQTY.text!,
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
                            let uiAlert = UIAlertController(title: "", message: "Product successfully added in your wishlist", preferredStyle: UIAlertController.Style.alert)
                            self.present(uiAlert, animated: true, completion: nil)
                            uiAlert.addAction(UIAlertAction(title: "Go to Wishlist", style: .default, handler: { action in
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
    
    
    //MARK: - get AddtoCart method
    func postAddtoCart(strPId:String,arrMattr:NSMutableArray)
    {
        self.showLoadingMode()
        
        let strSlectedStoreID = String(format: "%@", UserDefaults.standard.string(forKey: "SelectedStoreID")!)
        
        let dicUser = UserDefaults.standard.value(forKey: "RegisteredUserDetails") as! NSMutableDictionary
        print(dicUser)
        let  strCustomerid = String(format: "%@", dicUser.value(forKey: "id") as! CVarArg)
        
        let dicshopping_cart_item:NSMutableDictionary? = [
            "product_attributes" : arrMattr,
            "quantity" : txtQTY.text!,
            "shopping_cart_type" : "shoppingcart",
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
