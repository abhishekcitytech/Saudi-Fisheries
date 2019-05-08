//
//  CategoryTab.swift
//  Saudi Fisheries
//
//  Created by Sandipan on 25/01/19.
//  Copyright © 2019 SANDIPAN. All rights reserved.
//

import UIKit

class CategoryTab: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource  {

    var loadingCircle = UIView()
    var circle = UIView()
    
    @IBOutlet var btnSlide: UIButton!
    @IBOutlet var CollectionTable: UICollectionView!
    var reuseIdentifier = "collectionCELL1"
    
    var arrMCategory = NSMutableArray()
    
    // MARK: - viewWillAppear Method
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true
        
        let strSlectedStoreID = String(format: "%@", UserDefaults.standard.string(forKey: "SelectedStoreID")!)
        self.getCategoryList(strSelectedStoreID: strSlectedStoreID)
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
        layout.itemSize = CGSize(width: 170, height: 160)
        CollectionTable.register(UINib(nibName: "collectionCELL1", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        CollectionTable.backgroundColor = UIColor.clear
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
    
    
    // MARK: - UICollectionView Delegate & DataSource Method
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return self.arrMCategory.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! collectionCELL1
        cell.contentView.backgroundColor = UIColor.white
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.cornerRadius = 4.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = true
        
        let dictemp: NSDictionary = self.arrMCategory[indexPath.item] as! NSDictionary
        
        let  strname = String(format: "%@", dictemp.value(forKey: "name") as! CVarArg)
        cell.lbl1.text = strname
        
        let dictempImage: NSDictionary = dictemp.value(forKey: "image") as! NSDictionary
        let  strimage = String(format: "%@", dictempImage.value(forKey: "src") as! CVarArg)
        print(strimage)
        cell.imgvProduct.imageFromURL(urlString: strimage)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 0, left:0, bottom:0, right:0)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let dictemp: NSDictionary = self.arrMCategory[indexPath.item] as! NSDictionary
        print("You selected cell #\(indexPath.item)!")
        
        let  strname = String(format: "%@", dictemp.value(forKey: "name") as! CVarArg)
        let  strid = String(format: "%@", dictemp.value(forKey: "id") as! CVarArg)
        
        if strname == "Menu"
        {
            let screenSize = UIScreen.main.bounds
            if (screenSize.height == 568.0){
            }
            else if (screenSize.height == 480.0){
            }
            else if(screenSize.height == 667.0){
                let storyBoard = UIStoryboard(name: "SectionTwo6S", bundle: nil)
                let MenuGrid = storyBoard.instantiateViewController(withIdentifier: "MenuGrid") as! MenuGrid
                self.navigationController?.pushViewController(MenuGrid, animated: true)
            }
            else if(screenSize.height == 736.0){
                let storyBoard = UIStoryboard(name: "SectionTwo6SPlus", bundle: nil)
                let MenuGrid = storyBoard.instantiateViewController(withIdentifier: "MenuGrid") as! MenuGrid
                self.navigationController?.pushViewController(MenuGrid, animated: true)
            }
            else if(screenSize.height == 812.0){
                let storyBoard = UIStoryboard(name: "SectionTwoXS", bundle: nil)
                let MenuGrid = storyBoard.instantiateViewController(withIdentifier: "MenuGrid") as! MenuGrid
                self.navigationController?.pushViewController(MenuGrid, animated: true)
            }
            else{
                let storyBoard = UIStoryboard(name: "SectionTwoXSMAX", bundle: nil)
                let MenuGrid = storyBoard.instantiateViewController(withIdentifier: "MenuGrid") as! MenuGrid
                self.navigationController?.pushViewController(MenuGrid, animated: true)
            }
        }
        else
        {
            let screenSize = UIScreen.main.bounds
            if (screenSize.height == 568.0){
            }
            else if (screenSize.height == 480.0){
            }
            else if(screenSize.height == 667.0){
                let storyBoard = UIStoryboard(name: "SectionTwo6S", bundle: nil)
                let ProductGrid = storyBoard.instantiateViewController(withIdentifier: "ProductGrid") as! ProductGrid
                ProductGrid.strCatID = strid
                self.navigationController?.pushViewController(ProductGrid, animated: true)
            }
            else if(screenSize.height == 736.0){
                let storyBoard = UIStoryboard(name: "SectionTwo6SPlus", bundle: nil)
                let ProductGrid = storyBoard.instantiateViewController(withIdentifier: "ProductGrid") as! ProductGrid
                ProductGrid.strCatID = strid
                self.navigationController?.pushViewController(ProductGrid, animated: true)
            }
            else if(screenSize.height == 812.0){
                let storyBoard = UIStoryboard(name: "SectionTwoXS", bundle: nil)
                let ProductGrid = storyBoard.instantiateViewController(withIdentifier: "ProductGrid") as! ProductGrid
                ProductGrid.strCatID = strid
                self.navigationController?.pushViewController(ProductGrid, animated: true)
            }
            else{
                let storyBoard = UIStoryboard(name: "SectionTwoXSMAX", bundle: nil)
                let ProductGrid = storyBoard.instantiateViewController(withIdentifier: "ProductGrid") as! ProductGrid
                ProductGrid.strCatID = strid
                self.navigationController?.pushViewController(ProductGrid, animated: true)
            }
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
    
    
    //MARK: - get CategoryList method
    func getCategoryList(strSelectedStoreID: String)
    {
        self.showLoadingMode()
        
        let strapikey = String(format: "%@ %@", UserDefaults.standard.string(forKey: "token_type")!, UserDefaults.standard.string(forKey: "access_token")!)
        let strconnurl = String(format: "%@%@%@", Constants.conn.ConnUrl, "/api/categories?storeid=",strSelectedStoreID)
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
                    
                    let arrMcategory = dictemp.value(forKey: "Data") as! NSArray
                    self.arrMCategory = NSMutableArray(array: arrMcategory)
                    print("arrMCategory --->",self.arrMCategory)
                    
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

}
