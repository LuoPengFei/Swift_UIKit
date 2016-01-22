//
//  ViewController.swift
//  Swift_UIKit
//
//  Created by Pengfei_Luo on 16/1/21.
//  Copyright © 2016年 骆朋飞. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tableView : UITableView!
    let dataArray = ["UIAlertView","UIPickerView","ActionSheet"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initTableView() {
        tableView = UITableView(frame: self.view.bounds, style: .Plain)
        tableView.dataSource = self
        tableView.delegate = self
        self.view .addSubview(tableView)
    }
    
    
    func showAlertView() {
            if #available(iOS 8.0, *) {
                let alert = UIAlertController(title: "", message: "输入用户名 & 密码", preferredStyle: .Alert)
                alert.addTextFieldWithConfigurationHandler({ (textField : UITextField) -> Void in
                    textField.placeholder = "用户名"
                })
                alert.addTextFieldWithConfigurationHandler({ (textField : UITextField) -> Void in
                    textField.placeholder = "密码"
                    textField.secureTextEntry = true
                })
                
                let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: { (action : UIAlertAction) -> Void in
                    debugPrint("cancelAction")
                })
                alert.addAction(cancelAction)
                
                let loginAction = UIAlertAction(title: "Login", style: .Default, handler: { (action : UIAlertAction) -> Void in
                   let name = (alert.textFields?.first)! as UITextField
                    let passWord = (alert.textFields?.last)! as UITextField
                    
                    if name.text!.isEmpty || passWord.text!.isEmpty  {
                        let alert1 = UIAlertController(title: "", message: "请输入用户名&密码", preferredStyle: .Alert)
                        alert1.addAction(cancelAction)
                        let sureAction = UIAlertAction(title: "Sure", style: .Default, handler: { (action : UIAlertAction) -> Void in
                            debugPrint("suerButtonClicked")
                            self.presentViewController(alert, animated: true, completion: nil)
                        })
                        alert1.addAction(sureAction)
                        self.presentViewController(alert1, animated: true, completion: { () -> Void in
                            // do nothing
                        })
                    }
                    else {
                        debugPrint("name:\(name.text!) \n passWord:\(passWord.text!)")
                    }
                    
                })
                alert.addAction(loginAction)
                
                self.presentViewController(alert, animated: true, completion: nil)
            } else {
                // Fallback on earlier versions
                let alertView = UIAlertView(title: "提示", message: "clicked show alertView", delegate: self, cancelButtonTitle: "取消", otherButtonTitles: "确定")
                alertView.show()
            }
            
    }
    
}


extension ViewController : UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell")
        if (cell == nil) {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = dataArray[indexPath.row]
        return cell!;
    }
}

extension ViewController : UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        switch indexPath.row {
        case 0:
            showAlertView()
            break
        default:
            break
        }
    }
    
    
}

extension ViewController : UIAlertViewDelegate {
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        switch buttonIndex {
        case 0 :
            debugPrint("clicked buttonIndex at 0")
            break
        case 1 :
            debugPrint("clicked buttonIndex at 1")
            break
        default :
            break
        }
    }
}


