//
//  ViewController.swift
//  LTMDecimal
//
//  Created by 柯南 on 2020/9/9.
//  Copyright © 2020 LTM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        
//        let regular = "^[0123456789.]+$"
//        let predicate = NSPredicate(format: "SELF MATCHES %@", regular)
//        
//        if predicate.evaluate(with: "124556") {
//            print("通过")
//        }else{
//            print("不通过")
//        }
//        if predicate.evaluate(with: "124556.") {
//            print("通过")
//        }else{
//            print("不通过")
//        }
//        if predicate.evaluate(with: "124.df556") {
//            print("通过")
//        }else{
//            print("不通过")
//        }
//        if predicate.evaluate(with: "1通24.df556") {
//            print("通过")
//        }else{
//            print("不通过")
//        }

        self.view.addSubview(self.textview)
    }

    lazy var textview: LTMDecimalTextField = {
        let text = LTMDecimalTextField()
        text.frame = CGRect.init(x: 10, y: 200, width: 300, height: 40)
        text.backgroundColor = .yellow
        text.keyboardType = .decimalPad
        
        return text
    }()

}

