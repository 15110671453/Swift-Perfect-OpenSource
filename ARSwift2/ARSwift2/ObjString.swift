//
//  ObjString.swift
//  ARSwift2
//
//  Created by admindyn on 2017/12/28.
//  Copyright © 2017年 admindyn. All rights reserved.
//

import UIKit

class ObjString: NSObject {
    
    func handleString(message:String)  {
        
        print("字符串 分为 可变字符串 与 不可变字符串 二者的区别 是 不可变字符不能进行拼接 追加 等修改")
        //不可变字符串 常量
        let str = message
        
        
        let flower:Character = "o"
        
        //可变字符串  非常量  可以拼接 追加
        var mutableStr:String = "开始 "
        
        mutableStr.append(flower)
        
        let start = mutableStr.startIndex
        
        let end = mutableStr.endIndex
        
        print(start)
        print(end)
        //let end2  = start.advancedBy()
        //let pre = end.predecessor()
        
        
        print(mutableStr)
        
        /*
         一个汉字 两个字节 两个汉字四个字节 按照字节数返回字符串个数
         显然不是 还是按照字符个数 一个unicode 字符串算一个字符
         */
        var mutableStr2:String = "开始"
        
        print(mutableStr2.characters.count)
        
        var mutableStr3:String = "\u{12}"
        
        print(mutableStr3.characters.count)
        
        var mutableStr4:String = "\u{1234}"
        
        print(mutableStr4.characters.count)
        
        let  docFolder = ["java.docx","javabean.docx","objective-c.xlsx","swift.docx"]

        var wordCount = 0
        
        for doc in docFolder {
            if doc.hasSuffix(".docx") {
                
                 wordCount = wordCount + 1
            }
        }
        
        
        print(wordCount)
        
        
    }
    
}
