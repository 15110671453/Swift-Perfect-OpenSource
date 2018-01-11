//
//  PopVCControl.swift
//  ARSwift2
//
//  Created by admindyn on 2018/1/11.
//  Copyright © 2018年 admindyn. All rights reserved.
//

import UIKit

class PopVCControl: UIViewController,UINavigationBarDelegate,UICollisionBehaviorDelegate{

    let imagV:UIImageView = UIImageView()
    
    var animator:UIDynamicAnimator?
    
    var gravity:UIGravityBehavior?
    
    var collision:UICollisionBehavior?
    
    var collisionXiFU:UICollisionBehavior?
    
    var attach:UIAttachmentBehavior?
    
    let attachPointer:UIImageView = UIImageView()
    
    
    let img2:UIImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
   
        //控制导航控制器原本默认的行为 与样式 需要代理
    
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        
        
         self.view.backgroundColor = UIColor.yellow
        
        
        imagV.frame = CGRect(x:100,y:80,width:50,height:50)
        imagV.backgroundColor = UIColor.red
        
        imagV.clipsToBounds = true
        
        imagV.layer.cornerRadius = 25
        
        self.view.addSubview(imagV)
        
        
        img2.frame = CGRect(x:200,y:80,width:50,height:50)
        img2.backgroundColor = UIColor.green
        
       
        
        self.view.addSubview(img2)
        
        attachPointer.frame = CGRect(x:200,y:280,width:20,height:20)
        attachPointer.backgroundColor = UIColor.cyan
        
        //attachPointer.clipsToBounds = true
        attachPointer.layer.cornerRadius = 10
        self.view.addSubview(attachPointer)
        
        /*
         UIDynamicAnimator 与 referenceView
         1:1 一个动画力场 只能 1 个对象 一个视图 绑定
         */
        
        self.animator = UIDynamicAnimator.init(referenceView: self.view)
        /*一个力学行为可以绑定多个 视图*/
        //重力行为
        self.gravity = UIGravityBehavior.init(items: [self.imagV,self.img2])

        /*
          默认重力 是向下 1.0 大小
         
         设置一个重力矢量 如果y轴方向为负数 则物体会向上运动
         */
        let gravityDirection:CGVector = CGVector.init(dx: 0.0, dy: 0.1)
        
        self.gravity?.gravityDirection = gravityDirection
        
        self.animator?.addBehavior(self.gravity!)
        
        //碰撞行为
        
         self.collision = UICollisionBehavior.init(items: [self.imagV,self.img2])
        
       
        
        
        self.collision?.translatesReferenceBoundsIntoBoundary = true
        
       /*设置碰撞线 如果不设置 默认碰撞线是屏幕*/ self.collision?.addBoundary(withIdentifier: "col1" as NSCopying, from: CGPoint(x:0,y:500), to: CGPoint(x:380,y:300))
        
        //
        
        self.collisionXiFU = UICollisionBehavior.init(items: [self.img2])
        
        let width = self.img2.frame.size.width
        
        let origin = self.img2.frame.origin
        
        self.collisionXiFU?.addBoundary(withIdentifier: "barrier" as NSCopying, from: origin, to: CGPoint(x:origin.x+width,y:origin.y))
        
        self.collisionXiFU?.translatesReferenceBoundsIntoBoundary = true
        
        self.collisionXiFU?.collisionDelegate = self
       
       /*
         一个动画力场 可以添加 都个力学行为
         */
        self.animator?.addBehavior(self.collision!)
        
        self.animator?.addBehavior(self.collisionXiFU!)
        
        // Do any additional setup after loading the view.
    }
    
    
    //MARK:碰撞检测 代理 为了 重力 落下过程 碰撞到某物体 吸附它
    
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint)
    {
        //设置吸附行为
        
        self.attach = UIAttachmentBehavior(item:self.attachPointer,attachedTo:self.img2)
        
        self.animator?.addBehavior(self.attach!)
        
    }
    
    //MARK:NAVgationBarDelegate
    
    /*
     NavBarControl的根级controller 不受此代理影响
     */
    
    func navigationBar(_ navigationBar: UINavigationBar, shouldPush item: UINavigationItem) -> Bool {
        
        print("NavBarControl的根级controller 不受此代理影响-shouldpush ")
        return true
    }
    
    func navigationBar(_ navigationBar: UINavigationBar, shouldPop item: UINavigationItem) -> Bool {
        
        print("NavBarControl的根级controller 不受此代理影响-shouldpop ")
        return true
    }
    
    func navigationBar(_ navigationBar: UINavigationBar, didPop item: UINavigationItem) {
        
    }
    
    func navigationBar(_ navigationBar: UINavigationBar, didPush item: UINavigationItem) {
        
    }
    //MARK:NAVControlDelegate
    
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        //MARK:自定义转场动画
        switch operation {
        case .pop:
            
            print("执行pop动画")
            
            return nil
            
        case .push:
            
            print("执行push动画")
            
            return nil
            
            
        default:
            
            print("不知道什么情况")
            
            return nil
            
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
