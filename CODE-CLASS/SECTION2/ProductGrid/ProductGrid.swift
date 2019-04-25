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
    
    @IBOutlet var btnSlide: UIButton!
    
    @IBOutlet var viewFilterListGrid: UIView!
    @IBOutlet var btnFilter: UIButton!
    @IBOutlet var btnSort: UIButton!
    
    @IBOutlet var CollectionTable: UICollectionView!
    var reuseIdentifier = "STCell"
    
    @IBOutlet var tableLine: UITableView!
    
    var arrMProducts = NSMutableArray()
    
    // MARK: - viewWillAppear Method
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true
        
        //btnListGrid.tag = 1
        //btnListGrid.setImage(UIImage(named: "list"), for: .normal)
        tableLine.isHidden = true
        CollectionTable.isHidden = false
        CollectionTable.reloadData()
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
         
        arrMProducts = ["p1.jpg", "p2.jpg", "p3.jpg","p4.jpg","p5.jpg", "p6.jpg"]
        
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
   
        cell.lbl1.text = "47.00 AED"
        cell.lbl2.text = "Salmon"
        cell.lbl3.text = "Fresh Fish | Oman"
        
        let rowimagename = "\(arrMProducts[indexPath.item])"
        cell.imgvProduct.image = UIImage(named:rowimagename)
        
        cell.btnFav.addTarget(self, action: #selector(pressFavAdd), for: .touchUpInside)
        cell.btnFav.setImage(UIImage(named: "favdeselected"), for: .normal)
        
        cell.floatRatingView.backgroundColor = UIColor.clear
        cell.floatRatingView.delegate = self
        cell.floatRatingView.contentMode = UIView.ContentMode.center
        cell.floatRatingView.type = .floatRatings
        cell.floatRatingView.rating = 3.5
    
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("You selected cell #\(indexPath.item)!")
        
        let screenSize = UIScreen.main.bounds
        if (screenSize.height == 568.0){
        }
        else if (screenSize.height == 480.0){
        }
        else if(screenSize.height == 667.0){
            let storyBoard = UIStoryboard(name: "SectionTwo6S", bundle: nil)
            let ProductDetails = storyBoard.instantiateViewController(withIdentifier: "ProductDetails") as! ProductDetails
            self.navigationController?.pushViewController(ProductDetails, animated: true)
        }
        else if(screenSize.height == 736.0){
            let storyBoard = UIStoryboard(name: "SectionTwo6SPlus", bundle: nil)
            let ProductDetails = storyBoard.instantiateViewController(withIdentifier: "ProductDetails") as! ProductDetails
            self.navigationController?.pushViewController(ProductDetails, animated: true)
        }
        else if(screenSize.height == 812.0){
            let storyBoard = UIStoryboard(name: "SectionTwoXS", bundle: nil)
            let ProductDetails = storyBoard.instantiateViewController(withIdentifier: "ProductDetails") as! ProductDetails
            self.navigationController?.pushViewController(ProductDetails, animated: true)
        }
        else{
            let storyBoard = UIStoryboard(name: "SectionTwoXSMAX", bundle: nil)
            let ProductDetails = storyBoard.instantiateViewController(withIdentifier: "ProductDetails") as! ProductDetails
            self.navigationController?.pushViewController(ProductDetails, animated: true)
        }
    }
    @objc func pressFavAdd() -> Void
    {
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
        
        let rowimagename = "\(arrMProducts[indexPath.row])"
        
        cell.imgvProduct.image = UIImage(named: rowimagename)
        cell.lblname.text = "Saloman"
        cell.lblCategory.text = "Fresh Fish | Oman"
        cell.lblPrice.text = "47.00 AED"
        
        cell.btnAddFav.addTarget(self, action: #selector(pressFavAddTable), for: .touchUpInside)
        
        cell.floatRatingView.backgroundColor = UIColor.clear
        cell.floatRatingView.delegate = self
        cell.floatRatingView.contentMode = UIView.ContentMode.scaleAspectFit
        cell.floatRatingView.type = .floatRatings
        cell.floatRatingView.rating = 3.3
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
    }
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
    
}
