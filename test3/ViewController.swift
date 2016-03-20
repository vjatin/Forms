//
//  ViewController.swift
//  test3
//
//  Created by Jatin K Vaishnav on 12/18/15.
//  Copyright © 2015 Jatin K Vaishnav. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var placeholdertextrequired: UITextField!
    weak var activeField: UITextField?
    
    @IBOutlet weak var baduserid: UITextField!
    @IBOutlet weak var badpwd: UITextField!
    @IBOutlet weak var baduseridrequired: UILabel!
    @IBOutlet weak var badpwdrequired: UILabel!
    
    @IBOutlet weak var gooduserid: UITextField!
    @IBOutlet weak var goodpwd: UITextField!
    @IBOutlet weak var gooduseridrequired: UILabel!
    @IBOutlet weak var goodpwdrequired: UILabel!
    

    
    @IBAction func badlogin(sender: AnyObject) {
        if (baduserid.text == "")
        {
            self.baduseridrequired.hidden = false
            //self.baduserid.accessibilityLabel = "User ID required"
            //UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, baduserid)
            //return
        }
        else if (baduserid.text != "")
        {
            self.baduseridrequired.hidden = true
            //self.baduserid.accessibilityLabel = "User ID required"
            //UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, baduserid)
            //return
        }
        
        if (badpwd.text == "")
        {
            self.badpwdrequired.hidden = false
            //self.badpwd.accessibilityLabel = "Password required"
            //UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, badpwd)
            //return
        }
        else if (badpwd.text != "")
        {
            self.badpwdrequired.hidden = true
            //self.badpwd.accessibilityLabel = "Password required"
            //UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, badpwd)
            //return
        }

    }
    
    @IBAction func goodlogin(sender: AnyObject) {
        if (gooduserid.text == "")
        {
            self.gooduseridrequired.hidden = false
            self.gooduserid.accessibilityLabel = "User ID required"
            UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, gooduserid)
            return
        }
        else if (gooduserid.text != "")
        {
            self.gooduseridrequired.hidden = true
        }
        
        if (goodpwd.text == "")
        {
            self.goodpwdrequired.hidden = false
            self.goodpwd.accessibilityLabel = "Password required"
            UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, goodpwd)
            return
        }
        else if (goodpwd.text != "")
        {
            self.goodpwdrequired.hidden = true
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWasShown:", name: UIKeyboardDidShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillBeHidden:", name: UIKeyboardWillHideNotification, object: nil)
        
        placeholdertextrequired.attributedPlaceholder = NSAttributedString(string:"Required",
            attributes:[NSForegroundColorAttributeName: UIColor.darkGrayColor()])
        
        self.baduseridrequired.hidden = true
        self.badpwdrequired.hidden = true
        self.gooduseridrequired.hidden = true
        self.goodpwdrequired.hidden = true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        self.activeField = nil
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        self.activeField = textField
    }
    
    func keyboardWasShown(notification: NSNotification) {
        if let activeField = self.activeField, keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
            self.scrollView.contentInset = contentInsets
            self.scrollView.scrollIndicatorInsets = contentInsets
            var aRect = self.view.frame
            aRect.size.height -= keyboardSize.size.height
            if (!CGRectContainsPoint(aRect, activeField.frame.origin)) {
                self.scrollView.scrollRectToVisible(activeField.frame, animated: true)
            }
        }
    }
    
    func keyboardWillBeHidden(notification: NSNotification) {
        let contentInsets = UIEdgeInsetsZero
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
    }
}

