//
//  ViewController.swift
//  JY-富文本label
//
//  Created by atom on 2017/4/11.
//  Copyright © 2017年 atom. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textLabel: JYLabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textLabel.text = "哈哈哈 http://1010101011.com你哈"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

