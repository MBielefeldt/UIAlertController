//
//  ViewController.swift
//  UIAlertController
//
//  Created by Mads Bielefeldt on 03/06/15.
//  Copyright (c) 2015 GN ReSound. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func showAlertButton(sender: AnyObject)
    {
        let alert = UIAlertController(title: "Title", message: "Message", preferredStyle: .Alert)
        
        alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = " Text Field 1"
        }
        alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = " Text Field 2"
            textField.secureTextEntry = true
        }
        
        alert.addAction(UIAlertAction(title: "OK", style: .Default) { (action) -> Void in
            println("\(action.title)")
            if let textField1 = alert.textFields?.first as? UITextField {
                println("Text field 1 = \"\(textField1.text)\"")
            }
            if let textField2 = alert.textFields?.last as? UITextField {
                println("Text field 2 = \"\(textField2.text)\"")
            }
        })
        alert.addAction(UIAlertAction(title: "Delete", style: .Destructive) { (action) -> Void in
            println("\(action.title)")
            /* do nothing */
        })
        alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel) { (action) -> Void in
            println("\(action.title)")
            /* do nothing */
        })
        
        presentViewController(alert, animated: true, completion: nil)
    }

    @IBOutlet weak var showActionSheetBarButtonItem: UIBarButtonItem!
    
    @IBAction func showActionSheetButton(sender: AnyObject)
    {
        let actionSheet = UIAlertController(title: "Title", message: "Message", preferredStyle: .ActionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "OK", style: .Default) { (action) -> Void in
            println("\(action.title)")
            /* do nothing */
            })
        actionSheet.addAction(UIAlertAction(title: "Delete", style: .Destructive) { (action) -> Void in
            println("\(action.title)")
            /* do nothing */
            })
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .Cancel) { (action) -> Void in
            println("\(action.title)")
            /* do nothing */
            })
        
        actionSheet.modalPresentationStyle = .Popover
        let popoverPresentationCtrl = actionSheet.popoverPresentationController
        popoverPresentationCtrl?.barButtonItem = showActionSheetBarButtonItem
        
        presentViewController(actionSheet, animated: true, completion: nil)
    }
}

