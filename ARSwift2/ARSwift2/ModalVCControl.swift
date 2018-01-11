//
//  ModalVCControl.swift
//  ARSwift2
//
//  Created by admindyn on 2018/1/11.
//  Copyright © 2018年 admindyn. All rights reserved.
//

import UIKit

class ModalVCControl: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
         self.view.backgroundColor = UIColor.brown
        
        let btnA:UIButton = UIButton.init(type: UIButtonType.custom)
        
        btnA.frame=CGRect(x:120,y:44,width:200,height:40)
        
        btnA.addTarget(self, action: #selector(ModalVCControl.doBack), for: UIControlEvents.touchUpInside)
        
        btnA.setTitle("返回上一页", for: UIControlState.normal)
        
        btnA.setTitleColor(UIColor.red, for: UIControlState.normal)
        
        self.view.addSubview(btnA)
        // Do any additional setup after loading the view.
    }

    @objc func doBack()  {
        self.dismiss(animated: false) {
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
