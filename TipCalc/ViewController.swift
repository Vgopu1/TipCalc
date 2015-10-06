//
//  ViewController.swift
//  TipCalc
//
//  Created by Veena G on 10/3/15.
//  Copyright (c) 2015 Veena. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    
    @IBOutlet weak var tipPercentageSegControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getTipPercentage() -> Double {
        var tipPercentages = [10.0, 15.0, 20.0]
        return tipPercentages[tipPercentageSegControl.selectedSegmentIndex]
    }
    
    func refreshAmounts() {
        println("refreshAmounts() called.")
        var amount = (billField.text as NSString).doubleValue
        println("Parsed amount is $\(amount)")
        var tipPct = getTipPercentage()
        println("Tip percentage: \(tipPct)")
        var tip = (amount * tipPct)/100
        var tipStr = String(format: "$%.2f", tip)
        var total = amount + tip
        var totalStr = String(format: "$%.2f", total)
        println("Tip: $\(tipStr), Total: $\(totalStr)")
        
        tipLabel.text = tipStr
        totalLabel.text = totalStr
        
    }
    
    @IBAction func onValueChanged(sender: AnyObject) {
        refreshAmounts()
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        refreshAmounts()
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

