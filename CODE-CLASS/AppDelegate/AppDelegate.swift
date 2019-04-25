//
//  AppDelegate.swift
//  Saudi Fisheries
//
//  Created by Sandipan on 18/01/19.
//  Copyright © 2019 SANDIPAN. All rights reserved.
//

struct Constants {
    struct conn {
        //MARK: - Service API Development URL
        static let ConnUrl = "http://192.237.249.94:4001/"
    }
}

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,UITabBarControllerDelegate {

    var window: UIWindow?
    let tabBarCnt = UITabBarController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
         /*UIFont.familyNames.forEach({ familyName in
         let fontNames = UIFont.fontNames(forFamilyName: familyName)
         print(familyName, fontNames)
         })*/
        
        //"Dubai-Regular", "Dubai-Light", "Dubai-Medium", "Dubai-Bold"

        //"Futura-CondensedExtraBold", "FuturaBT-Heavy", "Futura-Medium", "Futura-Bold", "Futura-CondensedMedium", "Futura-MediumItalic"
        //"GESSTwoBold-Bold", "GESSTwoLight-Light", "GESSTwoMedium-Medium"
        
        //Header: 00b7b2 (0,183,178) UIColor(red: 0/255, green: 183/255, blue: 178/255, alpha: 1.0)
        //Sliding Toggle Text: 9e9e9e  (158,158,158) UIColor(red: 158/255, green: 158/255, blue: 158/255, alpha: 1.0)
        //Divider: e4e4e4 (228,228,228) UIColor(red: 228/255, green: 228/255, blue: 228/255, alpha: 1.0)
        //Logout Text: ee6363  (238,99,99) UIColor(red: 238/255, green: 99/255, blue: 99/255, alpha: 1.0)
        //Fixed bottom Menu: 7d7c7c (125,124,124) UIColor(red: 125/255, green: 124/255, blue: 124/255, alpha: 1.0)

        //b3d234 UIColor(red: 178/255, green: 210/255, blue: 53/255, alpha: 1.0)
        //00b7b2 UIColor(red: 0/255, green: 183/255, blue: 178/255, alpha: 1.0)
        //414142 UIColor(red: 65/255, green: 65/255, blue: 67/255, alpha: 1.0)
        
        //#00b7b2 - green                 UIColor(red: 0/255, green: 183/255, blue: 178/255, alpha: 1.0)
        //#7d7c7c - grey buttons          UIColor(red: 125/255, green: 124/255, blue: 124/255, alpha: 1.0)
        //#f1f0f0 - bottom navigation     UIColor(red: 241/255, green: 240/255, blue: 240/255, alpha: 1.0)
        //#FF0000 - red                   UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1.0)
        
        self.createTabbarCustomer()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Saudi_Fisheries")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    //MARK: - createTabbarCustomer method
    func createTabbarCustomer() -> Void
    {
        let screenSize = UIScreen.main.bounds
        
        var firstVc = HomeTab()
        if (screenSize.height == 568.0){
        }
        else if (screenSize.height == 480.0){
        }
        else if(screenSize.height == 667.0){
            let storyBoard = UIStoryboard(name: "SectionOne6S", bundle: nil)
            firstVc = storyBoard.instantiateViewController(withIdentifier: "HomeTab") as! HomeTab
        }
        else if(screenSize.height == 736.0){
            let storyBoard = UIStoryboard(name: "SectionOne6SPlus", bundle: nil)
            firstVc = storyBoard.instantiateViewController(withIdentifier: "HomeTab") as! HomeTab
        }
        else if(screenSize.height == 812.0){
            let storyBoard = UIStoryboard(name: "SectionOneXS", bundle: nil)
            firstVc = storyBoard.instantiateViewController(withIdentifier: "HomeTab") as! HomeTab
        }
        else{
            let storyBoard = UIStoryboard(name: "SectionOneXSMAX", bundle: nil)
            firstVc = storyBoard.instantiateViewController(withIdentifier: "HomeTab") as! HomeTab
        }
        firstVc.view.backgroundColor =  UIColor.white
        firstVc.tabBarItem.title = "Home"
        firstVc.tabBarItem.image=UIImage(named: "HomeUnselected")?.withRenderingMode(.alwaysOriginal) // deselect image
        firstVc.tabBarItem.selectedImage = UIImage(named: "HomeSelected")?.withRenderingMode(.alwaysOriginal) // select image
        
        var secondVc = CategoryTab()
        if (screenSize.height == 568.0){
        }
        else if (screenSize.height == 480.0){
        }
        else if(screenSize.height == 667.0){
            let storyBoard = UIStoryboard(name: "SectionOne6S", bundle: nil)
            secondVc = storyBoard.instantiateViewController(withIdentifier: "CategoryTab") as! CategoryTab
        }
        else if(screenSize.height == 736.0){
            let storyBoard = UIStoryboard(name: "SectionOne6SPlus", bundle: nil)
            secondVc = storyBoard.instantiateViewController(withIdentifier: "CategoryTab") as! CategoryTab
        }
        else if(screenSize.height == 812.0){
            let storyBoard = UIStoryboard(name: "SectionOneXS", bundle: nil)
            secondVc = storyBoard.instantiateViewController(withIdentifier: "CategoryTab") as! CategoryTab
        }
        else{
            let storyBoard = UIStoryboard(name: "SectionOneXSMAX", bundle: nil)
            secondVc = storyBoard.instantiateViewController(withIdentifier: "CategoryTab") as! CategoryTab
        }
        secondVc.view.backgroundColor =  UIColor.white
        secondVc.tabBarItem.title = "Category"
        secondVc.tabBarItem.image=UIImage(named: "ProductUnselected")?.withRenderingMode(.alwaysOriginal) // deselect image
        secondVc.tabBarItem.selectedImage = UIImage(named: "ProductSelected")?.withRenderingMode(.alwaysOriginal) // select image
        
        var thirdVc = CartTab()
        if (screenSize.height == 568.0){
        }
        else if (screenSize.height == 480.0){
        }
        else if(screenSize.height == 667.0){
            let storyBoard = UIStoryboard(name: "SectionOne6S", bundle: nil)
            thirdVc = storyBoard.instantiateViewController(withIdentifier: "CartTab") as! CartTab
        }
        else if(screenSize.height == 736.0){
            let storyBoard = UIStoryboard(name: "SectionOne6SPlus", bundle: nil)
            thirdVc = storyBoard.instantiateViewController(withIdentifier: "CartTab") as! CartTab
        }
        else if(screenSize.height == 812.0){
            let storyBoard = UIStoryboard(name: "SectionOneXS", bundle: nil)
            thirdVc = storyBoard.instantiateViewController(withIdentifier: "CartTab") as! CartTab
        }
        else{
            let storyBoard = UIStoryboard(name: "SectionOneXSMAX", bundle: nil)
            thirdVc = storyBoard.instantiateViewController(withIdentifier: "CartTab") as! CartTab
        }
        thirdVc.view.backgroundColor =  UIColor.white
        thirdVc.tabBarItem.title = "Cart"
        thirdVc.tabBarItem.image=UIImage(named: "CartUnselected")?.withRenderingMode(.alwaysOriginal) // deselect image
        thirdVc.tabBarItem.selectedImage = UIImage(named: "CartSelected")?.withRenderingMode(.alwaysOriginal) // select image
        
        var fourthVc = MoreTab()
        if (screenSize.height == 568.0){
        }
        else if (screenSize.height == 480.0){
        }
        else if(screenSize.height == 667.0){
            let storyBoard = UIStoryboard(name: "SectionOne6S", bundle: nil)
            fourthVc = storyBoard.instantiateViewController(withIdentifier: "MoreTab") as! MoreTab
        }
        else if(screenSize.height == 736.0){
            let storyBoard = UIStoryboard(name: "SectionOne6SPlus", bundle: nil)
            fourthVc = storyBoard.instantiateViewController(withIdentifier: "MoreTab") as! MoreTab
        }
        else if(screenSize.height == 812.0){
            let storyBoard = UIStoryboard(name: "SectionOneXS", bundle: nil)
            fourthVc = storyBoard.instantiateViewController(withIdentifier: "MoreTab") as! MoreTab
        }
        else{
            let storyBoard = UIStoryboard(name: "SectionOneXSMAX", bundle: nil)
            fourthVc = storyBoard.instantiateViewController(withIdentifier: "MoreTab") as! MoreTab
        }
        fourthVc.view.backgroundColor =  UIColor.white
        fourthVc.tabBarItem.title = "More"
        fourthVc.tabBarItem.image=UIImage(named: "MoreUnselected")?.withRenderingMode(.alwaysOriginal) // deselect image
        fourthVc.tabBarItem.selectedImage = UIImage(named: "MoreSelected")?.withRenderingMode(.alwaysOriginal) // select image
        
        tabBarCnt.selectedIndex = 0
        
        tabBarCnt.tabBar.backgroundColor = UIColor.white
        tabBarCnt.tabBar.tintColor = UIColor.white
        tabBarCnt.tabBar.barTintColor =  UIColor.white
        
        let appearance = UITabBarItem.appearance(whenContainedInInstancesOf: [UITabBarController.self])
        appearance.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 65/255, green: 65/255, blue: 66/255, alpha: 1.0)], for: .normal)
        appearance.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 0/255, green: 183/255, blue: 178/255, alpha: 1.0)], for: .selected)
        
        //tabBarCnt.viewControllers = [firstVc, secondVc, thirdVc, fourthVc]
        //self.view.addSubview(tabBarCnt.view)
        
        let controllerArray = [firstVc, secondVc, thirdVc, fourthVc]
        tabBarCnt.viewControllers = controllerArray.map{ UINavigationController.init(rootViewController: $0)}
        
        //self.view.addSubview(tabBarCnt.view)
        
        self.window!.rootViewController = tabBarCnt
        self.window!.backgroundColor = UIColor.white
        self.window!.makeKeyAndVisible()
    }
    
    //MARK: - UITabBarController Delegate method
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected \(viewController.title!)")
    }
}

