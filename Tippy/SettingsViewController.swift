//
//  SettingsViewController.swift
//  Tippy
//
//  Created by Phillip Pang on 9/18/16.
//  Copyright © 2016 Phillip Pang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    let tipPercentages = [0.15, 0.18, 0.20]

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let defaultTipSegment = defaults.integerForKey("DefaultTipPercentage")
        tipControl.selectedSegmentIndex = defaultTipSegment
        
        let defaultThemeSegment = defaults.integerForKey("DefaultTheme")
        themeControl.selectedSegmentIndex = defaultThemeSegment
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


    @IBOutlet weak var tipControl: UISegmentedControl!
   
    @IBOutlet weak var themeControl: UISegmentedControl!

       
    @IBAction func setTips(sender: AnyObject) {

        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger (tipControl.selectedSegmentIndex, forKey: "DefaultTipPercentage" )
        defaults.synchronize()
        
        print ("%d",tipControl.selectedSegmentIndex)

        
    }
    @IBAction func setTheme(sender: AnyObject) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger (themeControl.selectedSegmentIndex, forKey: "DefaultTheme")
        defaults.synchronize()
    }
    
    
}
