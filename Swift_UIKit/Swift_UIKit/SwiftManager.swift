//
//  SwiftManager.swift
//  Swift_UIKit
//
//  Created by Pengfei_Luo on 16/1/22.
//  Copyright © 2016年 骆朋飞. All rights reserved.
//

import Foundation
import UIKit

public class SwiftManager : NSObject {
    
    /// 获取系统版本号
    public class func getSystemVersion() -> String {
        return UIDevice.currentDevice().systemVersion
    }
    
    
    
}
