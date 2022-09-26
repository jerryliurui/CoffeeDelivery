//
//  CofferActivityAttributes.swift
//  CofferDelivery
//
//  Created by JerryLiu on 2022/9/23.
//

import Foundation

import WidgetKit
import ActivityKit

enum CofferStatus : Int, Codable {
    case making
    case sending
    case done
}

struct CofferActivityAttributes: ActivityAttributes {
    public typealias CofferDeliveryStatus = ContentState
  
    public struct ContentState: Codable, Hashable {
        var finishDistance: Double//骑手距离
        var cofferStatus: CofferStatus//咖啡状态
        var tips: String
    }
  
    var totalDistance: Double//总共距离
    var orderInfo: CofferOrderInfo//订单详情
}
