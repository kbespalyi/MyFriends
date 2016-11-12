//
//  ViewController.swift
//  MyFriends
//
//  Created by mobile apps on 2016-11-05.
//  Copyright © 2016 mobile apps. All rights reserved.
//

import UIKit
import Foundation

extension String {
    func isPostalCode() -> Bool {
        let regex = try! NSRegularExpression(pattern: "^[A-Z][0-9][A-Z] ?[0-9][A-Z][0-9]$",
            options: [.CaseInsensitive])
        
        return regex.firstMatchInString(self, options:[],
            range: NSMakeRange(0, utf16.count)) != nil
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfAge: UITextField!
    @IBOutlet weak var tfPostalCode: UITextField!
    @IBOutlet weak var tfList: UILabel!
    
    @IBAction func btAddFriendClick(sender: AnyObject) {
        let name = tfName.text!
        let age = Int(tfAge.text!)
        let postalCode = tfPostalCode.text!
        
        if (name.isEmpty) {
            showAlert("Name is empty", title: "Error inputs")
            return
        } else if (age < 0 || age > 150) {
            showAlert("Age must be in 0 to 150", title: "Error inputs")
            return
        } else if (postalCode.isEmpty || !postalCode.isPostalCode()) {
            showAlert("Postal code is wrong or empty", title: "Error inputs")
            return
        } else {
            //let emailPat = "\\b([a-z])\\.([a-z]{2,})@([a-z]+)\\.ac\\.uk\\b";
        }
        addRecordTo("\(name) : \(age!) : \(postalCode)")
        tfName.text = ""
        tfAge.text = ""
        tfPostalCode.text = ""
        showAlert("Record has been added", title: "OK")
    }
    
    func addRecordTo(record: String) {
        let list = tfList.text!
        tfList.text = list + record + "\n"
    }
    
    func showAlert(msg: String, title: String) {
        let alertController = UIAlertController(
            title: title,
            message: msg,
            preferredStyle: .Alert
        )
        alertController.addAction(UIAlertAction(title: "OK", style: .Default) {
            (action: UIAlertAction!) in
            print("ok clicked")
            })
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

