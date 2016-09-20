//
//  ViewController.swift
//  Tippy
//
//  Created by Phillip Pang on 9/11/16.
//  Copyright © 2016 Phillip Pang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var billLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var taxField: UITextField!
    @IBOutlet weak var taxRateLabel: UILabel!

    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        print ("TipSense: ViewDidLoad")
    }

    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("TipSense: view will appear")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("TipSense: view did appear")
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        //Set default to 1 if this is the first time opening App
        let defaultTipSegment =  defaults.integerForKey("DefaultTipPercentage") ?? 1
        
        
        tipControl.selectedSegmentIndex = defaultTipSegment
        
        calculateTip()
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("TipSense: view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("TipSense: view did disappear")
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onTap(sender: AnyObject) {

        view.endEditing(true)
    }
    
    @IBAction func calculateTip(sender: AnyObject) {
        
        calculateTip()
    }

    
    func calculateTip() {
        let tipPercentages = [0.15, 0.18,0.2]
        
        
        //Update the display
        let bill = Double(billField.text!) ?? 0.0
        let tax = Double(taxField.text!) ?? 0.0
        let tip =  bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip + tax
        
        
        tipLabel.text = String(format: "$%.2f",tip)
        totalLabel.text = String(format: "$%.2f",total)
    }


    
    @IBAction func calculateTaxRate(sender: AnyObject) {
        
        
        let aTax = Double(taxField.text!) ?? 0.0
        let bill = Double(billField.text!) ?? 0.0
        
        //Show tax rate
        if (aTax == 0.0 || bill == 0.0){
            taxRateLabel.text = ""
            
        }else{
            
            taxRateLabel.text = String(format: "%.2f%%",(aTax/bill * 100) )
        }
        
        //Update Tip & Total
        calculateTip()
    }
    

}

