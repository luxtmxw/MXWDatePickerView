//
//  MXWDatePickerView.swift
//  DatePickerView
//
//  Created by luxtmxw on 16/3/1.
//  Copyright © 2016年 luxtmxw.com. All rights reserved.
// ....luxtmxw

import UIKit

class MXWDatePickerView: UIView {

    var datePickerView: UIDatePicker!
    let kScreenWidth = UIScreen.mainScreen().bounds.size.width
    let kScreenHeight = UIScreen.mainScreen().bounds.size.height
    
    func setupDatePickerViewData(miniDate: NSDate) {
        datePickerView.minimumDate = miniDate
    }
    
    convenience init (frame: CGRect, target: AnyObject, action: Selector, dateAction: Selector) {
        self.init()
        self.frame = frame
        self.backgroundColor = UIColor.whiteColor()
        
        let cancelBtn = UIButton()
        cancelBtn.frame = CGRectMake(0, 5, 28, 28)
        cancelBtn.tag = 1000
        cancelBtn.titleLabel?.font = UIFont.systemFontOfSize(14)
        cancelBtn.setTitle("取消", forState: .Normal)
        cancelBtn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        cancelBtn.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        self.addSubview(cancelBtn)
        
        let confirmBtn = UIButton()
        confirmBtn.frame = CGRectMake(kScreenWidth - 28, 0, 28, 28)
        confirmBtn.tag = 1001
        confirmBtn.titleLabel?.font = UIFont.systemFontOfSize(14)
        confirmBtn.setTitle("确定", forState: .Normal)
        confirmBtn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        confirmBtn.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        self.addSubview(confirmBtn)
        
        datePickerView = UIDatePicker()
        datePickerView.backgroundColor = UIColor.whiteColor()
        datePickerView.frame = CGRectMake(0, 35, kScreenWidth, self.frame.size.height - 35)
        datePickerView.minimumDate = NSDate()
        datePickerView.addTarget(target, action: dateAction, forControlEvents: .ValueChanged)
        self.addSubview(datePickerView)
    }
    
    
}
