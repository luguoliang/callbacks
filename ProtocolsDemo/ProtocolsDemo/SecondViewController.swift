//
//  SecondViewController.swift
//  ProtocolsDemo
//
//  Created by 路国良 on 16/1/28.
//  Copyright © 2016年 baofoo. All rights reserved.
//

import UIKit

protocol ProtocolTest{
    func getFieldText(fieldText:String)
    }

class SecondViewController: UIViewController,UITextFieldDelegate {
    
    var itemString:String = ""{
        willSet{
            print("willSet itemString = \(itemString)")
        }
        didSet{
            print("didSet itemString = \(itemString)")
        }
    }
    
    var ClosuresCallBack:((fieldText:String)->(Void))?
    
    var delegate:ProtocolTest!
    
    @IBOutlet weak var textField: UITextField!

    @IBAction func button(sender: AnyObject) {
        delegate?.getFieldText(textField.text!)//protocol
        if ClosuresCallBack != nil{ //Closures
            ClosuresCallBack!(fieldText: textField.text!)
        }
        //NSNotificationCenter
        NSNotificationCenter.defaultCenter().postNotificationName("NotificationIdentifier", object: textField.text)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
