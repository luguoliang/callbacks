//
//  MainViewController.swift
//  ProtocolsDemo
//
//  Created by 路国良 on 16/1/28.
//  Copyright © 2016年 baofoo. All rights reserved.
//

import UIKit

class MainViewController: UIViewController,SecondViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        //NSNotificationCenter
         NSNotificationCenter.defaultCenter().addObserver(self, selector: "getTextfield:", name: "NotificationIdentifier", object: nil)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func button(sender: AnyObject) {
        self.performSegueWithIdentifier("pushViewIdentifier", sender: "this is a UIStoryboardSegue test")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "pushViewIdentifier"{
            let controller = segue.destinationViewController as! SecondViewController
            controller.delegate = self
            controller.itemString = sender as! String
            //Closures回调
            controller.ClosuresCallBack = {
                (fieldText) -> Void in
                print("Closures Callback success：\(fieldText)")
            }
    }
    }
           //protocol回调
    func getFieldText(textField:String) {
        print("protocol Callback success：\(textField)")
    }
    //NSNotification回调
    func getTextfield(notification:NSNotification){
        print("NSNotification Callback sucess:\(notification.object)")
        
    }

}
