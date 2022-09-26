//
//  CoffeeTrigger.swift
//  CofferDelivery
//
//  Created by JerryLiu on 2022/9/23.
//

import Foundation
import ActivityKit

public class CoffeeTrigger {
    var statusActivity: Activity<CofferActivityAttributes>?
    
    public func startLiveActivities() -> Void {
        guard ActivityAuthorizationInfo().areActivitiesEnabled else {
            print("当前设备不可用Live Activities，用户关闭或者设备无法使用")
            return
        }
        
        let orderInfo = CofferOrderInfo(coffees: ["mocha","cappuccino"], orderId: "jerryliu1", userHead: "avatar", price: 36)
        let attribute = CofferActivityAttributes(totalDistance: 1000, orderInfo: orderInfo)
        let startState = CofferActivityAttributes.ContentState(finishDistance: 0, cofferStatus: .making, tips: "正在制作您的饮品")
        
        do {
            self.statusActivity = try Activity<CofferActivityAttributes>.request(attributes: attribute, contentState: startState, pushType: nil)
            print("开启Live Activities 成功 \(String(describing: self.statusActivity?.id))")
        } catch let e {
            print("开启Live Activities 失败，原因:\(e.localizedDescription)")
        }
    }
    
    public func startPushLiveActivities() -> Void {
        guard ActivityAuthorizationInfo().areActivitiesEnabled else {
            print("当前设备不可用Live Activities，用户关闭或者设备无法使用")
            return
        }
        
        let orderInfo = CofferOrderInfo(coffees: ["mocha","cappuccino"], orderId: "jerryliu1", userHead: "avatar", price: 36)
        let attribute = CofferActivityAttributes(totalDistance: 1000, orderInfo: orderInfo)
        let startState = CofferActivityAttributes.ContentState(finishDistance: 0, cofferStatus: .making, tips: "正在制作您的饮品")
        
        do {
            self.statusActivity = try Activity<CofferActivityAttributes>.request(attributes: attribute, contentState: startState, pushType: .token)
            
            print(self.statusActivity?.pushToken as Any)
            
            let pushTokenString = String(deviceToken: self.statusActivity?.pushToken ?? Data())
                    
            print("推送LiveActivities Token:\(String(describing: pushTokenString))")
            
            //开启监听
            let _ = self.listenForPushTokenChanged(activities: self.statusActivity)
            
        } catch let e {
            print("开启Live Activities 失败，原因:\(e.localizedDescription)")
        }
    }
    
    func listenForPushTokenChanged(activities:Activity<CofferActivityAttributes>?) -> Task<Void, Error>? {
        guard let activities = activities else { return nil }
        
        return Task.detached {
            for await tokenData in activities.pushTokenUpdates {
                let pushTokenString = String(deviceToken: tokenData)
                print("\(activities.id)新Token:\(String(describing: pushTokenString))")
                
                //发送这个ID和Token给后台服务器
            }
        }
    }
}

