//
//  ViewController.swift
//  DatePickerView
//
//  Created by luxtmxw on 16/3/1.
//  Copyright © 2016年 luxtmxw.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var showLabel: UILabel!
    var showString = ""
    var mxwDatePickerView: MXWDatePickerView!
    let kScreenWidth = UIScreen.mainScreen().bounds.size.width
    let kScreenHeight = UIScreen.mainScreen().bounds.size.height
    var backView: UIView!
    
    func animationShow(setView: UIView, height: CGFloat) {
        UIView.animateWithDuration(0.5) { () -> Void in
            setView.transform = CGAffineTransformMakeTranslation(0, height)
        }
    }
    
    func animationDismiss() {
        for var index = 0; index < backView.subviews.count; index++ {
            UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.TransitionCurlDown, animations: { () -> Void in
                self.backView.subviews[index].transform = CGAffineTransformIdentity
                }, completion: { (finish) -> Void in
               self.backView.removeFromSuperview()
            })
        }
    }
    
    func setupBackView() {
        let window = UIApplication.sharedApplication().windows[1]
        backView = UIView(frame: window.frame)
        backView.backgroundColor = UIColor(white: 0, alpha: 0.35)
        window.addSubview(backView)
        
        let tap = UITapGestureRecognizer(target: self, action: "removeBack")
        backView.addGestureRecognizer(tap)
    }
    
    func removeBack() {
        self.animationDismiss() 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func setupDatePickerView() {
        let frame = CGRectMake(0, kScreenHeight, kScreenWidth, 212)
        mxwDatePickerView = MXWDatePickerView(frame: frame, target: self, action: "cancelAndconfirmAction:", dateAction: "updatePickerViewAction:")
//        mxwDatePickerView.frame = CGRectMake(0, kScreenHeight - 64, kScreenWidth, 212)
        backView.addSubview(mxwDatePickerView)
    }
    
    @IBAction func btnAction(sender: AnyObject) {
        self.setupBackView()
        self.setupDatePickerView()
        self.animationShow(mxwDatePickerView, height: -212)
    }
    
    func cancelAndconfirmAction(btn: UIButton) {
        if btn.tag == 1000 {
            self.animationDismiss()
        }else {
            showLabel.text = showString
            self.animationDismiss()
        }
    }
    
    func updatePickerViewAction(datePicker: UIDatePicker) {
        showString = String(datePicker.date)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

