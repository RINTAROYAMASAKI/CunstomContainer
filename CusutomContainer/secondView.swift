//
//  secondView.swift
//  CusutomContainer
//
//  Created by rintaro.yamasaki on 2016/09/04.
//  Copyright © 2016年 rintaro.yamasaki. All rights reserved.
//

import UIKit

class SecondView: UIViewController {
    
    @IBOutlet weak var text: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        text.text = ""

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func tap_btn(sender: AnyObject) {
        
        text.text = "Second View"
    }
}


