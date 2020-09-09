//
//  ViewController.swift
//  LTMDecimal
//
//  Created by 柯南 on 2020/9/9.
//  Copyright © 2020 LTM. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        self.view.addSubview(self.textview)
    }
    
    func regular() {
        //        let regular = "^[1-9]\\d*\\.\\d*|0\\.\\d*[1-9]\\d*$"
        
        let regular = "^[0-9]\\d*|.$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regular)
        
        if predicate.evaluate(with: "124556") {
            print("通过")
        }else{
            print("不通过")
        }
        if predicate.evaluate(with: "124556.") {
            print("通过")
        }else{
            print("不通过")
        }
        
        if predicate.evaluate(with: "1") {
            print("通过")
        }else{
            print("不通过")
        }
        if predicate.evaluate(with: ".") {
            print("通过")
        }else{
            print("不通过")
        }
        if predicate.evaluate(with: "124.df556") {
            print("通过")
        }else{
            print("不通过")
        }
        if predicate.evaluate(with: "1通24.df556") {
            print("通过")
        }else{
            print("不通过")
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return self.textview.customTextChange(textField, Range: range, replacementString: string)
    }

    lazy var textview: LTMDecimalTextField = {
        let text = LTMDecimalTextField()
        text.frame = CGRect.init(x: 10, y: 200, width: 300, height: 40)
        text.backgroundColor = .yellow
        text.delegate = self
        
        return text
    }()

}

