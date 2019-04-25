//
//  CategoryTab.swift
//  Saudi Fisheries
//
//  Created by Sandipan on 25/01/19.
//  Copyright © 2019 SANDIPAN. All rights reserved.
//

import UIKit

class CategoryTab: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource  {

    @IBOutlet var btnSlide: UIButton!
    @IBOutlet var CollectionTable: UICollectionView!
    var reuseIdentifier = "collectionCELL1"
    var arrMProducts = NSMutableArray()
    var arrMProducts1 = NSMutableArray()
    
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
        //Do any additional setup after loading the view.
        //let myAppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        arrMProducts = ["p1.jpg", "p2.jpg", "p3.jpg","p4.jpg","p5.jpg", "p6.jpg"]
        arrMProducts1 = ["Fresh", "Menu", "Frozen","Packed","Prawn", "Crab"]
        
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
        return self.arrMProducts.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! collectionCELL1
        cell.contentView.backgroundColor = UIColor.white
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.cornerRadius = 4.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = true
        
        let rowimagename1 = "\(arrMProducts1[indexPath.item])"
        cell.lbl1.text = rowimagename1
        
        let rowimagename = "\(arrMProducts[indexPath.item])"
        cell.imgvProduct.image = UIImage(named:rowimagename)
         
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 0, left:0, bottom:0, right:0)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        //print("You selected cell #\(indexPath.item)!")
        
        if indexPath.item == 1
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
                self.navigationController?.pushViewController(ProductGrid, animated: true)
            }
            else if(screenSize.height == 736.0){
                let storyBoard = UIStoryboard(name: "SectionTwo6SPlus", bundle: nil)
                let ProductGrid = storyBoard.instantiateViewController(withIdentifier: "ProductGrid") as! ProductGrid
                self.navigationController?.pushViewController(ProductGrid, animated: true)
            }
            else if(screenSize.height == 812.0){
                let storyBoard = UIStoryboard(name: "SectionTwoXS", bundle: nil)
                let ProductGrid = storyBoard.instantiateViewController(withIdentifier: "ProductGrid") as! ProductGrid
                self.navigationController?.pushViewController(ProductGrid, animated: true)
            }
            else{
                let storyBoard = UIStoryboard(name: "SectionTwoXSMAX", bundle: nil)
                let ProductGrid = storyBoard.instantiateViewController(withIdentifier: "ProductGrid") as! ProductGrid
                self.navigationController?.pushViewController(ProductGrid, animated: true)
            }
        }
    }

}
