//
//  TabViewController.swift
//  Paged Tabs Example
//
//  Created by Merrick Sapsford on 04/05/2016.
//  Copyright © 2016 Merrick Sapsford. All rights reserved.
//

import UIKit
import MSSTabbedPageViewController

class TabViewController: MSSTabbedPageViewController {
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet() as NSCharacterSet).uppercaseString
        
        if (cString.hasPrefix("#")) {
            cString = cString.substringFromIndex(cString.startIndex.advancedBy(1))
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.grayColor()
        }
        var rgbValue:UInt32 = 0
        NSScanner(string: cString).scanHexInt(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    // MARK: MSSPageViewControllerDataSource
    
    override func viewControllersForPageViewController(pageViewController: MSSPageViewController) -> [UIViewController]? {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        
        let viewControllers = [storyboard.instantiateViewControllerWithIdentifier("Notifications"),
                               storyboard.instantiateViewControllerWithIdentifier("Services"),
                               storyboard.instantiateViewControllerWithIdentifier("Discussion"),
                               storyboard.instantiateViewControllerWithIdentifier("RealEstate")]
        return viewControllers
    }
    
    // MARK: MSSTabBarViewDataSource
    
    override func tabBarView(tabBarView: MSSTabBarView, populateTab tab: MSSTabBarCollectionViewCell, atIndex index: Int) {
   //     tabBarView.sizingStyle = 
        if index == 0
        {
            //   tabBarView.setS
          //  var tStyle: MSSTabStyle = .MSSTabStyleImage
            //  tab.tabStyle = tStyle
            tab.backgroundColor = hexStringToUIColor("#57c0e9")
            //cell.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
            tab.title = String(format: "Notifications")
            //   tab.setTabStyle(<#T##tabStyle: MSSTabStyle##MSSTabStyle#>)
           // tabBarView.
            //title = "Notifications"
    tab.image = UIImage(named:"notification-icon.png")
            // tab.selectedTextColor=UIColor.redColor()
            //  var mSSTabStyle : MSSTabStyle
            //  tab.setTabStyle();
        }
        else if index == 1
        {  tab.backgroundColor = hexStringToUIColor("#dd614f")
            tab.title = String(format: "Services")
              tab.image = UIImage(named:"services-icon.png")
        }
        else if index == 2
        {  tab.backgroundColor = hexStringToUIColor("#74b9a7")
            tab.title = String(format: "Discussion")
          tab.image = UIImage(named:"discussion-icon.png")
        }
        else if index == 3
        {   tab.backgroundColor = hexStringToUIColor("#f4940d")
            tab.title = String(format: "Real Estate")
          tab.image = UIImage(named:"realstate-icon.png")
        }
        
    }
}
