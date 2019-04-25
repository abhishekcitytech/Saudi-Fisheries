//
//  ProductDetails.swift
//  Saudi Fisheries
//
//  Created by Sandipan on 24/01/19.
//  Copyright © 2019 SANDIPAN. All rights reserved.
//

import UIKit

class ProductDetails: UIViewController,UIScrollViewDelegate,FloatRatingViewDelegate
{
    
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
    
    @IBOutlet var viewMiddle1: UIView!
    @IBOutlet var viewmid11: UIView!
    @IBOutlet var viewmid22: UIView!
    @IBOutlet var viewmid33: UIView!
    
    @IBOutlet var viewMiddle23: UIView!
    @IBOutlet var lblSelectPurchaseProcedure: UILabel!
    @IBOutlet var lblRow: UILabel!
    @IBOutlet var lblService: UIView!
    @IBOutlet var btnRow: UIButton!
    @IBOutlet var btnSevrice: UIButton!
    
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
    
    @IBOutlet var viewMiddle3: UIView!
    @IBOutlet var lblInstructions3: UILabel!
    @IBOutlet var btnFry: UIButton!
    @IBOutlet var lblFry: UILabel!
    @IBOutlet var btnFryCheckbox: UIButton!
    @IBOutlet var btnCook: UIButton!
    @IBOutlet var lblCook: UILabel!
    @IBOutlet var btnCookCheckbox: UIButton!
    @IBOutlet var txtVComments: UITextView!
    
    @IBOutlet var viewBottom1: UIView!
    @IBOutlet var btnAddtoCart: UIButton!
    @IBOutlet var viewQTY: UIView!
    
    var pageControl = UIPageControl()
    var  arrMBanners = NSMutableArray()
    
    // MARK: - viewWillAppear Method
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true
        
        btnRow.isSelected = true
        btnSevrice.isSelected = false
        viewMiddle2.isHidden = false
        viewMiddle3.isHidden = true
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
        
        arrMBanners  = ["p1.jpg", "p2.jpg", "p3.jpg","p4.jpg"]
        self.pagecontrollerGallery()
        
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
        
        viewReviewFeebcak.backgroundColor = UIColor.clear
        viewReviewFeebcak.delegate = self
        viewReviewFeebcak.contentMode = UIView.ContentMode.center
        viewReviewFeebcak.type = .floatRatings
        viewReviewFeebcak.rating = 3.5
        
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
    
    // MARK: - pressFav && pressShare method
    @IBAction func pressFav(_ sender: Any)
    {
    }
    @IBAction func pressShare(_ sender: Any)
    {
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
            
            scrollOverAll.contentSize = CGSize(width: scrollOverAll.frame.size.width, height: 450)
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
            
            scrollOverAll.contentSize = CGSize(width: scrollOverAll.frame.size.width, height: 600)
        }
    }
    
    // MARK: - pressCleanCheckBox && pressSliceCheckBox && pressFilletCheckBox method
    @IBAction func pressCleanCheckBox(_ sender: UIButton)
    {
    }
    @IBAction func pressSliceCheckBox(_ sender: UIButton)
    {
    }
    @IBAction func pressFilletCheckBox(_ sender: UIButton)
    {
    }
    
    // MARK: - pressFryCheckBox && pressCookCheckBox method
    @IBAction func pressFryCheckBox(_ sender: UIButton)
    {
    }
    @IBAction func pressCookCheckBox(_ sender: UIButton)
    {
    }
    
    
    // MARK: - pressAddtoCart method
    @IBAction func pressAddtoCart(_ sender: Any)
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
            let rowimagename = "\(arrMBanners[x])"
            imgviconBG.image = UIImage(named:rowimagename)
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
}
