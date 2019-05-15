//
//  ProductReviews.swift
//  Saudi Fisheries
//
//  Created by Sandipan on 13/05/19.
//  Copyright © 2019 SANDIPAN. All rights reserved.
//

import UIKit

class ProductReviews: UIViewController,UITextViewDelegate,FloatRatingViewDelegate,UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource
{
    var loadingCircle = UIView()
    var circle = UIView()
    
    @IBOutlet var viewAddReview: UIView!
    @IBOutlet var viewRating: FloatRatingView!
    @IBOutlet var txtReviewTitle: UITextField!
    @IBOutlet var txtvReviewText: UITextView!
    @IBOutlet var btnSubmitReview: UIButton!
    
    @IBOutlet var viewAllReviewList: UIView!
    @IBOutlet var lblReviewList: UILabel!
    
    let cellReuseIdentifier = "cell"
    var stridentifer = NSString()
    @IBOutlet var tabvReviewList: UITableView!
    
    var arrMReviews = NSMutableArray()
    
    
    var strRating = Double()
    var strPrdID = String()
    
    // MARK: - viewWillAppear Method
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true
        
        self.tabvReviewList.backgroundView=nil
        self.tabvReviewList.backgroundColor=UIColor.clear
        self.tabvReviewList.separatorColor=UIColor.clear
        self.tabvReviewList.register(UINib(nibName: "PRCell", bundle: nil), forCellReuseIdentifier: "PRCell")
    }
    
    // MARK: - viewDidAppear Method
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        self.getReviewList()
    }
    
    // MARK: - viewDidLoad method
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //Do any additional setup after loading the view.
        //let myAppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let border = CALayer()
        let width = CGFloat(0.5)
        border.borderColor = UIColor(red: 65/255, green: 65/255, blue: 66/255, alpha: 1.0).cgColor
        border.frame = CGRect(x: 0, y: viewAddReview.frame.size.height - width, width: viewAddReview.frame.size.width, height: viewAddReview.frame.size.height)
        border.borderWidth = width
        viewAddReview.layer.addSublayer(border)
        viewAddReview.layer.masksToBounds = true
        
        let border1 = CALayer()
        let width1 = CGFloat(0.5)
        border1.borderColor = UIColor(red: 65/255, green: 65/255, blue: 66/255, alpha: 1.0).cgColor
        border1.frame = CGRect(x: 0, y: txtReviewTitle.frame.size.height - width1, width: txtReviewTitle.frame.size.width, height: txtReviewTitle.frame.size.height)
        border1.borderWidth = width1
        txtReviewTitle.layer.addSublayer(border1)
        txtReviewTitle.layer.masksToBounds = true
        
        let border2 = CALayer()
        let width2 = CGFloat(0.5)
        border2.borderColor = UIColor(red: 65/255, green: 65/255, blue: 66/255, alpha: 1.0).cgColor
        border2.frame = CGRect(x: 0, y: txtvReviewText.frame.size.height - width2, width: txtvReviewText.frame.size.width, height: txtvReviewText.frame.size.height)
        border2.borderWidth = width2
        txtvReviewText.layer.addSublayer(border2)
        txtvReviewText.layer.masksToBounds = true
        
        strRating = 0
        viewRating.backgroundColor = UIColor.clear
        viewRating.delegate = self
        viewRating.contentMode = UIView.ContentMode.center
        viewRating.type = .wholeRatings
        viewRating.rating = strRating
        
    }
    
    // MARK: - pressBack method
    @IBAction func pressBack(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - pressSubmitReview method
    @IBAction func pressSubmitReview(_ sender: Any)
    {
        //print(strRating)
        //print(txtvReviewText.text)
        
        if txtReviewTitle.text == ""
        {
            let uiAlert = UIAlertController(title: "", message: "Please enter review subject", preferredStyle: UIAlertController.Style.alert)
            self.present(uiAlert, animated: true, completion: nil)
            uiAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                print("Click of default button")
            }))
        }
        else if strRating == 0
        {
            let uiAlert = UIAlertController(title: "", message: "Please give your ratings", preferredStyle: UIAlertController.Style.alert)
            self.present(uiAlert, animated: true, completion: nil)
            uiAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                print("Click of default button")
            }))
        }
        else{
            self.postAddReviewRating(strPId: strPrdID)
        }
    }
    
    //MARK: - floatRatingView Delegate Method
    @objc func floatRatingView(_ ratingView: FloatRatingView, didUpdate rating: Double)
    {
        strRating = rating
        print("strRating >>>> %@",strRating)
    }
    @objc func floatRatingView(_ ratingView: FloatRatingView, isUpdating rating: Double)
    {
        strRating = rating
        print("strRating >>>> %@",strRating)
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
        return arrMReviews.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 140.0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PRCell", for: indexPath) as! PRCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.accessoryType = UITableViewCell.AccessoryType.none
        cell.backgroundColor=UIColor.white
        cell.clearsContextBeforeDrawing = true
        cell.contentView.clearsContextBeforeDrawing = true
        
        let dictemp: NSDictionary = self.arrMReviews[indexPath.item] as! NSDictionary
        let  Id = String(format: "%@", dictemp.value(forKey: "Id") as! CVarArg)
        let  id = String(format: "%@", dictemp.value(forKey: "id") as! CVarArg)
        let  CustomerName = String(format: "%@", dictemp.value(forKey: "CustomerName") as! CVarArg)
        let  title = String(format: "%@", dictemp.value(forKey: "title") as! CVarArg)
        let  reviewText = String(format: "%@", dictemp.value(forKey: "reviewText") as! CVarArg)
        let  rating = String(format: "%@", dictemp.value(forKey: "rating") as! CVarArg)
        
        cell.lbl1.text = String(format: "%@", title)
        cell.lbl2.text = String(format: "%@ %@", "posted by:",CustomerName)
        cell.lbl3.text = String(format: "%@", reviewText)
        
        cell.floatingReview.isUserInteractionEnabled = false
        cell.floatingReview.backgroundColor = UIColor.clear
        cell.floatingReview.delegate = self
        cell.floatingReview.contentMode = UIView.ContentMode.center
        cell.floatingReview.type = .floatRatings
        let lessPrecisePI = Double(rating)
        cell.floatingReview.rating = lessPrecisePI!
        
        let labelSeparator = UILabel(frame: CGRect(x: 15, y: 139.5, width: tableView.frame.size.width, height: 0.5))
        labelSeparator.backgroundColor = UIColor.lightGray
        cell.contentView.addSubview(labelSeparator)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
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
    
    
    //MARK: - get ReviewList method
    func getReviewList()
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
        let strconnurl = String(format: "%@%@%@", Constants.conn.ConnUrl, "/api/reviews/",strPrdID)
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
                    
                    let arrMRV = dictemp.value(forKey: "Data") as! NSArray
                    self.arrMReviews = NSMutableArray(array: arrMRV)
                    print("arrMReviews --->",self.arrMReviews)
                    
                    OperationQueue.main.addOperation {
                        if Status == "1"{
                            self.tabvReviewList.reloadData()
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
    
    
    //MARK: - AddReviewRating method
    func postAddReviewRating(strPId:String)
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
        
        
        let dicTemp:NSMutableDictionary? = ["customerId" : strCustomerid,"title" : txtReviewTitle.text,"reviewText" : txtvReviewText.text,"rating" : strRating];
        
        let dicPostOverAll:NSMutableDictionary? = ["ProductReviewHelpfulness" : dicTemp as Any];
        print("dicPostOverAll ---->>>>>",dicPostOverAll as Any)
        
        let strapikey = String(format: "%@ %@", UserDefaults.standard.string(forKey: "token_type")!, UserDefaults.standard.string(forKey: "access_token")!)
        let strconnurl = String(format: "%@%@%@", Constants.conn.ConnUrl, "/api/addProductReview/",strPId)
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
                            self.txtReviewTitle.text = ""
                            self.txtvReviewText.text = ""
                            self.strRating = 0
                            self.viewRating.rating = self.strRating
                            
                            let uiAlert = UIAlertController(title: "", message: "Thanks for your valuable review.", preferredStyle: UIAlertController.Style.alert)
                            self.present(uiAlert, animated: true, completion: nil)
                            uiAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                                print("Click of default button")
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
