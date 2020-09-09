//
//  LTMDecimalTextField.swift
//  LTMDecimal
//
//  Created by 柯南 on 2020/9/9.
//  Copyright © 2020 LTM. All rights reserved.
//

import UIKit

public class LTMDecimalTextField: UITextField, UITextFieldDelegate {

    private var decimalLimited: Int = 2
    /// 小数位数
    var decimalCount: Int{
        set{
            self.decimalLimited = newValue
        }get{
            self.decimalLimited
        }
    }
    
    private var maxNumLimited: Double = 99999.00
    /// 最大值
    var maxNum: Double {
        set{
            self.maxNumLimited = newValue
        }get{
            self.maxNumLimited
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func customTextChange(_ textField: UITextField, Range range: NSRange, replacementString string: String) -> Bool{
        let futureString: NSMutableString = NSMutableString(string: textField.text!)
        futureString.insert(string, at: range.location)
        var flag = 0;
        let limited = decimalLimited;//小数点后需要限制的个数
        if !futureString.isEqual(to: "") {
            for i in stride(from: (futureString.length - 1), through: 0, by: -1) {
                let char = Character(UnicodeScalar(futureString.character(at: i))!)
                if char == "." {
                    if flag > limited {
                        return false
                    }
                    break
                }
                flag += 1
            }
        }
        
        /// 限制大小
        var dealString = textField.text! + string
        if range.length == 0 {
            
        }else if range.length == 1{
            dealString.removeSubrange(Range.init(range, in: dealString)!)
        }
        let result = Double(dealString) ?? 0
        
        if string == "." && (textField.text!.contains(".")){
            return false
        }
        return (result <= maxNumLimited)
    }
}
